import json
import numpy as np
import pandas as pd

def process_raw_json(docs):
    """
    Elabora una lista di dizionari JSON. 
    1. Estrae le feature classiche in modo "antiproiettile" contro i valori nulli.
    2. Calcola i target REALI aggregati per macro-area clinica.
    3. Costruisce il DataFrame finale.
    """
    docs = [docs] if isinstance(docs, dict) else docs
    dataset_rows = []
    
    for doc in docs:
        planning_date_node = doc.get('planningDate') or {}
        planning_date_str = planning_date_node.get('$date')
        
        if not planning_date_str or not doc.get('agenda'):
            continue
            
        planning_date = pd.to_datetime(planning_date_str).tz_localize(None)
        agenda = doc['agenda']
        
        unique_patients = {}
        unique_operators = {}
        op_popularity = {}

        total_demand_mins = 0
        total_capacity_mins = 0
        neuro_count, ortho_count, mac_count = 0, 0, 0
        
        # 1. Ricognizione Operatori e Pazienti (Safe extraction)
        for item in agenda:
            pat = item.get('patient')
            op = item.get('operator')
            sess = item.get('session', {})
            
            # Assicuriamoci che pat e op siano effettivamente dei dizionari validi e non 'null'
            if isinstance(pat, dict) and pat.get('id'):
                unique_patients[pat['id']] = pat
                total_demand_mins += sess.get('duration', 0) # Calcolo domanda totale
            if isinstance(op, dict) and op.get('id'):
                unique_operators[op['id']] = op
                
        # Calcolo Density Ratio
        num_ops = len(unique_operators)
        density_ratio = (len(unique_patients) / num_ops) if num_ops > 0 else 0

        # Calcolo Capacità Totale
        for op in unique_operators.values():
            total_capacity_mins += op.get('effectiveTime', 0)
            op_popularity[op['id']] = 0 # Inizializza popolarità
            
        # Calcolo Patient Mix e Popolarità
        for p in unique_patients.values():
            if not isinstance(p, dict): continue
            
            p_type = str(p.get('type', '')).upper()
            if p_type == 'N': neuro_count += 1
            elif p_type == 'O': ortho_count += 1
            elif 'MAC' in p_type: mac_count += 1
                
            # Conteggio popolarità operatori dalle preferenze
            for pref_list in p.get('preferredOps', []):
                for pref_op_id in pref_list:
                    if pref_op_id in op_popularity:
                        op_popularity[pref_op_id] += 1
        
        # Calcolo Daily Lifter Ratio (Antiproiettile)
        lifter_count = 0
        for p in unique_patients.values():
            if not isinstance(p, dict): 
                continue # Salta se il paziente è stranamente nullo
                
            aid = str(p.get('aidNeeds', '')).lower()
            if aid not in ['none', 'null', '']:
                lifter_count += 1
        daily_lifter_ratio = lifter_count / len(unique_patients) if len(unique_patients) > 0 else 0

        # Ratios e Index di Giornata
        num_pats = len(unique_patients)
        workload_pressure_index = (total_demand_mins / total_capacity_mins) if total_capacity_mins > 0 else 0
        daily_perc_neuro = (neuro_count / num_pats) if num_pats > 0 else 0
        daily_perc_ortho = (ortho_count / num_pats) if num_pats > 0 else 0
        daily_perc_mac = (mac_count / num_pats) if num_pats > 0 else 0

        # 2. Inizializzazione dati per singolo operatore
        op_data = {}
        for op_id in unique_operators.keys():
            op_data[op_id] = {
                'priorities': [],
                'assN': 0, 'assO': 0, 'assMAC': 0, 'assCP': 0, 'assCN': 0, 'total': 0
            }

        # 3. Scansione Agenda: Calcolo Target Reali e Priorità
        for item in agenda:
            op_id = item.get('operator', {}).get('id') if isinstance(item.get('operator'), dict) else None
            pat = item.get('patient')
            
            if not op_id or not isinstance(pat, dict): 
                continue
            
            # Salvataggio priorità in modo sicuro (or {} previene il crash se category è null)
            category = pat.get('category') or {}
            priority = category.get('priority', np.nan)
            if pd.notnull(priority):
                op_data[op_id]['priorities'].append(priority)
            
            # Conteggio Macro-Target Reale
            op_data[op_id]['total'] += 1
            p_type = str(pat.get('type', '')).upper()
            
            if p_type == 'N': op_data[op_id]['assN'] += 1
            elif p_type == 'O': op_data[op_id]['assO'] += 1
            elif p_type == 'CP': op_data[op_id]['assCP'] += 1
            elif p_type == 'CN': op_data[op_id]['assCN'] += 1
            elif 'MAC' in p_type: op_data[op_id]['assMAC'] += 1

        # 4. Creazione Righe Finali
        for op_id, operator in unique_operators.items():
            if not isinstance(operator, dict): 
                continue
                
            quals = operator.get('qualifications', [])
            priorities = op_data[op_id]['priorities']
            avg_priority = sum(priorities) / len(priorities) if len(priorities) > 0 else 3.0
            
            row = {
                'planning_date': planning_date,
                'operator_id': op_id,
                
                # Feature di Qualifica
                'op_jobKind': 0 if str(operator.get('jobKind')).lower() in ['full-time', 'ft'] else 1,
                'op_qualifications_count': len(quals),
                'op_effectiveTime': operator.get('effectiveTime', 0),
                'op_popularity_score': op_popularity.get(op_id, 0),
                'op_has_N': 1 if 'N' in quals else 0,
                'op_has_O': 1 if 'O' in quals else 0,
                'op_has_CP': 1 if 'CP' in quals else 0,
                'op_has_CN': 1 if 'CN' in quals else 0,
                'op_has_MAC': 1 if any('MAC' in q for q in quals) else 0,
                
                # Feature Ingegnerizzate
                'workload_pressure_index': workload_pressure_index,
                'daily_perc_neuro': daily_perc_neuro,
                'daily_perc_ortho': daily_perc_ortho,
                'daily_perc_mac': daily_perc_mac,

                
                'avg_patient_priority': avg_priority,
                'density_ratio': density_ratio,
                'daily_lifter_ratio': daily_lifter_ratio,
                
                # --- MACRO TARGET REALI ---
                'target_assN': op_data[op_id]['assN'],
                'target_assO': op_data[op_id]['assO'],
                'target_assCP': op_data[op_id]['assCP'],
                'target_assCN': op_data[op_id]['assCN'],
                'target_assMAC': op_data[op_id]['assMAC'],
                'target_assignments': op_data[op_id]['total']
            }
            dataset_rows.append(row)
            
    return pd.DataFrame(dataset_rows)


def extract_from_json(file_paths):
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
    Aggiunge il day_of_week e pulisce il dataset.
    """
    df = df.copy()
    df = df.dropna(subset=['operator_id', 'target_assignments'])
    return df