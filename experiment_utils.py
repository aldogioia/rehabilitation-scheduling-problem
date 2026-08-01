import re
import os
import clingo
import joblib
import pandas as pd
import numpy as np

def isolate_facts(original_content):
    """
    Isola solo i fatti (operator, patient, session, pref) dall'istanza del professore, 
    scartando tutte le regole e le direttive originali.
    """
    marker = "% -------- RULES --------"
    
    if marker in original_content:
        # Tagliamo la stringa esattamente dove iniziano le regole
        facts_only = original_content.split(marker)[0]
        return facts_only.strip()
    else:
        # Fallback di sicurezza
        lines = original_content.split('\n')
        fact_lines = []
        for line in lines:
            stripped = line.strip()
            if stripped.startswith("1 {") or stripped.startswith(":-") or stripped.startswith(":~") or stripped.startswith("#show"):
                break
            fact_lines.append(line)
            
        return "\n".join(fact_lines).strip()

def extract_incompatibilities(original_content):
    """
    Estrae dinamicamente le regole di incompatibilità tra pazienti dal file del Prof.
    """
    pattern = re.compile(r"^:-\s*assignment\(OP,\d+,_,_\),\s*assignment\(OP,\d+,_,_\),\s*OP\s*!=\s*-1\.", re.MULTILINE)
    matches = pattern.findall(original_content)
    
    if matches:
        return "% --- INCOMPATIBILITA' DINAMICHE ---\n" + "\n".join(matches)
    return ""

def parse_prof_instance(filepath):
    """
    Legge il file .pl originale. 
    Usa isolate_facts per scartare le regole, poi estrae dinamicamente tutte le 
    feature REALI dai pazienti (per calcolare ratios, pressione), dagli operatori
    e dai fatti 'pref'.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    facts_content = isolate_facts(content)

    # 1. ESTRAZIONE PAZIENTI (Pressione, Mix, Lifter Ratio)
    patient_pattern = re.compile(r"^patient\((.*?)\)\.", re.MULTILINE)
    patient_matches = patient_pattern.findall(facts_content)
    
    num_patients = 0
    lifter_count = 0
    neuro_count, ortho_count, mac_count = 0, 0, 0
    total_demand_mins = 0

    # Mappatura delle priorità fissa come nel JSON
    priority_map = {1: 4, 2: 8, 6: 15} # 1=Neuro, 2=Ortho, 6=MAC
    total_priority = 0
    
    for p_str in patient_matches:
        p_args = [arg.strip() for arg in p_str.split(',')]
        if p_args[0] == '-1': continue # Ignora id di test
            
        num_patients += 1
        p_typ = int(p_args[1])
        p_aid = int(p_args[3])
        p_min = int(p_args[4]) * 10 # Convertiamo i TU in Minuti
        
        # Calcolo patient mix (1=Neuro, 2=Ortho, 6=MAC)
        if p_typ == 1: neuro_count += 1
        elif p_typ == 2: ortho_count += 1
        elif p_typ == 6: mac_count += 1
            
        if p_aid > 0: lifter_count += 1
        total_demand_mins += p_min
        total_priority += priority_map.get(p_typ, 3.0) # 3.0 fallback per altri tipi (es. Covid)

    avg_patient_priority = (total_priority / num_patients) if num_patients > 0 else 3.0
    daily_lifter_ratio = (lifter_count / num_patients) if num_patients > 0 else 0
    perc_neuro = (neuro_count / num_patients) if num_patients > 0 else 0
    perc_ortho = (ortho_count / num_patients) if num_patients > 0 else 0
    perc_mac = (mac_count / num_patients) if num_patients > 0 else 0

    # 2. ESTRAZIONE POPOLARITA' OPERATORI (Da pref)
    pref_pattern = re.compile(r"^pref\((.*?)\)\.", re.MULTILINE)
    pref_matches = pref_pattern.findall(facts_content)
    
    op_popularity = {}
    for pref_str in pref_matches:
        pr_args = [arg.strip() for arg in pref_str.split(',')]
        ope = int(pr_args[0])
        if ope != -1:
            op_popularity[ope] = op_popularity.get(ope, 0) + 1

    # 3. ESTRAZIONE OPERATORI (Capacità e Qualifiche)
    operator_pattern = re.compile(r"^operator\((.*?)\)\.", re.MULTILINE)
    operator_matches = operator_pattern.findall(facts_content)
    
    valid_ops = [o_str for o_str in operator_matches if not o_str.startswith('-1')]
    num_operators = len(valid_ops)
    density_ratio = (num_patients / num_operators) if num_operators > 0 else 0
    
    total_capacity_mins = 0
    operators = []
    
    # Primo giro per calcolare la Workload Pressure (Capacità Totale Ospedale)
    for o_str in valid_ops:
        o_args = [arg.strip() for arg in o_str.split(',')]
        eff_tu = int(o_args[1])
        total_capacity_mins += (eff_tu * 10)
        
    workload_pressure_index = (total_demand_mins / total_capacity_mins) if total_capacity_mins > 0 else 0
    
    # Secondo giro per creare le righe di Inferenza
    for o_str in valid_ops:
        o_args = [arg.strip() for arg in o_str.split(',')]
        
        op_id = int(o_args[0])
        eff_tu = int(o_args[1])
        typ = int(o_args[2])
        
        # Limiti per Qualifica (Indici 4-14 nel file ASP)
        nlp, nl, n, np = int(o_args[4]), int(o_args[5]), int(o_args[6]), int(o_args[7])
        olp, ol, op, o = int(o_args[8]), int(o_args[9]), int(o_args[10]), int(o_args[11])
        cp, cn, mac = int(o_args[12]), int(o_args[13]), int(o_args[14])
        
        op_has_N = 1 if (nlp + nl + n + np) > 0 else 0
        op_has_O = 1 if (olp + ol + op + o) > 0 else 0
        op_has_CP = 1 if cp > 0 else 0
        op_has_CN = 1 if cn > 0 else 0
        op_has_MAC = 1 if mac > 0 else 0
        
        qual_count = op_has_N + op_has_O + op_has_CP + op_has_CN + op_has_MAC
        
        operators.append({
            'operator_id': op_id,

            'op_jobKind': typ,
            'op_qualifications_count': qual_count,
            'op_effectiveTime': eff_tu * 10,
            'op_popularity_score': op_popularity.get(op_id, 0),
            
            'avg_patient_priority': avg_patient_priority,
            'density_ratio': density_ratio,
            'daily_lifter_ratio': daily_lifter_ratio,

            'workload_pressure_index': workload_pressure_index,
            'daily_perc_neuro': perc_neuro,
            'daily_perc_ortho': perc_ortho,
            'daily_perc_mac': perc_mac,

            'op_has_N': op_has_N,
            'op_has_O': op_has_O,
            'op_has_CP': op_has_CP,
            'op_has_CN': op_has_CN,
            'op_has_MAC': op_has_MAC,
        })
            
    return content, operators

def generate_ml_predictions_for_instance(operators, model_dir="saved_models"):
    """
    Passa i dati parsati ai modelli e genera i fatti ml_prediction per tutte le macro-aree.
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
    
    ml_facts = []
    
    targets_map = {
        1: 'target_assN',   # Neurologici
        2: 'target_assO',   # Ortopedici
        4: 'target_assCP',  # Covid Positivi
        5: 'target_assCN',  # Covid Negativi
        6: 'target_assMAC'  # MAC
    }
    
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
                
                delta_under = q50 - q10
                delta_over = q90 - q50
                
                ml_facts.append(f"ml_prediction({op_id}, {type_id}, {q50}, {delta_under}, {delta_over}).")
        except FileNotFoundError:
            print(f"Modello per {target_name} non trovato in {model_dir}. Generazione ignorata.")
            
    return "\n".join(ml_facts)

def generate_ml_predictions_for_instance_total(operators, model_dir="saved_models"):
    """
    Passa i dati parsati al modello globale e genera i fatti ml_prediction_total.
    Utilizza train_columns.pkl per allineare le feature in ingresso.
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
    
    ml_facts = []
    target_name = 'target_assignments'
    
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
                
                delta_under = q50 - q10
                delta_over = q90 - q50
                
                ml_facts.append(f"ml_prediction_total({op_id}, {q50}, {delta_under}, {delta_over}).")
    except FileNotFoundError:
        print(f"Modello per {target_name} non trovato in {model_dir}. Generazione ignorata.")
            
    return "\n".join(ml_facts)

def get_board_assignments(asp_code, timeout=30.0):
    """
    Esegue il Board e restituisce un dizionario {Paziente_ID: Operatore_ID}.
    """
    ctl = clingo.Control(["--opt-strategy=usc,k,0,4", "--heuristic=Domain"])
    ctl.add("base", [], asp_code)
    ctl.ground([("base", [])])
    
    best_assignments = {}
    
    def on_model(model):
        nonlocal best_assignments
        best_assignments = {} # Pulisce per tenere solo le assegnazioni dell'ottimo (o dell'ultimo modello trovato)
        for sym in model.symbols(shown=True):
            if sym.name == "assignment" and len(sym.arguments) == 4:
                op = sym.arguments[0].number
                pat = sym.arguments[1].number
                if op != -1: # Ignoriamo i pazienti non assegnati
                    best_assignments[pat] = op
                    
    with ctl.solve(on_model=on_model, async_=True) as handle:
        handle.wait(timeout)
        handle.cancel()
        
    return best_assignments

def update_agenda_instance(agenda_content, board_assignments):
    """
    Sostituisce il terzo parametro (OPE) dei fatti session(...) nell'Agenda con
    l'operatore assegnato dal Board. Commenta le sessioni dei pazienti non assegnati.
    """
    lines = agenda_content.split('\n')
    new_lines = []
    
    for line in lines:
        if line.strip().startswith("session("):
            match = re.match(r"session\((.*?)\)\.", line.strip())
            if match:
                args = [arg.strip() for arg in match.group(1).split(',')]
                pat_id = int(args[1])
                
                if pat_id in board_assignments:
                    new_op = board_assignments[pat_id]
                    args[2] = str(new_op) # Sostituzione dell'operatore
                    new_line = f"session({', '.join(args)})."
                    new_lines.append(new_line)
                else:
                    # Se il paziente non è in board_assignments, è stato lasciato a terra
                    new_lines.append(f"% {line} % PAZIENTE NON ASSEGNATO NEL BOARD")
        else:
            new_lines.append(line)
            
    return "\n".join(new_lines)

def run_agenda_solver(asp_code, timeout=60.0):
    """
    Esegue l'Agenda e restituisce lo status (OPTIMAL, SATISFIABLE, UNSATISFIABLE) e il costo.
    """
    ctl = clingo.Control(["--opt-strategy=usc,k,0,4", "--heuristic=Domain"])
    ctl.add("base", [], asp_code)
    ctl.ground([("base", [])])
    
    status = "TIMEOUT/UNKNOWN"
    best_cost = None
    
    def on_model(model):
        nonlocal best_cost
        best_cost = model.cost[0] if model.cost else 0
        
    with ctl.solve(on_model=on_model, async_=True) as handle:
        handle.wait(timeout)
        handle.cancel()
        res = handle.get()
        
        if res is not None:
            if res.satisfiable:
                status = "OPTIMAL" if res.exhausted else "SATISFIABLE"
            elif res.unsatisfiable:
                status = "UNSATISFIABLE"
                
    return status, best_cost

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