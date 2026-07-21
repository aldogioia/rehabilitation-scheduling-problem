% ==============================================================================
% FASE 1: CHOICE RULE ORIGINALE (Arità 15 e 5 ripristinate)
% ==============================================================================
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

% ==============================================================================
% FASE 2: VINCOLI FISICI (Il motore di velocità della Baseline)
% ==============================================================================
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
% FASE 3: PRUNING NEURO-SIMBOLICO (Il VERO taglio dello spazio di ricerca)
% ==============================================================================
% Convertiamo la confidenza del ML in SOGLIE HARD. Questo recide i rami in 
% millisecondi evitando la penalizzazione dinamica nei weak constraints.

% Confidenza 1 (Altissima): Tolleranza massima +1 sul carico predetto
:- ml_capacity(OP, PRED, 1), #count{PAT : assignment(OP,PAT,_,_)} > PRED + 1, OP != -1.

% Confidenza 2 (Alta): Tolleranza massima +2 sul carico predetto
:- ml_capacity(OP, PRED, 2), #count{PAT : assignment(OP,PAT,_,_)} > PRED + 2, OP != -1.

% Confidenza 3 (Moderata): Tolleranza massima +3 sul carico predetto
:- ml_capacity(OP, PRED, 3), #count{PAT : assignment(OP,PAT,_,_)} > PRED + 3, OP != -1.

% ==============================================================================
% FASE 4: EURISTICA ML (Guida il solver)
% ==============================================================================
% L'istruzione #heuristic dirigerà Clingo a vagliare SUBITO le opzioni 
% preferite dal ML, senza aggiungere carico computazionale alla funzione di costo.
#heuristic assignment(OP, PAT, W, PREF) : ml_capacity(OP, PRED, CONF), pref(OP, PAT, W, PREF), OP != -1. [PRED * (5 - CONF), true]

% ==============================================================================
% FASE 5: OBIETTIVI (WEAK CONSTRAINTS ORIGINALI DELLA BASELINE)
% ==============================================================================
% Manteniamo l'ottimizzazione puramente lineare della Baseline per garantire 
% l'altissima velocità di esecuzione.
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]

#show assignment/4.