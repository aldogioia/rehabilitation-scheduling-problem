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
            
    # 1. ORDINAMENTO CRONOLOGICO (Cruciale per non barare sullo storico)
    def get_date(d):
        pd_str = d.get('planningDate', {}).get('$date')
        return pd.to_datetime(pd_str).tz_localize(None) if pd_str else pd.Timestamp.min
        
    all_docs.sort(key=get_date)
    
    # REGISTRO STORICO GLOBALE (Si aggiorna man mano che passano i giorni)
    # pair_history[patient_id][operator_id] = numero_di_sedute_passate
    pair_history = defaultdict(lambda: defaultdict(int))
    
    for doc in all_docs:
        planning_date_str = doc.get('planningDate', {}).get('$date')
        if not planning_date_str or not doc.get('agenda'):
            continue
        
        planning_date = pd.to_datetime(planning_date_str).tz_localize(None)
        board = doc.get('board', [])
        unassigned = doc.get('unassignedPatients', [])
        
        all_pats = unassigned + [p for op in board for p in op.get('patients', [])]
        total_ops = len(board)
        total_pats = len(all_pats)
        
        # --- FEATURE CONTESTUALE: PRESSIONE CLINICA ---
        # Contiamo quanti pazienti ci sono per ogni tipologia oggi
        pat_type_counts = defaultdict(int)
        for p in all_pats:
            pat_type_counts[p.get('type', 'Unknown')] += 1
            
        # Contiamo quanti operatori hanno quella specifica qualifica in turno oggi
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
            min_len = pat.get('overallMinLength', 60)
            
            # Calcolo Pressione: Pazienti di tipo X / Operatori con qualifica X
            pats_of_type = pat_type_counts.get(pat_type, 0)
            ops_with_qual = op_qual_counts.get(pat_type, 0)
            type_pressure = (pats_of_type / ops_with_qual) if ops_with_qual > 0 else pats_of_type
            
            assigned_ops = [op for p, op in positive_links if p == pat_id]
            
            # Identificazione turni in cui il paziente è stato trattato
            active_shifts_for_pat = set()
            for assigned_op in assigned_ops:
                if assigned_op in active_operators:
                    if active_operators[assigned_op]['op_is_morning']: active_shifts_for_pat.add('M')
                    if active_operators[assigned_op]['op_is_afternoon']: active_shifts_for_pat.add('A')
            
            hard_negatives = []
            for op_id, op_data in active_operators.items():
                if op_id in assigned_ops: continue
                if pat_type not in op_data['quals']: continue
                
                # Time-aware: pesca solo medici dello stesso turno
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
                
                # ESTRAZIONE STORICO DAL REGISTRO GIOBALE
                hist_count = pair_history[pat_id][op_id]
                
                dataset_rows.append({
                    'planning_date': planning_date,
                    'patient_id': pat_id,
                    'operator_id': op_id,
                    
                    'pat_type': pat_type,
                    'pat_needs_lifter': needs_lifter,
                    'pat_min_length': min_len,
                    
                    'op_burdenScore': op_data['op_burdenScore'],
                    'op_effectiveTime': op_data['op_effectiveTime'],
                    'op_qual_count': op_data['op_qual_count'],
                    'op_is_morning': op_data['op_is_morning'],
                    'op_is_afternoon': op_data['op_is_afternoon'],
                    
                    # --- NUOVE FEATURE SUPER-PREDITTIVE ---
                    'type_pressure': type_pressure,
                    'historical_pair_count': hist_count,
                    
                    # TARGET
                    'link_label': label 
                })
        
        # 3. AGGIORNAMENTO DEL REGISTRO STORICO (Solo ALLA FINE della giornata)
        # In questo modo, l'assegnazione di oggi sarà disponibile come "storia" solo da domani!
        for pat_id, op_id in positive_links:
            pair_history[pat_id][op_id] += 1

    return pd.DataFrame(dataset_rows)