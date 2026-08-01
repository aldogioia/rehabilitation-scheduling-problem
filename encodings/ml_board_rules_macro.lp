% -------- DIRETTIVE --------
#show assignment/4.

% -------- REGOLE DI ASSEGNAZIONE --------
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

% -------- REGOLE DI SPAZIO, LOCATION E TEMPO --------
uniqueLocationLength(OP, PAT, L) :- 
    operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), 
    patient(PAT,_,_,_,L), 
    assignment(OP,PAT,_,_), 
    session(_,PAT,_,LOC), 
    #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} < 2.

sameLocationLength(OP, PAT, L) :- 
    operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), 
    patient(PAT,_,_,_,_), 
    assignment(OP,PAT,_,_), 
    session(_,PAT,L,LOC), 
    #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} > 1.

% Impossibile eccedere il tempo di lavoro effettivo dell'operatore
:- operator(OP,EFF,_,_,_,_,_,_,_,_,_,_,_,_,_), 
   #sum{U, PAT : uniqueLocationLength(OP, PAT, U); S, PAT : sameLocationLength(OP, PAT, S)} > EFF.

% -------- REGOLE SULLE QUALIFICHE CLINICHE (ANTI-ALLUCINAZIONE ML) --------
:- assignment(OP, PAT, _, _), patient(PAT, 1, _, _, _), operator(OP,_,_,_, NLP,NL,N,NP,_,_,_,_,_,_,_), (NLP+NL+N+NP) == 0.
:- assignment(OP, PAT, _, _), patient(PAT, 2, _, _, _), operator(OP,_,_,_, _,_,_,_, OLP,OL,OP_arg,O, _,_,_), (OLP+OL+OP_arg+O) == 0.
:- assignment(OP, PAT, _, _), patient(PAT, 4, _, _, _), operator(OP,_,_,_, _,_,_,_, _,_,_,_, 0,_,_).
:- assignment(OP, PAT, _, _), patient(PAT, 5, _, _, _), operator(OP,_,_,_, _,_,_,_, _,_,_,_, _,0,_).
:- assignment(OP, PAT, _, _), patient(PAT, 6, _, _, _), operator(OP,_,_,_, _,_,_,_, _,_,_,_, _,_,0).

% -------- LOGICA NEURO-SIMBOLICA (PREDIZIONI ML PER TIPOLOGIA) --------
% 1. Calcolo degli assegnamenti correnti per macro-area clinica
assigned_macro(OP, TYPE, C) :- 
    ml_prediction(OP, TYPE, _, _, _), 
    C = #count{PAT : assignment(OP, PAT, _, _), patient(PAT, TYPE, _, _, _)}.

% 2. Calcolo Overbooking e Underbooking
overbooking_macro(OP, TYPE, C - Q50) :- 
    assigned_macro(OP, TYPE, C), ml_prediction(OP, TYPE, Q50, _, _), C > Q50.

underbooking_macro(OP, TYPE, Q50 - C) :- 
    assigned_macro(OP, TYPE, C), ml_prediction(OP, TYPE, Q50, _, _), C < Q50.

% -------- WEAK CONSTRAINTS (OTTIMIZZAZIONE) --------
% [Livello 1] Minimizza il peso per le preferenze storiche
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]

% [Livello 2] Minimizza i pazienti lasciati a terra
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]

% [Livello 3] Minimizza il peso per le preferenze scelte esplicitamente dal paziente.
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]

% [Livello 4 - ML] Penalità per Overbooking
:~ overbooking_macro(OP, TYPE, DEV), 
   ml_prediction(OP, TYPE, _, _, DELTA_OVER), 
   WEIGHT = (DEV * 100) / (DELTA_OVER + 1). [WEIGHT@4, OP, TYPE, over]

% [Livello 4 - ML] Penalità per Underbooking
:~ underbooking_macro(OP, TYPE, DEV), 
   ml_prediction(OP, TYPE, _, DELTA_UNDER, _), 
   WEIGHT = (DEV * 100) / (DELTA_UNDER + 1). [WEIGHT@4, OP, TYPE, under]