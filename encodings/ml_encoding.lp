% -------- RULES --------
1 {assignment(OP, PAT, W, PREF) : operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), pref(OP, PAT, W, PREF)} 1 :- patient(PAT,_,_,_,_).

%First of all the predicate uniqueLocationLength(OP,PAT,L) is defined so that it's assignetd to true when the session of lenght L of the patient PAT by operator OP has to be executed in solitary in a single location:.
uniqueLocationLength(OP, PAT, L) :- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), patient(PAT,_,_,_,L), assignment(OP,PAT,_,_), session(_,PAT,_,LOC), #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} < 2.

%Then the predicate sameLocationLength(OP,PAT,L) is defined so that it's assignetd to true when the session of lenght L of the patient PAT by operator OP can be executed in the same location of another session (supervised).
sameLocationLength(OP, PAT, L) :- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,_), patient(PAT,_,_,_,_), assignment(OP,PAT,_,_), session(_,PAT,L,LOC), #count{ID : patient(ID,_,_,_,_), session(_,ID,_,LOC), assignment(OP,ID,_,_)} > 1.

%It's not possible for an operator that the cumulative duration of unique or shared session exceeds its operational time.
:- operator(OP,MAX,_,_,_,_,_,_,_,_,_,_,_,_,_), #sum{U, PAT : uniqueLocationLength(OP, PAT, U); S, PAT : sameLocationLength(OP, PAT, S)} > MAX.

%Impose that each operator has at most the number of patient assigned as determined by the distribution.
:- operator(OP,_,_,MAX,_,_,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_)} > MAX.

%Fair distribution of patients of type nlp.
:- operator(OP,_,_,_,MAX,_,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,1,1,_)} > MAX.
%Fair distribution of patients of type nl.
:- operator(OP,_,_,_,_,MAX,_,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,2,1,_)} > MAX.
%Fair distribution of patients of type n.
:- operator(OP,_,_,_,_,_,MAX,_,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,2,0,_)} > MAX.
%Fair distribution of patients of type np.
:- operator(OP,_,_,_,_,_,_,MAX,_,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,1,1,0,_)} > MAX.
%Fair distribution of patients of type olp.
:- operator(OP,_,_,_,_,_,_,_,MAX,_,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,1,1,_)} > MAX.
%Fair distribution of patients of type ol.
:- operator(OP,_,_,_,_,_,_,_,_,MAX,_,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,2,1,_)} > MAX.
%Fair distribution of patients of type o.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,MAX,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,2,0,_)} > MAX.
%Fair distribution of patients of type op.
:- operator(OP,_,_,_,_,_,_,_,_,_,MAX,_,_,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,2,1,0,_)} > MAX.
%Fair distribution of patients of type cp.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,MAX,_,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,4,_,_,_)} > MAX.
%Fair distribution of patients of type cn.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,MAX,_), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,5,_,_,_)} > MAX.
%Fair distribution of patients of type mac.
:- operator(OP,_,_,_,_,_,_,_,_,_,_,_,_,_,MAX), #count{PAT : assignment(OP,PAT,_,_), patient(PAT,6,_,_,_)} > MAX.

%Impose incompatibility between patients (found in preprocessing).
:- assignment(OP,49,_,_), assignment(OP,41,_,_), OP != -1.

% -------- WEAK CONSTRAINTS ORIGINAL --------
%minimize the sum of weights for patients with preference specified by history and not explicitly by patient
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
%minimize the number of assignments to the pretend operator
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
%minimize the sum of weights for patients with preferred operators
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]



% INTEGRAZIONE NEURO-SIMBOLICA: MACHINE LEARNING WEAK CONSTRAINTS

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