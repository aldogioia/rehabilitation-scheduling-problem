import json
import numpy as np
import pandas as pd

# =====================================================================
# 1. GENERATORE BASELINE (Codice Originale Prof)
# =====================================================================
def generate_baseline_facts(data_input, target_date, output_filename):
    """
    Genera i fatti con l'arità estesa originale (15 argomenti per operatore, 5 per paziente)
    e inonda il file di preferenze esplicite a 0, essenziali per far funzionare la Choice Rule 
    del vecchio codice ASP senza mandarlo in loop.
    """
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
    asp_lines = [f"% --- FATTI FISICI BASELINE: {target_date} ---"]
    
    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        agenda = doc.get('agenda', [])
        
        # --- OPERATORI (Arità 15) ---
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

        # --- PAZIENTI E PREFERENZE (Arità 4 con PREF=0) ---
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
            
            # Preferenze
            pref_ops_raw = pat.get('preferredOps', [])
            preferred_set = set()
            for weight, ops_group in enumerate(pref_ops_raw):
                if isinstance(ops_group, list):
                    for pref_op_id in ops_group:
                        preferred_set.add(pref_op_id)
                        asp_lines.append(f"pref({pref_op_id}, {pat_id}, {weight + 1}, 1).")
                        
            asp_lines.append(f"pref(-1, {pat_id}, 10, 1).")
            
            # Ripieghi espliciti (Necessari per la Baseline)
            for op in board:
                op_id = op.get('id')
                if op_id not in preferred_set:
                    asp_lines.append(f"pref({op_id}, {pat_id}, 10, 0).")
        asp_lines.append("\n")

        # --- SESSIONI (Arità 4) ---
        asp_lines.append("% --- SESSIONI CLINICHE ---")
        seen_sessions = set()
        for item in agenda:
            sess = item.get('session')
            pat = item.get('patient')
            if not sess or not pat: continue
            sess_id = sess.get('id')
            if sess_id in seen_sessions: continue
            seen_sessions.add(sess_id)
            
            pat_id = pat.get('id')
            min_len = sess.get('minLength', 60) // 10
            loc_str = str(sess.get('location', '1')).strip()
            loc = loc_str if loc_str.isdigit() else 1 
            
            asp_lines.append(f"session({sess_id}, {pat_id}, {min_len}, {loc}).")

    with open(output_filename, 'w') as f:
        f.write("\n".join(asp_lines))

# =====================================================================
# 2. GENERATORE MACHINE LEARNING (Dati Relazionali Snelli)
# =====================================================================
def generate_ml_facts(data_input, target_date, output_filename):
    """
    Genera fatti minimali, purificati e relazionali.
    Nessun prodotto cartesiano, nessuna arità infinita, niente PREF a 0.
    """
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
    asp_lines = [f"% --- FATTI FISICI ML: {target_date} ---"]
    type_map = {'N': 1, 'O': 2, 'A': 3, 'CP': 4, 'CN': 5, 'MAC': 6}
    
    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        
        # --- OPERATORI E QUALIFICHE (Modello Relazionale Puro) ---
        asp_lines.append("% --- OPERATORI E QUALIFICHE ---")
        for op in board:
            op_id = op.get('id')
            eff_time = op.get('effectiveTime', 0) // 10
            max_pats = (eff_time // 3) if eff_time > 0 else 10 
            
            asp_lines.append(f"operator({op_id}, {max_pats}).")
            
            for q in op.get('qualifications', []):
                if q in type_map:
                    asp_lines.append(f"op_qual({op_id}, {type_map[q]}).")
                    
        asp_lines.append("operator(-1, 100).\n")

        # --- PAZIENTI E PREFERENZE STORICHE ---
        asp_lines.append("% --- PAZIENTI ---")
        all_patients = unassigned.copy()
        for op in board:
            all_patients.extend(op.get('patients', []))
            
        seen_pats = set()
        for pat in all_patients:
            pat_id = pat.get('id')
            if pat_id in seen_pats:
                continue
            seen_pats.add(pat_id)
            
            p_type = type_map.get(pat.get('type', ''), 1)
            asp_lines.append(f"patient({pat_id}, {p_type}).")
            
            # Solo preferenze storiche reali (Arità 3)
            pref_ops = pat.get('preferredOps', [])
            for weight, ops_group in enumerate(pref_ops):
                if isinstance(ops_group, list):
                    for pref_op_id in ops_group:
                        asp_lines.append(f"pref({pref_op_id}, {pat_id}, {weight + 1}).")
                        
            asp_lines.append(f"pref(-1, {pat_id}, 10).")
            
    with open(output_filename, 'w') as f:
        f.write("\n".join(asp_lines))


# =====================================================================
# 3. GENERATORE PREDIZIONI ML (Invariato)
# =====================================================================
def generate_clingo_facts(X_test, predictions_dict, original_ids, output_filename):
    """
    Legge il dizionario delle predizioni TabPFN e genera ml_capacity.
    """
    asp_lines = ["% --- FATTI PREDITTIVI DEL MACHINE LEARNING ---"]
    target_to_id = {'target_assN': 1, 'target_assO': 2, 'target_assA': 3, 'target_assCP': 4, 'target_assCN': 5, 'target_assMAC': 6}
    
    for target_name, preds in predictions_dict.items():
        q10, q50, q90 = preds['q10'], preds['q50'], preds['q90']
        df_facts = pd.DataFrame({
            'operator_id': original_ids,
            'predicted_assignments': np.round(q50).astype(int),
            'uncertainty_score': q90 - q10
        })
        
        if len(df_facts) >= 4:
            try:
                df_facts['ConfLevel'] = pd.qcut(df_facts['uncertainty_score'].rank(method='first'), q=4, labels=[1, 2, 3, 4]).astype(int)
            except ValueError:
                df_facts['ConfLevel'] = 2
        else:
            df_facts['ConfLevel'] = 2 
        
        for _, row in df_facts.iterrows():
            op_id = str(row['operator_id']).replace('.0', '')
            pred_val = int(row['predicted_assignments'])
            
            if op_id != '-1':
                if target_name == 'target_assignments':
                    asp_lines.append(f"ml_capacity({op_id}, {pred_val}, {int(row['ConfLevel'])}).")
                else:
                    type_id = target_to_id.get(target_name)
                    if type_id:
                        asp_lines.append(f"ml_capacity({op_id}, {type_id}, {pred_val}, {int(row['ConfLevel'])}).")
                
    with open(output_filename, 'w') as f:
        f.write("\n".join(asp_lines))


def generate_agenda_final_facts(board_assignments, data_input, target_date, output_filename=None):
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
    asp_lines = [f"% -------- FATTI AGENDA: {target_date} --------\n"]
    
    def time_to_slot(t_str):
        if not t_str or not isinstance(t_str, str): return None
        try:
            h, m = map(int, t_str.split(':'))
            return (h * 60 + m) // 10
        except:
            return None

    # Creiamo un dizionario veloce per mappare il paziente/sessione all'operatore predetto dal ML
    # key: patient_id (o session_id), value: operator_id
    ml_op_map = {ass['patient_id']: ass['operator_id'] for ass in board_assignments}

    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        agenda = doc.get('agenda', [])
        
        # 1. PAZIENTI
        asp_lines.append("% --- Pazienti ---")
        pat_dict = {p.get('id'): p for p in doc.get('patients', []) + unassigned}
        for op in board:
            for p in op.get('patients', []):
                pat_dict[p.get('id')] = p
                
        for p_id, p in pat_dict.items():
            if p_id is None: continue
            aut = 1 if p.get('autonomous', False) else 0
            min_time = p.get('overallMinLength', 60) // 10
            asp_lines.append(f"patient({p_id}, {aut}, {min_time}).")

        # 2. LOCATIONS
        asp_lines.append("\n% --- Locations ---")
        macro_locs = doc.get('macroLocations', doc.get('locations', []))
        for m_loc in macro_locs:
            for loc in m_loc.get('locations', [m_loc]):
                l_id = str(loc.get('id', '1')).lower().replace('-', '_')
                cap_arr = loc.get('capacity', [1, 1])
                cap_morn = cap_arr[0] if isinstance(cap_arr, list) and len(cap_arr) > 0 else 1
                cap_aft = cap_arr[1] if isinstance(cap_arr, list) and len(cap_arr) > 1 else 1
                if cap_morn == 0: cap_morn = 5 
                if cap_aft == 0: cap_aft = 5
                
                asp_lines.append(f"location({l_id}, {cap_morn}, 1, 0, 72).")
                asp_lines.append(f"location({l_id}, {cap_aft}, 2, 72, 144).")

        # 3. SESSIONI ED ASSEGNAMENTI (Arity 11)
        asp_lines.append("\n% --- Sessioni (Arity 11) ---")
        seen_sessions = set()
        for item in agenda:
            sess = item.get('session', {})
            pat = item.get('patient', {})
            if not sess or not pat: continue
            
            sess_id = sess.get('id')
            pat_id = pat.get('id')
            if sess_id is None or pat_id is None or sess_id in seen_sessions: continue
            seen_sessions.add(sess_id)
            
            # Qui iniettiamo l'operatore predetto dal ML! Se non c'è, mettiamo -1.
            op_id = ml_op_map.get(pat_id, -1)
            
            loc_str = str(sess.get('location', '1')).strip().lower().replace('-', '_')
            loc = loc_str if loc_str else "1"
            typ = sess.get('type', 0)
            min_len = sess.get('minLength', 60) // 10
            ideal_len = sess.get('idealLength', 60) // 10
            per = 1 if sess.get('idealPeriod') == 'MORNING' else 0 # Gestisci mappatura periodi se necessaria
            tim = (sess.get('idealTime', 0) or 0) // 10
            opt = 1 if sess.get('optional', False) else 0
            pri = pat.get('category', {}).get('priority', 1)
            
            asp_lines.append(f"session({sess_id}, {pat_id}, {op_id}, {loc}, {typ}, {min_len}, {ideal_len}, {per}, {tim}, {opt}, {pri}).")
            
            # Generiamo direttamente sessionLocation (Arity 3) come fa il prof
            mac = str(item.get('macroLocationId', loc)).lower().replace('-', '_')
            asp_lines.append(f"sessionLocation({sess_id}, {loc}, {mac}).")

        # 4. TURNI OPERATORI
        asp_lines.append("\n% --- Turni Operatori ---")
        for op in board:
            op_id = op.get('id')
            if op_id is None: continue
            opt_times = op.get('operatingTimes', [])
            for idx, period_data in enumerate(opt_times):
                per = idx + 1
                sta = time_to_slot(period_data.get('start'))
                end = time_to_slot(period_data.get('end'))
                if sta is not None and end is not None and end > sta:
                    asp_lines.append(f"period({per}, {op_id}, {sta}, {end}).")
                    asp_lines.append(f"time({per}, {op_id}, {sta}..{end-1}).")

    asp_content = "\n".join(asp_lines)
    if output_filename:
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(asp_content)
    return asp_content


def generate_board_assignment_facts(board_assignments, output_filename=None):
    """
    Genera i fatti ASP relativi esclusivamente alle sessioni e agli 
    assegnamenti predetti/calcolati dalla fase di Board.
    """
    asp_lines = ["% -------- FATTI GENERATI DALLA FASE DI BOARD --------\n"]
    
    for idx, assignment in enumerate(board_assignments):
        ses_id = assignment.get('session_id', idx)
        pat = assignment.get('patient_id')
        ope = assignment.get('operator_id')
        loc = assignment.get('macro_location_id', assignment.get('location', 1))
        typ = assignment.get('type', 0)
        
        # Gestione conversioni unità temporali se espresse in minuti
        min_len = assignment.get('min_len', 60)
        if min_len > 20:
            min_len = min_len // 10
            
        ideal_len = assignment.get('ideal_len', min_len)
        if ideal_len > 20:
            ideal_len = ideal_len // 10
            
        per = assignment.get('period', 1)
        tim = assignment.get('time_ideal', 0)
        opt = assignment.get('optional', 0)
        pri = assignment.get('priority', 1)
        
        # Fatti di sessione estesi generati dal Board
        asp_lines.append(f"session({ses_id}, {pat}, {ope}, {loc}, {typ}, {min_len}, {ideal_len}, {per}, {tim}, {opt}, {pri}).")
        asp_lines.append(f"sessionLocation({ses_id}, {loc}, {loc}).")
        
        if ope is not None and ope != -1:
            asp_lines.append(f"board_assignment({ope}, {pat}, {ses_id}).")
            
    asp_content = "\n".join(asp_lines)
    
    if output_filename:
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(asp_content)
            
    return asp_content