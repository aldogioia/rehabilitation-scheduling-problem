% ==============================================================================
% FASE 1 & 2: CHOICE RULE E VINCOLI FISICI BASELINE
% ==============================================================================
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

uniqueLocationLength(OP, PAT, L) :- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), patient(PAT,_,_,_,L), assignment(OP,PAT,_,_), session(_,PAT,_,LOC), #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} < 2.
sameLocationLength(OP, PAT, L) :- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), patient(PAT,_,_,_,_), assignment(OP,PAT,_,_), session(_,PAT,L,LOC), #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} > 1.

:- operator(OP,MAX,_,_,_,_,_,_,_,_,_,_,_,_,_), #sum{U, PAT : uniqueLocationLength(OP, PAT, U); S, PAT : sameLocationLength(OP, PAT, S)} > MAX.
:- operator(OP,_,_,MAX,_,_,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_)} > MAX.

% Distribuzioni eque per tipologia clinica
:- operator(OP,_,_,_,MAX,_,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,1,1,_)} > MAX.
:- operator(OP,_,_,_,_,MAX,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,2,1,_)} > MAX.
:- operator(OP,_,_,_,_,_,MAX,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,2,0,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,MAX,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,1,0,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,MAX,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,1,1,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,MAX,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,2,1,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,MAX,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,2,0,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,_,MAX,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,1,0,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,MAX,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,4,_,_,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,MAX,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,5,_,_,_)} > MAX.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,MAX), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,6,_,_,_)} > MAX.

:- assignment(OP,49,_,_), assignment(OP,41,_,_), OP != -1.

% ==============================================================================
% FASE 3: PRUNING NEURO-SIMBOLICO (MULTI-TARGET)
% ==============================================================================
% Blocchiamo lo spazio di ricerca combinando operatore e tipologia clinica.
% L'aggiunta di "patient(PAT, TYPE, _, _, _)" assicura che il conteggio riguardi
% solo i pazienti del tipo specificato dal fatto ml_capacity.

% Confidenza 1: Tolleranza +1 per tipologia
:- ml_capacity(OP, TYPE, PRED, 1), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,TYPE,_,_,_)} > PRED + 1, OP != -1.

% Confidenza 2: Tolleranza +2 per tipologia
:- ml_capacity(OP, TYPE, PRED, 2), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,TYPE,_,_,_)} > PRED + 2, OP != -1.

% Confidenza 3: Tolleranza +3 per tipologia
:- ml_capacity(OP, TYPE, PRED, 3), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,TYPE,_,_,_)} > PRED + 3, OP != -1.

% ==============================================================================
% FASE 4: EURISTICA ML SPECIFICA PER TIPOLOGIA
% ==============================================================================
% Diciamo a Clingo di accoppiare subito i pazienti con gli operatori che 
% il ML ha previsto come ideali per QUELLA tipologia.
#heuristic assignment(OP, PAT, W, PREF) : ml_capacity(OP, TYPE, PRED, CONF), patient(PAT, TYPE, _, _, _), pref(OP, PAT, W, PREF), OP != -1. [PRED * (5 - CONF), true]

% ==============================================================================
% FASE 5: OBIETTIVI (WEAK CONSTRAINTS LINEARI ORIGINALI)
% ==============================================================================
% Niente regole di penalizzazione dell'overbooking, garantiamo velocità pura.
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]

#show assignment/4.