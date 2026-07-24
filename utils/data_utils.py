import json
import random
import pandas as pd
from collections import defaultdict

def generate_rich_link_dataset(json_paths, negative_ratio=2, random_seed=42):
    random.seed(random_seed)
    dataset_rows = []
    
    if isinstance(json_paths, str):
        json_paths = [json_paths]
        
    all_docs = []
    for path in json_paths:
        with open(path, 'r', encoding='utf-8') as f:
            docs = json.load(f)
            if isinstance(docs, dict): docs = [docs]
            all_docs.extend(docs)
            
    # 1. ORDINAMENTO CRONOLOGICO
    def get_date(d):
        pd_str = d.get('planningDate', {}).get('$date')
        return pd.to_datetime(pd_str).tz_localize(None) if pd_str else pd.Timestamp.min
        
    all_docs.sort(key=get_date)
    
    # REGISTRO STORICO GLOBALE
    pair_history = defaultdict(lambda: defaultdict(int))
    
    for doc in all_docs:
        planning_date_str = doc.get('planningDate', {}).get('$date')
        agenda = doc.get('agenda', [])
        if not planning_date_str or not agenda:
            continue
        
        planning_date = pd.to_datetime(planning_date_str).tz_localize(None)
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        
        all_pats = unassigned + [p for op in board for p in op.get('patients', [])]
        
        # --- NUOVO: ESTRAZIONE INFO SESSIONE DALL'AGENDA ---
        # Mappiamo l'ID del paziente ai dettagli della sua sessione odierna
        pat_session_info = {}
        for item in agenda:
            sess = item.get('session', {})
            pat = item.get('patient', {})
            if not sess or not pat: continue
            
            p_id = pat.get('id')
            if p_id is not None:
                loc_str = str(sess.get('location', '1')).strip()
                pat_session_info[p_id] = {
                    'sess_type': sess.get('type', 0), # 0=Individuale, 2=Gruppo, ecc.
                    'sess_length': sess.get('minLength', 60),
                    'sess_location': int(loc_str) if loc_str.isdigit() else 1
                }

        # --- FEATURE CONTESTUALE: PRESSIONE CLINICA ---
        pat_type_counts = defaultdict(int)
        for p in all_pats:
            pat_type_counts[p.get('type', 'Unknown')] += 1
            
        op_qual_counts = defaultdict(int)
        active_operators = {}
        for op in board:
            op_id = op.get('id')
            if op_id is None: continue
            
            quals = op.get('qualifications', [])
            for q in quals:
                op_qual_counts[q] += 1
                
            opt_times = op.get('operatingTimes', [])
            is_morn = 1 if len(opt_times) > 0 and opt_times[0].get('start') is not None else 0
            is_aft = 1 if len(opt_times) > 1 and opt_times[1].get('start') is not None else 0
            
            active_operators[op_id] = {
                'quals': quals,
                'op_burdenScore': op.get('burdenScore', 0),
                'op_effectiveTime': op.get('effectiveTime', 0),
                'op_qual_count': len(quals),
                'op_is_morning': is_morn,
                'op_is_afternoon': is_aft
            }
            
        # --- MAPPA PAZIENTI E POSITIVI ---
        positive_links = set()
        patients_info = {}
        
        for op in board:
            op_id = op.get('id')
            for pat in op.get('patients', []):
                pat_id = pat.get('id')
                patients_info[pat_id] = pat
                if op_id is not None:
                    positive_links.add((pat_id, op_id))
                    
        for pat in unassigned:
            patients_info[pat.get('id')] = pat

        # --- GENERAZIONE COPPIE (Time-Aware) ---
        for pat_id, pat in patients_info.items():
            pat_type = pat.get('type', 'Unknown')
            needs_lifter = 1 if str(pat.get('aidNeeds', '')).lower() not in ['none', 'null', '', 'false'] else 0
            

            # Fallback ai valori base del paziente se non si trova l'agenda (raro ma sicuro)
            s_info = pat_session_info.get(pat_id, {})
            sess_type = s_info.get('sess_type', 0)
            sess_length = s_info.get('sess_length', pat.get('overallMinLength', 60))
            sess_location = s_info.get('sess_location', 1)
            
            # Calcolo Pressione
            pats_of_type = pat_type_counts.get(pat_type, 0)
            ops_with_qual = op_qual_counts.get(pat_type, 0)
            type_pressure = (pats_of_type / ops_with_qual) if ops_with_qual > 0 else pats_of_type
            
            assigned_ops = [op for p, op in positive_links if p == pat_id]
            
            active_shifts_for_pat = set()
            for assigned_op in assigned_ops:
                if assigned_op in active_operators:
                    if active_operators[assigned_op]['op_is_morning']: active_shifts_for_pat.add('M')
                    if active_operators[assigned_op]['op_is_afternoon']: active_shifts_for_pat.add('A')
            
            hard_negatives = []
            for op_id, op_data in active_operators.items():
                if op_id in assigned_ops: continue
                if pat_type not in op_data['quals']: continue
                
                op_shifts = set()
                if op_data['op_is_morning']: op_shifts.add('M')
                if op_data['op_is_afternoon']: op_shifts.add('A')
                
                if active_shifts_for_pat and not (active_shifts_for_pat & op_shifts):
                    continue
                    
                hard_negatives.append(op_id)
                
            sampled_negatives = random.sample(hard_negatives, min(len(hard_negatives), negative_ratio))
            all_pairs = [(op, 1) for op in assigned_ops] + [(op, 0) for op in sampled_negatives]
            
            for op_id, label in all_pairs:
                op_data = active_operators[op_id]
                hist_count = pair_history[pat_id][op_id]
                
                dataset_rows.append({
                    'planning_date': planning_date,
                    'patient_id': pat_id,
                    'operator_id': op_id,
                    
                    # Dati Paziente
                    'pat_type': pat_type,
                    'pat_needs_lifter': needs_lifter,
                    
                    # Dati Sessione
                    'sess_type': sess_type,
                    'sess_length': sess_length,
                    'sess_location': sess_location,
                    
                    # Dati Operatore
                    'op_burdenScore': op_data['op_burdenScore'],
                    'op_effectiveTime': op_data['op_effectiveTime'],
                    'op_qual_count': op_data['op_qual_count'],
                    'op_is_morning': op_data['op_is_morning'],
                    'op_is_afternoon': op_data['op_is_afternoon'],
                    
                    # Dati Relazionali / Contesto
                    'type_pressure': type_pressure,
                    'historical_pair_count': hist_count,
                    
                    # TARGET
                    'link_label': label 
                })
        
        # 3. AGGIORNAMENTO DEL REGISTRO STORICO
        for pat_id, op_id in positive_links:
            pair_history[pat_id][op_id] += 1

    return pd.DataFrame(dataset_rows)