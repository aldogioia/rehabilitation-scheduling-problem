import json

def generate_board_baseline_facts(data_input, target_date, output_filename):
    """
    Genera i limiti fisici e le preferenze per la fase di Board.
    Restituisce operator/15, patient/5, pref/4, session/4.
    """
    if isinstance(data_input, str):
        with open(data_input, 'r', encoding='utf-8') as f:
            docs = json.load(f)
    else:
        docs = data_input
        
    docs = [docs] if isinstance(docs, dict) else docs
    asp_lines = [f"% --- FATTI FISICI BOARD: {target_date} ---"]
    
    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        agenda = doc.get('agenda', [])
        
        # --- OPERATORI ---
        asp_lines.append("\n% --- Operatori ---")
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
        asp_lines.append("operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).")

        # --- PAZIENTI E PREFERENZE STORICHE ---
        asp_lines.append("\n% --- Pazienti e Preferenze ---")
        all_patients = unassigned.copy()
        for op in board:
            all_patients.extend(op.get('patients', []))
            
        seen_pats = set()
        for pat in all_patients:
            pat_id = pat.get('id')
            if pat_id in seen_pats or pat_id is None: continue
            seen_pats.add(pat_id)
            
            p_type_str = pat.get('type', '')
            type_map = {'N': 1, 'O': 2, 'A': 3, 'CP': 4, 'CN': 5, 'MAC': 6}
            p_type = type_map.get(p_type_str, 1)
            
            is_paying = 2 if 'ssn' in str(pat.get('statusStr', '')).lower() else 1
            needs_aid = 0 if str(pat.get('aidNeeds')).lower() in ['none', 'null', '', 'false'] else 1
            min_len = pat.get('overallMinLength', 60) // 10
            
            asp_lines.append(f"patient({pat_id}, {p_type}, {is_paying}, {needs_aid}, {min_len}).")
            
            # Preferenze esplicite
            pref_ops_raw = pat.get('preferredOps', [])
            preferred_set = set()
            for weight, ops_group in enumerate(pref_ops_raw):
                if isinstance(ops_group, list):
                    for pref_op_id in ops_group:
                        preferred_set.add(pref_op_id)
                        asp_lines.append(f"pref({pref_op_id}, {pat_id}, {weight + 1}, 1).")
                        
            asp_lines.append(f"pref(-1, {pat_id}, 10, 1).")
            
            # Non-preferiti per la baseline (PREF=0)
            for op in board:
                op_id = op.get('id')
                if op_id not in preferred_set and op_id is not None:
                    asp_lines.append(f"pref({op_id}, {pat_id}, 10, 0).")

        # --- SESSIONI BASE ---
        asp_lines.append("\n% --- Sessioni Base ---")
        seen_sessions = set()
        for item in agenda:
            sess = item.get('session', {})
            pat = item.get('patient', {})
            if not sess or not pat: continue
            
            sess_id = sess.get('id')
            pat_id = pat.get('id')
            if sess_id is None or sess_id in seen_sessions: continue
            seen_sessions.add(sess_id)
            
            min_len = sess.get('minLength', 60) // 10
            loc_str = str(sess.get('location', '1')).strip()
            loc = loc_str if loc_str.isdigit() else 1 
            typ = sess.get('type', 0)
            
            
            asp_lines.append(f"session({sess_id}, {pat_id}, {min_len}, {loc}, {typ}).")
            asp_lines.append(f"session({sess_id}, {pat_id}, {min_len}, {loc}).")

    if output_filename:
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write("\n".join(asp_lines))
    return asp_lines



def generate_ml_link_facts(df_predictions, output_filename):
    """
    Riceve il DataFrame con le probabilità dal classificatore e genera i fatti
    ml_link(OP, PAT, AFFINITA, CONFIDENZA).
    """
    asp_lines = ["% --- FATTI PROBABILISTICI MACHINE LEARNING ---"]
    
    for _, row in df_predictions.iterrows():
        op_id = int(row['Operator'])
        pat_id = int(row['Patient'])
        prob = row['Probability']
        
        # 1. Calcolo Affinità (0-100)
        affinity = int(round(prob * 100))
        
        # 2. Calcolo Confidenza (1 = Sicurissimo, 4 = Incertezza Totale)
        if prob >= 0.85 or prob <= 0.15:
            conf = 1
        elif prob >= 0.70 or prob <= 0.30:
            conf = 2
        elif prob >= 0.55 or prob <= 0.45:
            conf = 3
        else:
            conf = 4
            
        asp_lines.append(f"ml_link({op_id}, {pat_id}, {affinity}, {conf}).")
        
    if output_filename:
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write("\n".join(asp_lines))
    return asp_lines



def generate_agenda_facts(board_assignments, data_input, target_date, output_filename):
    """
    Combina l'output del Board con i dati fisici (turni, location, divieti)
    e genera i fatti esatti richiesti dall'Agenda (es. session ad arità 11).
    """
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

    # Mappa veloce per accoppiare Paziente -> Operatore scelto dalla Board
    op_map = {ass['patient_id']: ass['operator_id'] for ass in board_assignments}

    for doc in docs:
        planning_date = doc.get('planningDate', {}).get('$date', '')
        if target_date not in planning_date:
            continue
            
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        agenda = doc.get('agenda', [])
        
        # --- PAZIENTI (patient/3) ---
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

        # --- LOCATIONS E MACRO (location/5) ---
        asp_lines.append("\n% --- Locations ---")
        macro_locs = doc.get('macroLocations', doc.get('locations', []))
        for m_loc in macro_locs:
            m_id = str(m_loc.get('code', m_loc.get('id', '1'))).lower().replace('-', '_')
            for loc in m_loc.get('locations', [m_loc]):
                l_id = str(loc.get('id', '1')).lower().replace('-', '_')
                cap_arr = loc.get('capacity', [1, 1])
                cap_morn = cap_arr[0] if isinstance(cap_arr, list) and len(cap_arr) > 0 else 1
                cap_aft = cap_arr[1] if isinstance(cap_arr, list) and len(cap_arr) > 1 else 1
                
                if cap_morn == 0: cap_morn = 5 
                if cap_aft == 0: cap_aft = 5
                
                asp_lines.append(f"location({l_id}, {cap_morn}, 1, 0, 72).")
                asp_lines.append(f"location({l_id}, {cap_aft}, 2, 72, 144).")
                asp_lines.append(f"macroLocation({m_id}, {l_id}).")

        # --- TURNI OPERATORI (period/4 e time/3) ---
        asp_lines.append("\n% --- Turni Operatori ---")
        for op in board:
            op_id = op.get('id')
            if op_id is None: continue
            opt_times = op.get('operatingTimes', [])
            for idx, p_data in enumerate(opt_times):
                per = idx + 1
                sta = time_to_slot(p_data.get('start'))
                end = time_to_slot(p_data.get('end'))
                if sta is not None and end is not None and end > sta:
                    asp_lines.append(f"period({per}, {op_id}, {sta}, {end}).")
                    asp_lines.append(f"time({per}, {op_id}, {sta}..{end-1}).")

        # --- INDISPONIBILITA' (forbidden/4) ---
        asp_lines.append("\n% --- Indisponibilita ---")
        for p_id, p in pat_dict.items():
            forbs = p.get('forbiddenTimes', p.get('unavailabilities', []))
            for forb in forbs:
                per = 1 if forb.get('period', 'MORNING') == 'MORNING' else 2
                sta = time_to_slot(forb.get('start'))
                end = time_to_slot(forb.get('end'))
                if sta is not None and end is not None:
                    asp_lines.append(f"forbidden({p_id}, {per}, {sta}, {end}).")

        # --- SESSIONI CON ASSEGNAMENTO BOARD (session/11 e sessionLocation/3) ---
        asp_lines.append("\n% --- Sessioni ---")
        seen_sessions = set()
        for item in agenda:
            sess = item.get('session', {})
            pat = item.get('patient', {})
            if not sess or not pat: continue
            
            sess_id = sess.get('id')
            pat_id = pat.get('id')
            if sess_id is None or pat_id is None or sess_id in seen_sessions: continue
            seen_sessions.add(sess_id)
            
            # OP ereditato dal Board (se non c'è, -1)
            op_id = op_map.get(pat_id, -1)
            
            loc_str = str(sess.get('location', '1')).strip().lower().replace('-', '_')
            loc = loc_str if loc_str else "1"
            typ = sess.get('type', 0)
            min_len = sess.get('minLength', 60) // 10
            ideal_len = sess.get('idealLength', 60) // 10
            per = 1 if sess.get('idealPeriod') == 'MORNING' else 0
            tim = (sess.get('idealTime', 0) or 0) // 10
            opt = 1 if sess.get('optional', False) else 0
            pri = pat.get('category', {}).get('priority', 1)
            
            asp_lines.append(f"session({sess_id}, {pat_id}, {op_id}, {loc}, {typ}, {min_len}, {ideal_len}, {per}, {tim}, {opt}, {pri}).")
            
            mac = str(item.get('macroLocationId', loc)).lower().replace('-', '_')
            asp_lines.append(f"sessionLocation({sess_id}, {loc}, {mac}).")

    if output_filename:
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write("\n".join(asp_lines))
    return asp_lines

def split_assignments_by_period(board_assignments, json_path, target_date):
    """
    Legge il JSON per estrarre la capacità mattutina/pomeridiana dei medici 
    e la preferenza dei pazienti, smistando gli assegnamenti in due liste.
    """
    import json
    import pandas as pd
    
    # Inizializziamo i due secchielli
    ass_mattina = []
    ass_pomeriggio = []
    
    # 1. Carica il JSON per capire turni medici e preferenze pazienti
    with open(json_path, 'r', encoding='utf-8') as f:
        docs = json.load(f)
        if isinstance(docs, dict): docs = [docs]
        
    doc_giorno = next((d for d in docs if target_date in d.get('planningDate', {}).get('$date', '')), None)
    if not doc_giorno:
        return board_assignments, [] # Fallback
        
    # Mappiamo le preferenze dei pazienti (1 = Mattina, 2 = Pomeriggio, 0 = Flessibile)
    pat_prefs = {}
    for item in doc_giorno.get('agenda', []):
        pat_id = item.get('patient', {}).get('id')
        period = item.get('session', {}).get('periodIdeal', 0)
        if pat_id:
            pat_prefs[pat_id] = period

    # Mappiamo il "peso" temporale di ogni medico (quanti pazienti flessibili ha già per turno)
    # Per semplicità, contiamo solo il numero di pazienti assegnati a quel turno
    op_load_morning = {op.get('id'): 0 for op in doc_giorno.get('board', [])}
    op_load_afternoon = {op.get('id'): 0 for op in doc_giorno.get('board', [])}

    # 2. Smistamento Pazienti Fissi
    flessibili = []
    for ass in board_assignments:
        pat = ass['patient_id']
        op = ass['operator_id']
        
        if op == -1:
            continue # I pazienti a terra li ignoriamo qui
            
        pref = pat_prefs.get(pat, 0)
        
        if pref == 1:
            ass_mattina.append(ass)
            op_load_morning[op] = op_load_morning.get(op, 0) + 1
        elif pref == 2:
            ass_pomeriggio.append(ass)
            op_load_afternoon[op] = op_load_afternoon.get(op, 0) + 1
        else:
            flessibili.append(ass)

    # 3. Smistamento Pazienti Flessibili (Bilanciamento)
    for ass in flessibili:
        op = ass['operator_id']
        # Assegna al turno dove il medico ha meno carico attuale
        if op_load_morning.get(op, 0) <= op_load_afternoon.get(op, 0):
            ass_mattina.append(ass)
            op_load_morning[op] = op_load_morning.get(op, 0) + 1
        else:
            ass_pomeriggio.append(ass)
            op_load_afternoon[op] = op_load_afternoon.get(op, 0) + 1
            
    return ass_mattina, ass_pomeriggio