% -------- DIRETTIVE --------
#show assignment/4.

% -------- REGOLE DI ASSEGNAZIONE --------
% Assegna ogni paziente esattamente a un operatore (scegliendo tra le preferenze).
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

% -------- REGOLE DI INCOMPATIBILITA' --------
% Evita associazioni vietate scoperte nella fase di pre-processing.
:- assignment(OP, 49, _, _), assignment(OP, 41, _, _), OP != -1.

% -------- REGOLE DI SPAZIO E LOCATION --------
% uniqueLocationLength: vero se la sessione di lunghezza L deve essere eseguita in solitario in una singola stanza.
uniqueLocationLength(OP, PAT, L) :- 
    operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), 
    patient(PAT,_,_,_,L), 
    assignment(OP,PAT,_,_), 
    session(_,PAT,_,LOC), 
    #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} < 2.

% sameLocationLength: vero se la sessione può essere eseguita nella stessa stanza (supervisionata).
sameLocationLength(OP, PAT, L) :- 
    operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), 
    patient(PAT,_,_,_,_), 
    assignment(OP,PAT,_,_), 
    session(_,PAT,L,LOC), 
    #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} > 1.

% -------- LOGICA NEURO-SIMBOLICA (PREDIZIONI ML) --------
% 1. Calcolo degli assegnamenti correnti per macro-area clinica (1 = Neuro, 2 = Orto).
assigned_macro(OP, TYPE, C) :- 
    ml_prediction(OP, TYPE, _, _), 
    C = #count{PAT : assignment(OP, PAT, _, _), patient(PAT, TYPE, _, _, _)}.

% 2. Calcolo della deviazione: Overbooking (Assegnati > Q50).
deviation(OP, TYPE, C - Q50) :- 
    assigned_macro(OP, TYPE, C), 
    ml_prediction(OP, TYPE, Q50, _), 
    C > Q50.

% 3. Calcolo della deviazione: Underbooking (Assegnati < Q50).
deviation(OP, TYPE, Q50 - C) :- 
    assigned_macro(OP, TYPE, C), 
    ml_prediction(OP, TYPE, Q50, _), 
    C < Q50.

% -------- WEAK CONSTRAINTS (OTTIMIZZAZIONE) --------

% [Livello 1] Minimizza il peso per le preferenze specificate dallo storico.
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]

% [Livello 2] Minimizza il numero di pazienti lasciati a terra (assegnati all'operatore fittizio -1).
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]

% [Livello 3] Minimizza il peso per le preferenze scelte esplicitamente dal paziente.
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]

% [Livello 4 - ML] Penalizza gli scostamenti dalla predizione TabPFN.
% Il peso decresce all'aumentare dell'incertezza del modello (Delta = q90 - q10).
:~ deviation(OP, TYPE, DEV), 
   ml_prediction(OP, TYPE, _, DELTA), 
   WEIGHT = (DEV * 100) / (DELTA + 1). [WEIGHT@4, OP, TYPE]