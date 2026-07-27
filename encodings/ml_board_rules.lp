% FASE 1: CHOICE RULE E VINCOLI FISICI
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

individual_time(OP, PAT, L) :- 
    assignment(OP, PAT, _, _), 
    patient(PAT, _, _, _, L), 
    session(_, PAT, _, _, TYP), 
    TYP != 2.

group_time(OP, LOC, MAX_L) :- 
    assignment(OP, _, _, _), 
    session(_, _, _, LOC, 2),
    MAX_L = #max{L, PAT : assignment(OP, PAT, _, _), patient(PAT, _, _, _, L), session(_, PAT, _, LOC, 2)}.

% [MODIFICA 1] Buffer al 90% per salvare l'Agenda.
:- operator(OP,MAX,_,_,_,_,_,_,_,_,_,_,_,_,_), OP != -1,
   #sum{L, PAT : individual_time(OP, PAT, L); GL, LOC : group_time(OP, LOC, GL)} > (MAX * 90) / 100.

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

% FASE 2: PRUNING
% Tagliamo solo se l'Affinità è sotto il 10% E la Confidenza è Alta (1 o 2).
% Se il modello è incerto (Confidenza 3 o 4), lasciamo a Clingo il diritto di provare.
:- assignment(OP, PAT, _, _), ml_link(OP, PAT, AFF, CONF), CONF <= 2, AFF < 10, OP != -1.

% FASE 3: EURISTICA ML
#heuristic assignment(OP, PAT, W, PREF) : ml_link(OP, PAT, AFF, _), OP != -1. [AFF, true]

% FASE 4: OBIETTIVI
% Aumentiamo leggermente la priorità di non lasciare a terra, così Clingo ci prova davvero
:~ assignment(-1, PAT, _, _). [10@4, PAT]

% Ottimizzazione Machine Learning a secchielli
:~ assignment(OP, PAT, _, _), ml_link(OP, PAT, AFF, _), OP != -1. [(100 - AFF) / 10 @ 3, OP, PAT]

% FASE 5: REGOLE DI PREFERENZA FALLBACK (disabilitate quando la confidenza ML è alta: CONF <= 2)
ml_high_confidence(OP, PAT) :- ml_link(OP, PAT, _, CONF), CONF <= 2.

:~ assignment(OP, PAT, W, 1), not ml_high_confidence(OP, PAT), OP != -1. [W@2, OP, PAT]
:~ assignment(OP, PAT, W, 0), not ml_high_confidence(OP, PAT), OP != -1. [W@1, OP, PAT]

#show assignment/4.