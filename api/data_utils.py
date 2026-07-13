import json
import numpy as np
import pandas as pd
import seaborn as sns

sns.set_theme(style="whitegrid")

def process_raw_json(docs):
    """Elabora una lista di dizionari JSON e restituisce il DataFrame raw."""
    docs = [docs] if isinstance(docs, dict) else docs
    dataset_rows = []
    
    for doc in docs:
        planning_date_str = doc.get('planningDate', {}).get('$date')
        if not planning_date_str or not doc.get('agenda'):
            continue
            
        planning_date = pd.to_datetime(planning_date_str).tz_localize(None)
        agenda = doc['agenda']
        
        unique_patients = {item.get('patient', {}).get('id') for item in agenda if item.get('patient')}
        unique_operators = {item.get('operator', {}).get('id') for item in agenda if item.get('operator')}
        num_ops = len(unique_operators)
        density_ratio = (len(unique_patients) / num_ops) if num_ops > 0 else np.nan
        
        for item in agenda:
            operator = item.get('operator', {})
            patient = item.get('patient', {})
            aid_needs = patient.get('aidNeeds')
            needs_lifter = 1 if pd.notnull(aid_needs) and str(aid_needs).lower() != 'none' else 0
                
            dataset_rows.append({
                'planning_date': planning_date,
                'operator_id': operator.get('id'),
                'op_jobKind': operator.get('jobKind'),
                'op_burdenScore': operator.get('burdenScore'),
                'op_qualifications_count': len(operator.get('qualifications', [])),
                'op_has_CN': 1 if 'CN' in operator.get('qualifications', []) else 0,
                'density_ratio': density_ratio,
                'needs_lifter': needs_lifter,
                'target_assignments': operator.get('assignments', 0)
            })
            
    return pd.DataFrame(dataset_rows)


def extract_from_json(file_paths):
    """Legge dai file JSON e usa la nuova funzione process_raw_json."""
    all_docs = []
    for file_path in file_paths:
        with open(file_path, 'r', encoding='utf-8') as f:
            docs = json.load(f)
            if isinstance(docs, list):
                all_docs.extend(docs)
            else:
                all_docs.append(docs)
    return process_raw_json(all_docs)


def aggregate_to_operator_day(df):
    """
    Trasforma il dataset portandolo all'unità statistica 'Operatore-Giorno'.
    Calcola le metriche di contesto aggregate.
    """
    df = df.copy()
    
    # 1. Feature di contesto temporale
    df['day_of_week'] = df['planning_date'].dt.day_name()
    
    # 2. Calcolo percentuale giornaliera sollevatori
    daily_lifter = df.groupby('planning_date')['needs_lifter'].mean().reset_index(name='daily_lifter_ratio')
    df = df.merge(daily_lifter, on='planning_date', how='left')
    
    # 3. Aggregazione finale: una riga per ogni operatore in una specifica giornata
    agg_rules = {
        'op_jobKind': 'first',
        'op_burdenScore': 'first',
        'op_qualifications_count': 'first',
        'op_has_CN': 'first',
        'density_ratio': 'first',
        'daily_lifter_ratio': 'first',
        'day_of_week': 'first',
        'target_assignments': 'first' # Prende il numero limite corretto per la giornata
    }
    
    df_agg = df.groupby(['planning_date', 'operator_id'], as_index=False).agg(agg_rules)
    
    # Drop records senza operatore o con target nullo
    df_agg = df_agg.dropna(subset=['operator_id', 'target_assignments'])
    
    return df_agg


def generate_physical_instance(data_input, target_date, output_filename):
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
        
    asp_lines = [f"% --- FATTI FISICI DELLA GIORNATA: {target_date} ---"]
    
    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        agenda = doc.get('agenda', [])
        
        # 1. ESTRAZIONE OPERATORI
        asp_lines.append("% --- OPERATORI ---")
        for op in board:
            op_id = op.get('id')
            eff_time = op.get('effectiveTime', 0) // 10
            is_pt = 1 if 'part-time' in str(op.get('jobKind', '')).lower() else 0
            max_pats = (eff_time // 3) if eff_time > 0 else 10 
            
            quals = op.get('qualifications', [])
            limit_n = max_pats if 'N' in quals else 0
            limit_o = max_pats if 'O' in quals else 0
            limit_cp = max_pats if 'CP' in quals else 0
            limit_cn = max_pats if 'CN' in quals else 0
            limit_mac = max_pats if 'MAC' in quals else 0
            
            asp_lines.append(
                f"operator({op_id}, {eff_time}, {is_pt}, {max_pats}, "
                f"{limit_n}, {limit_n}, {limit_n}, {limit_n}, "
                f"{limit_o}, {limit_o}, {limit_o}, {limit_o}, "
                f"{limit_cp}, {limit_cn}, {limit_mac})."
            )
        asp_lines.append("operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).\n")

        # 2. ESTRAZIONE PAZIENTI E PREFERENZE
        asp_lines.append("% --- PAZIENTI E PREFERENZE ---")
        all_patients = unassigned.copy()
        for op in board:
            all_patients.extend(op.get('patients', []))
            
        seen_pats = set()
        for pat in all_patients:
            pat_id = pat.get('id')
            if pat_id in seen_pats:
                continue
            seen_pats.add(pat_id)
            
            p_type_str = pat.get('type', '')
            type_map = {'N': 1, 'O': 2, 'A': 3, 'CP': 4, 'CN': 5, 'MAC': 6}
            p_type = type_map.get(p_type_str, 1)
            
            is_paying = 2 if 'ssn' in str(pat.get('statusStr', '')).lower() else 1
            needs_aid = 0 if str(pat.get('aidNeeds')).lower() in ['none', 'null', '', 'false'] else 1
            min_len = pat.get('overallMinLength', 60) // 10
            
            asp_lines.append(f"patient({pat_id}, {p_type}, {is_paying}, {needs_aid}, {min_len}).")
            
            # --- ESTRAZIONE PREFERENZE ---
            asp_lines.append(f"pref(-1, {pat_id}, 10, 1).")
            
            pref_ops = pat.get('preferredOps', [])
            for weight, ops_group in enumerate(pref_ops):
                if isinstance(ops_group, list):
                    for pref_op_id in ops_group:
                        asp_lines.append(f"pref({pref_op_id}, {pat_id}, {weight}, 1).")
        asp_lines.append("\n")

        # 3. ESTRAZIONE SESSIONI
        asp_lines.append("% --- SESSIONI CLINICHE ---")
        seen_sessions = set()
        for item in agenda:
            sess = item.get('session')
            pat = item.get('patient')
            
            if not sess or not pat:
                continue
                
            sess_id = sess.get('id')
            if sess_id in seen_sessions:
                continue
            seen_sessions.add(sess_id)
            
            pat_id = pat.get('id')
            min_len = sess.get('minLength', 60) // 10
            
            loc_str = str(sess.get('location', '1')).strip()
            loc = loc_str if loc_str.isdigit() else 1 
            
            asp_lines.append(f"session({sess_id}, {pat_id}, {min_len}, {loc}).")

    with open(output_filename, 'w') as f:
        f.write("\n".join(asp_lines))

def generate_clingo_facts(X_test, y_test, q10, q50, q90, original_ids, output_filename):
    df_facts = pd.DataFrame({
        'operator_id': original_ids,
        'predicted_assignments': np.round(q50).astype(int),
        'actual_assignments': y_test.values,
        'uncertainty_score': q90 - q10,
        'op_burdenScore': X_test['op_burdenScore'].values 
    })
    
    df_facts['ConfLevel'] = pd.qcut(df_facts['uncertainty_score'].rank(method='first'), q=4, labels=[1, 2, 3, 4]).astype(int)
    
    asp_lines = [
        "% --- FATTI GENERATI DAL MACHINE LEARNING ---",
        "% Formato: ml_capacity(OP_ID, PRED_N, CONF_LEVEL).",
        "% Formato: operator_burden(OP_ID, BURDEN_SCORE).",
    ]
    
    for _, row in df_facts.iterrows():
        op_id = str(row['operator_id']).replace('.0', '')
        if op_id != '-1':
            asp_lines.append(f"ml_capacity({op_id}, {int(row['predicted_assignments'])}, {int(row['ConfLevel'])}).")
            asp_lines.append(f"operator_burden({op_id}, {int(row['op_burdenScore'])}).")
        
    with open(output_filename, 'w') as f:
        f.write("\n".join(asp_lines))
        
    return df_facts