% Calcolo dinamico degli assegnamenti totali per operatore
assigned_count(OP, Count) :- 
    operator(OP, _, _, _, _, _, _, _, _, _, _, _, _, _, _), OP != -1, 
    Count = #count{ PAT : assignment(OP, PAT, _, _) }.

% Calcolo dell'Overbooking (quanti pazienti in più rispetto alla predizione)
overbooked(OP, Over) :- 
    assigned_count(OP, Actual), 
    ml_capacity(OP, PredN, _), 
    Actual > PredN, 
    Over = Actual - PredN.

% --- METRICA A: COMPLESSITÀ CLINICA E BURDEN ---
% Non penalizziamo ogni assegnamento, ma vietiamo di dare 
% pazienti fisicamente complessi a operatori già esauriti.
:~ assignment(OP, PAT, _, _), patient(PAT, _, _, 1, _), operator_burden(OP, Burden), Burden > 5, OP != -1. [Burden@3, PAT, OP]

% --- METRICA B (V2): PROTEZIONE OVERBOOKING ASIMMETRICA ---
% Invece di vietare gli assegnamenti base, penalizziamo in modo 
% esponenziale solo l'ECCEDENZA (Overbooking) rispetto al ML per le categorie a rischio.
:~ overbooked(OP, Over), operator(OP, _, 1, _, _, _, _, _, _, _, _, _, _, _, _). [Over*5@2, OP]
:~ overbooked(OP, Over), operator_burden(OP, Burden), Burden > 5. [Over*Burden@2, OP]

% --- METRICA C (V2): ADERENZA SCALATA SULLA CONFIDENZA ---
% Lo scostamento dalla predizione (Delta) costa di più se 
% il modello ML è estremamente sicuro (ConfLevel 1), costa meno se è incerto.
diff(OP, Delta) :- 
    assigned_count(OP, Actual), 
    ml_capacity(OP, PredN, _), 
    Delta = |Actual - PredN|.

:~ diff(OP, Delta), ml_capacity(OP, _, 1), Delta > 0, OP != -1. [Delta*3@1, OP]
:~ diff(OP, Delta), ml_capacity(OP, _, 2), Delta > 0, OP != -1. [Delta*1@1, OP]