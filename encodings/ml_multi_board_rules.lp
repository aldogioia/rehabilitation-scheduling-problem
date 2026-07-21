% ==============================================================================
% FASE 1: FILTRAGGIO CANDIDATI (Multi-Target)
% ==============================================================================
% 1. Pazienti Storici: Valutiamo SEMPRE i medici preferiti
valid_candidate(OP, PAT) :- 
    patient(PAT, TYPE),
    pref(OP, PAT, _),
    op_qual(OP, TYPE).

% 2. Ripieghi Guidati dal ML per Tipologia
valid_candidate(OP, PAT) :- 
    patient(PAT, TYPE),
    op_qual(OP, TYPE),
    not pref(OP, PAT, _),
    ml_capacity(OP, TYPE, PRED, _), PRED > 0.

valid_candidate(-1, PAT) :- patient(PAT, _).

% ==============================================================================
% FASE 2: CHOICE RULE E LIMITI FISICI HARD
% ==============================================================================
1 { assignment(OP, PAT) : valid_candidate(OP, PAT) } 1 :- patient(PAT, _).

:- operator(OP, MAX), #count{PAT : assignment(OP, PAT)} > MAX, OP != -1.
:- assignment(OP, 49), assignment(OP, 41), OP != -1.

% ==============================================================================
% FASE 3: OBIETTIVI DI BUSINESS
% ==============================================================================
assigned_count(OP, TYPE, N) :- ml_capacity(OP, TYPE, _, _), N = #count{ PAT : assignment(OP, PAT), patient(PAT, TYPE) }.

% OBIETTIVO 1 (@4)
:~ assignment(-1, PAT). [1 @ 4, PAT]

% OBIETTIVO 2 (@3)
:~ assigned_count(OP, TYPE, N), ml_capacity(OP, TYPE, PRED, _), N > PRED. [N - PRED @ 3, OP, TYPE]
:~ assignment(OP, PAT), patient(PAT, TYPE), not ml_capacity(OP, TYPE, _, _), OP != -1. [1 @ 3, OP, PAT]

% OBIETTIVO 3 (@2)
:~ assigned_count(OP, TYPE, N), ml_capacity(OP, TYPE, PRED, _), PRED > N. [PRED - N @ 2, OP, TYPE]

% OBIETTIVO 4 (@1)
:~ assignment(OP, PAT), pref(OP, PAT, W). [W @ 1, OP, PAT]
:~ assignment(OP, PAT), not pref(OP, PAT, _), OP != -1. [10 @ 1, OP, PAT]

#show assignment/2.