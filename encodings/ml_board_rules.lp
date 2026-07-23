% FASE 1: CHOICE RULE ORIGINALE E VINCOLI FISICI
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

% 1. Se la sessione non è di gruppo, il medico consuma esattamente 
% la lunghezza (L) richiesta da quel paziente.
sameLocationLength(OP, PAT, L) :- assignment(OP, PAT, _, _), patient(PAT, _, _, _, L), session(_, PAT, _, _, TYP), TYP != 2.

% 2. Tempo di Gruppo: Se la sessione è di gruppo, il medico consuma il tempo 
% una volta sola, pari alla durata MASSIMA tra i pazienti del gruppo.
uniqueLocationLength(OP, LOC, MAX_L) :- assignment(OP, _, _, _), session(_, _, _, LOC, 2), MAX_L = #max{L, PAT : assignment(OP, PAT, _, _), patient(PAT, _, _, _, L), session(_, PAT, _, LOC, 2)}.

% Hard limit invalicabile: La somma dei tempi individuali + tempi di gruppo non supera il MAX.
:- operator(OP,MAX,_,_,_,_,_,_,_,_,_,_,_,_,_), OP != -1, #sum{L, PAT : sameLocationLength(OP, PAT, L); GL, LOC : uniqueLocationLength(OP, LOC, GL)} > MAX.
:- operator(OP,_,_,MAX,_,_,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_)} > MAX.

% Distribuzioni eque per tipologia clinica (Mantiene l'equilibrio del reparto)
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


% FASE 2: PRUNING NEURO-SIMBOLICO
% Confidenza 1: Tagliamo affinità sotto il 15%
:- assignment(OP, PAT, _, _), ml_link(OP, PAT, AFF, 1), AFF < 15, OP != -1.

% Confidenza 2: Tagliamo affinità sotto il 5%
:- assignment(OP, PAT, _, _), ml_link(OP, PAT, AFF, 2), AFF < 5, OP != -1.


% FASE 3: EURISTICA ML
#heuristic assignment(OP, PAT, W, PREF) : ml_link(OP, PAT, AFF, CONF), OP != -1. [AFF * (5 - CONF), true]


% FASE 4: OBIETTIVI (Bilanciati per prevenire l'UNSAT dell'Agenda)

% 1. Penalità per pazienti a terra
:~ assignment(-1, PAT, _, _). [10@4, PAT]

% 2. Penalità di Saturazione
:~ operator(OP,MAX,_,_,_,_,_,_,_,_,_,_,_,_,_), 
   #sum{U, PAT : uniqueLocationLength(OP, PAT, U); S, PAT : sameLocationLength(OP, PAT, S)} = OCCUPATO, 
   OCCUPATO > (MAX * 9) / 10, OP != -1. [15@4, OP]

% 3. Ottimizzazione Machine Learning
:~ assignment(OP, PAT, _, _), ml_link(OP, PAT, AFF, _), OP != -1. [(100 - AFF) / 10 @ 3, OP, PAT]

% 4. Regole originali della Baseline
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@2]
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]

#show assignment/4.