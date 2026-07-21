% ==============================================================================
% FASE 1: FILTRAGGIO CANDIDATI (Dominio Pulito)
% ==============================================================================
% 1. Pazienti Storici: Valutiamo SEMPRE i medici preferiti
valid_candidate(OP, PAT) :- 
    patient(PAT, TYPE),
    pref(OP, PAT, _),
    op_qual(OP, TYPE).

% 2. Ripieghi Guidati dal ML: Valutiamo altri medici SOLO se il ML li ha aperti
valid_candidate(OP, PAT) :- 
    patient(PAT, TYPE),
    op_qual(OP, TYPE),
    not pref(OP, PAT, _),
    ml_capacity(OP, PRED, _), PRED > 0.

valid_candidate(-1, PAT) :- patient(PAT, _).

% ==============================================================================
% FASE 2: CHOICE RULE E LIMITI FISICI HARD
% ==============================================================================
1 { assignment(OP, PAT) : valid_candidate(OP, PAT) } 1 :- patient(PAT, _).

:- operator(OP, MAX), #count{PAT : assignment(OP, PAT)} > MAX, OP != -1.
:- assignment(OP, 49), assignment(OP, 41), OP != -1.

% ==============================================================================
% FASE 3: OBIETTIVI DI BUSINESS (Priorità Assolute, Pesi Semplici)
% ==============================================================================
assigned_count(OP, N) :- ml_capacity(OP, _, _), N = #count{ PAT : assignment(OP, PAT) }.

% @4 CRITICO: Minimizzare Under-Booking Assoluto
:~ assignment(-1, PAT). [1 @ 4, PAT]

% @3 SEVERO: Evitare Over-Booking rispetto al ML
% Il livello 3 basta e avanza per far capire a Clingo che è un errore grave.
:~ assigned_count(OP, N), ml_capacity(OP, PRED, _), N > PRED. [N - PRED @ 3, OP]
:~ assignment(OP, PAT), not ml_capacity(OP, _, _), OP != -1. [1 @ 3, OP, PAT]

% @2 MODERATO: Minimizzare Under-Booking rispetto al ML
:~ assigned_count(OP, N), ml_capacity(OP, PRED, _), PRED > N. [PRED - N @ 2, OP]

% @1 LEGGERO: Preferenze Cliniche
:~ assignment(OP, PAT), pref(OP, PAT, W). [W @ 1, OP, PAT]
:~ assignment(OP, PAT), not pref(OP, PAT, _), OP != -1. [10 @ 1, OP, PAT]

#show assignment/2.