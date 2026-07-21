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


import json

def generate_agenda_baseline_facts(board_assignment, data_input, target_date, output_filename=None):
    """
    Genera i fatti ASP per l'Agenda estraendo tutte le informazioni necessarie 
    (pazienti, location, turni, indisponibilità e sessioni/agenda) dal dataset JSON.
    """
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
    asp_lines = [f"% -------- FATTI BASELINE AGENDA: {target_date} --------\n"]
    
    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        # 1. PAZIENTI
        asp_lines.append("% --- Pazienti ---")
        patients = doc.get('patients', [])
        for p in patients:
            p_id = p.get('id')
            autonomy = p.get('autonomy', p.get('aut', 0))
            min_time = p.get('minTime', p.get('min', 0))
            asp_lines.append(f"patient({p_id}, {autonomy}, {min_time}).")
            
        # 2. LOCATIONS
        asp_lines.append("\n% --- Locations ---")
        locations = doc.get('locations', doc.get('macroLocations', []))
        for loc in locations:
            l_id = loc.get('id')
            cap = loc.get('capacity', loc.get('cap', 1))
            per = loc.get('period', loc.get('per', 1))
            sta = loc.get('start', loc.get('sta', 0)) // 10 if loc.get('start', 0) > 20 else loc.get('start', 0)
            end = loc.get('end', loc.get('end', 144)) // 10 if loc.get('end', 144) > 20 else loc.get('end', 144)
            asp_lines.append(f"location({l_id}, {cap}, {per}, {sta}, {end}).")
            
        # 3. TURNI OPERATORI (Period & Time)
        asp_lines.append("\n% --- Turni Operatori ---")
        shifts = doc.get('operatorShifts', doc.get('shifts', []))
        for shift in shifts:
            ope_id = shift.get('operatorId', shift.get('ope'))
            per = shift.get('period', shift.get('per', 1))
            sta = shift.get('start', shift.get('sta', 0)) // 10 if shift.get('start', 0) > 20 else shift.get('start', 0)
            end = shift.get('end', shift.get('end', 0)) // 10 if shift.get('end', 0) > 20 else shift.get('end', 0)
            
            if ope_id is not None:
                asp_lines.append(f"period({per}, {ope_id}, {sta}, {end}).")
                asp_lines.append(f"time({per}, {ope_id}, {sta}..{end}).")

        # 4. INDISPONIBILITÀ (Forbidden)
        asp_lines.append("\n% --- Indisponibilità ---")
        unavailabilities = doc.get('patientUnavailabilities', doc.get('forbidden', []))
        for forb in unavailabilities:
            pat_id = forb.get('patientId', forb.get('pat'))
            per = forb.get('period', forb.get('per', 1))
            sta = forb.get('start', forb.get('sta', 0)) // 10 if forb.get('start', 0) > 20 else forb.get('start', 0)
            end = forb.get('end', forb.get('end', 0)) // 10 if forb.get('end', 0) > 20 else forb.get('end', 0)
            
            if pat_id is not None:
                asp_lines.append(f"forbidden({pat_id}, {per}, {sta}, {end}).")

        # 5. SESSIONI ED AGENDA REALIZZATA
        asp_lines.append("\n% --- Sessioni e Agenda ---")
        agenda = doc.get('agenda', [])
        seen_sessions = set()
        
        for item in agenda:
            sess = item.get('session', {})
            pat = item.get('patient', {})
            op = item.get('operator', {})
            
            if not sess or not pat:
                continue
                
            sess_id = sess.get('id')
            pat_id = pat.get('id')
            op_id = op.get('id', -1)
            
            if sess_id not in seen_sessions:
                seen_sessions.add(sess_id)
                
                min_len = sess.get('minLength', 60) // 10
                duration = sess.get('duration', 60) // 10
                loc_str = str(sess.get('location', '1')).strip()
                loc = int(loc_str) if loc_str.isdigit() else 1
                
                # Fatto Sessione Baseline
                asp_lines.append(f"session({sess_id}, {pat_id}, {min_len}, {loc}).")
                
                # Fatto Dettaglio Slot Temporale
                start_slot = sess.get('timeStart', 0) // 10
                period = 1 if item.get('period') == 'MORNING' else 2
                asp_lines.append(f"agenda_slot({sess_id}, {start_slot}, {duration}, {period}).")
            
            # Assegnamento corrente
            if op_id != -1:
                asp_lines.append(f"agenda_assignment({op_id}, {pat_id}, {sess_id}).")

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