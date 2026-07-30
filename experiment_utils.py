import re
import os
import clingo
import joblib
import pandas as pd
import numpy as np

def parse_prof_instance(filepath):
    """
    Legge il file .pl originale. Separa il codice base e crea un dizionario degli operatori
    per poter applicare i modelli ML.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    # Estrae tutti i fatti operator(ID, EFF, TYP, ...) per ricostruire le feature ML
    operator_pattern = re.compile(r"operator\((-?\d+)\s*,\s*(\d+)\s*,\s*(\d+).*?\)\.")
    operators = []
    
    for match in operator_pattern.finditer(content):
        op_id, eff_time, typ = map(int, match.groups())
        if op_id != -1:
            operators.append({
                'operator_id': op_id,
                'op_effectiveTime': eff_time * 10,
                'op_jobKind': 0 if typ == 0 else 1, 
                
                # Mock feature per allinearci a TabPFN
                'op_burdenScore': 2,
                'op_qualifications_count': 3,
                'op_has_CN': 1,
                'op_workingPeriod': 1, # Es. 0=Morning
                'avg_patient_priority': 3,
                'density_ratio': 1.5,
                'daily_lifter_ratio': 0.2,
                'day_of_week': 0
            })
            
    return content, operators

def isolate_facts(original_content):
    """
    Isola solo i fatti (operator, patient, session, pref) dall'istanza del professore, 
    scartando tutte le regole e le direttive originali. In questo modo evitiamo 
    duplicazioni logiche quando concateniamo il nostro file ml_allocation_rules.lp.
    """
    marker = "% -------- RULES --------"
    
    if marker in original_content:
        # Tagliamo la stringa esattamente dove iniziano le regole
        facts_only = original_content.split(marker)[0]
        return facts_only.strip()
    else:
        # Fallback di sicurezza: se per caso un'istanza non ha il marker, 
        # leggiamo riga per riga e ci fermiamo appena troviamo la prima regola Clingo
        lines = original_content.split('\n')
        fact_lines = []
        for line in lines:
            stripped = line.strip()
            # Appena troviamo una regola di generazione, un vincolo o una direttiva, ci fermiamo
            if stripped.startswith("1 {") or stripped.startswith(":-") or stripped.startswith(":~") or stripped.startswith("#show"):
                break
            fact_lines.append(line)
            
        return "\n".join(fact_lines).strip()

def generate_ml_predictions_for_instance(operators, model_dir="saved_models/General"):
    """
    Passa i dati parsati ai modelli (assN e assO) e genera i fatti ml_prediction.
    Utilizza train_columns.pkl per allineare perfettamente le feature in ingresso!
    """
    if not operators:
        return ""
        
    df = pd.DataFrame(operators)
    
    try:
        train_columns = joblib.load(f"{model_dir}/train_columns.pkl")
    except FileNotFoundError:
        print(f"File train_columns.pkl non trovato in {model_dir}.")
        return ""

    X_df = df.reindex(columns=train_columns, fill_value=0)
    X = X_df.values.astype(np.float32)
    # ----------------------------------------------
    
    ml_facts = []
    targets_map = {1: 'target_assN', 2: 'target_assO'}
    
    for type_id, target_name in targets_map.items():
        try:
            model_path = f"{model_dir}/best_model_{target_name}.pkl"
            
            if not os.path.exists(model_path):
                 model_path = f"{model_dir}/tabpfn_model_{target_name}.pkl"
            
            model_dict = joblib.load(model_path)
            
            preds_q10 = model_dict['q10'].predict(X)
            preds_q50 = model_dict['q50'].predict(X)
            preds_q90 = model_dict['q90'].predict(X)
            
            for idx, op_id in enumerate(df['operator_id']):
                q10 = int(round(preds_q10[idx]))
                q50 = int(round(preds_q50[idx]))
                q90 = int(round(preds_q90[idx]))
                
                q10, q50, q90 = max(0, q10), max(0, q50), max(0, q90)
                delta = abs(q90 - q10)
                
                ml_facts.append(f"ml_prediction({op_id}, {type_id}, {q50}, {delta}).")
        except FileNotFoundError:
            print(f"Modello per {target_name} non trovato in {model_dir}. Generazione ignorata.")
            
    return "\n".join(ml_facts)

def run_clingo_solver(asp_code, timeout=30.0):
    """
    Esegue Clingo sul codice fornito e restituisce il numero di assegnamenti, i persi e il costo.
    """
    ctl = clingo.Control(["--opt-strategy=usc,k,0,4", "--heuristic=Domain"])
    ctl.add("base", [], asp_code)
    ctl.ground([("base", [])])
    
    best_cost = []
    assignments = 0
    unassigned = 0
    
    def on_model(model):
        nonlocal best_cost, assignments, unassigned
        best_cost = model.cost
        symbols = [str(sym) for sym in model.symbols(shown=True)]
        assignments = len(symbols)
        unassigned = sum(1 for a in symbols if "assignment(-1" in a)
        
    with ctl.solve(on_model=on_model, async_=True) as handle:
        handle.wait(timeout)
        handle.cancel()
        
    return assignments - unassigned, unassigned, best_cost