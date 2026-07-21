import json
import numpy as np
import pandas as pd

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
                
                'target_assN': operator.get('assN', 0) or 0,
                'target_assO': operator.get('assO', 0) or 0,
                'target_assA': operator.get('assA', 0) or 0,
                'target_assCP': operator.get('assCP', 0) or 0,
                'target_assCN': operator.get('assCN', 0) or 0,
                'target_assMAC': operator.get('assMAC', 0) or 0,
                
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
        'target_assN': 'first',
        'target_assO': 'first',
        'target_assA': 'first',
        'target_assCP': 'first',
        'target_assCN': 'first',
        'target_assMAC': 'first',
        'target_assignments': 'first' 
    }
    
    df_agg = df.groupby(['planning_date', 'operator_id'], as_index=False).agg(agg_rules)
    
    # Drop records senza operatore o con target nullo
    df_agg = df_agg.dropna(subset=['operator_id', 'target_assignments'])
    
    return df_agg