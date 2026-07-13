% --- METRICA A: Burden-Aware Risk Routing ---
% Penalizzare l'assegnazione se il ML è incerto (ConfLevel >= 3) 
% e l'operatore reale ha un burden score elevato (> 5).
:~ assignment(OP, PAT, _, _), 
   ml_capacity(OP, PredN, ConfLevel), 
   ConfLevel >= 3,
   operator_burden(OP, BurdenScore), 
   BurdenScore > 5,
   OP != -1. 
   [BurdenScore@2, PAT, OP]

% --- METRICA B: Buffer Contrattuale ---
% Evitare assegnazioni a massima incertezza (Livello 4) per i part-time (TYP = 1).
:~ assignment(OP, PAT, _, _),
   ml_capacity(OP, PredN, 4),
   operator(OP, _, 1, _, _, _, _, _, _, _, _, _, _, _, _),
   OP != -1.
   [10@3, PAT, OP]

% --- METRICA C: Aderenza Predittiva ---
% Calcoliamo il numero effettivo di pazienti assegnati all'operatore reale
assigned_count(OP, Count) :- 
    operator(OP, _, _, _, _, _, _, _, _, _, _, _, _, _, _), 
    OP != -1,
    Count = #count{ PAT : assignment(OP, PAT, _, _) }.

% Calcoliamo lo scostamento assoluto tra realtà e predizione del ML
% solo quando il modello è sicuro (ConfLevel 1 o 2).
diff(OP, Delta) :- 
    assigned_count(OP, Actual),
    ml_capacity(OP, PredN, ConfLevel),
    ConfLevel <= 2,
    Delta = |Actual - PredN|.

% Penalizziamo lo scostamento per forzare l'aderenza del solver all'euristica predittiva.
:~ diff(OP, Delta), Delta > 0, OP != -1.
   [Delta@1, OP]

% -------- DIRECTIVES --------
#show assignment/4.