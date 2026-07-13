import joblib
import pandas as pd
import numpy as np
import clingo
from api.data_utils import process_raw_json, aggregate_to_operator_day, generate_physical_instance, generate_clingo_facts

MODELS_PATH = "saved_models/best_quantiles_model.pkl"
COLS_PATH = "saved_models/train_columns.pkl"
BASE_RULES_PATH = "encodings/base_rules.lp"
ML_RULES_PATH = "encodings/ml_rules.lp"
FACTS_PATH = "encodings/facts/day_facts.lp"
ML_FACTS_PATH = "encodings/facts/ml_facts.lp"

trained_models = joblib.load(MODELS_PATH)
train_columns = joblib.load(COLS_PATH)

def generate_predictions_for_api(json_path, target_date):
    """Fa inferenza sui dati nuovi usando i modelli salvati."""
    df_raw = process_raw_json(json_path)
    df_agg = aggregate_to_operator_day(df_raw)
    
    df_today = df_agg[df_agg['planning_date'].astype(str).str.contains(target_date)].copy()
    if df_today.empty:
        raise ValueError(f"Nessun dato trovato per la data {target_date}")
        
    today_ids = df_today['operator_id']
    X_today = df_today.drop(columns=['operator_id', 'planning_date', 'target_assignments'], errors='ignore')
    
    cat_cols = X_today.select_dtypes(include=['object', 'category', 'string']).columns.tolist()
    X_today = pd.get_dummies(X_today, columns=cat_cols, drop_first=True, dtype=int)
    X_today = X_today.reindex(columns=train_columns, fill_value=0)
    
    q10 = trained_models['q10'].predict(X_today)
    q50 = trained_models['q50'].predict(X_today)
    q90 = trained_models['q90'].predict(X_today)
    
    generate_clingo_facts(
        X_test=df_today,
        y_test=pd.Series(np.zeros(len(today_ids))), 
        q10=q10, q50=q50, q90=q90, 
        original_ids=today_ids, 
        output_filename=ML_FACTS_PATH
    )

import clingo

def solve_schedule(use_ml=True, timeout_seconds=30.0):
    """
    Lancia l'ottimizzatore ASP.
    Carica i file del ML in maniera modulare solo se richiesto.
    """
    ctl = clingo.Control(["--opt-strategy=usc,k,0,4", "--opt-usc-shrink=bin"])
    
    ctl.load(BASE_RULES_PATH)
    ctl.load(FACTS_PATH)
    
    if use_ml:
        ctl.load(ML_RULES_PATH)
        ctl.load(ML_FACTS_PATH)
        
    ctl.ground([("base", [])])
    
    best_cost = None
    assignments = []
    
    def on_model(model):
        nonlocal best_cost, assignments
        best_cost = model.cost
        assignments = [str(sym) for sym in model.symbols(shown=True)]
        
    with ctl.solve(on_model=on_model, async_=True) as handle:
        finished = handle.wait(timeout_seconds)
        if not finished:
            handle.cancel()
        result = handle.get()
        
    unassigned_count = sum(1 for a in assignments if "assignment(-1" in a)
    
    return {
        "status": str(result),
        "cost": best_cost,
        "unassigned_patients": unassigned_count,
        "total_assignments": len(assignments) - unassigned_count,
        "raw_assignments": assignments
    }

def process_optimization_request(raw_docs, target_date, use_ml=True):
    """Funzione principale chiamata dall'API."""

    # 1. Creiamo i file fisici
    generate_physical_instance(raw_docs, target_date, FACTS_PATH)

    # 2. Creiamo le predizioni
    if use_ml:
        generate_predictions_for_api(raw_docs, target_date)

    # 3. Risolviamo
    result = solve_schedule()
    return result