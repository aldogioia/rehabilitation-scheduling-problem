% -------- RULES --------
%Assign the starting time to every compulsory session and to the maximum number of the optional ones.
1 {start(ID,PER,TS) : time(PER,OP,TS)} 1 :- session(ID,_,OP,_,_,_,_,_,_,0,_).
0 {start(ID,PER,TS) : time(PER,OP,TS)} 1 :- session(ID,_,OP,_,_,_,_,_,_,1,_).
%For each starting time, assign the length.
1 {length(ID,PER,NL) : time(PER,OP,L), NL=L-ST, TS+NL <= END, NL>= MIN, NL<= MAX} 1 :- start(ID,PER,TS), period(PER,OP,ST,END), session(ID,_,OP,_,_,MIN,MAX,_,_,_,_).
%Get guess that assign to each session a location according to its macro location.
1 {sessionLocation(SES,LOC,MAC) : macroLocation(MAC,LOC)} 1 :- macroLocation(MAC,_), session(SES,_,_,MAC,_,_,_,_,_,_,_).
%reserve some time before the start of the session.
1 {before(ID,NL): time(PER,OP,L), NL=L-ST, NL<=TS-ST} 1 :- start(ID,PER,TS), period(PER,OP,ST,_), session(ID,_,OP,_,_,_,_,_,_,_,_).
%reserve some time after the end of the session.
1 {after(ID,NL): time(PER,OP,L), NL=L-ST, NL<=END-TS-LEN} 1 :- start(ID,PER,TS), period(PER,OP,ST,END), length(ID,PER,LEN), session(ID,_,OP,_,_,_,_,_,_,_,_).
%Define the candidate extended start and length.
extstart(ID,PER,TS-LB) :- start(ID,PER,TS), before(ID,LB).
extlength(ID,PER,L+LA+LB) :- length(ID,PER,L),after(ID,LA),before(ID,LB).
%Impose that individual assignments shall not overlap.
:- start(ID,PER,TS), length(ID,PER,L), session(ID,_,OP,_,0,_,_,_,_,_,_), start(ID2,PER,TS2), session(ID2,_,OP,_,0,_,_,_,_,_,_), ID!=ID2, TS2>=TS, TS2<TS+L.
%Impose that group assignments may not overlap with any other assignments.
:- start(ID,PER,TS), length(ID,PER,L), session(ID,_,OP,_,TY,_,_,_,_,_,_), start(ID2,PER,TS2), session(ID2,_,OP,_,2 ,_,_,_,_,_,_), TY!=2, TS2>=TS, TS2<TS+L.
:- start(ID,PER,TS), length(ID,PER,L), session(ID,_,OP,_,2 ,_,_,_,_,_,_), start(ID2,PER,TS2), session(ID2,_,OP,_,TY,_,_,_,_,_,_),TY!=2, TS2>=TS, TS2<TS+L.
%Impose that for each patient, no more than a session per period is assigned.
:- start(ID1,PER1,_), session(ID1,PAT,_,_,_,_,_,_,_,_,_), start(ID2,PER2,_), session(ID2,PAT,_,_,_,_,_,_,_,_,_), ID1!=ID2, PER1=PER2.
%Impose equal reduction of session lengths for sessions in the same location and period the difference of the differences between the ideal length and allocated length between any two sessions in the same location and period must not exceed 1 time unit.
:- length(ID1,PER,L1), session(ID1,_,OP,_,0,MIN1,OPT1,_,_,_,_), sessionLocation(ID1,PL,_), length(ID2,PER,L2), session(ID2,_,OP,_,0,MIN2,OPT2,_,_,_,_), sessionLocation(ID2,PL,_), OPT1-L1 <= OPT2-MIN2, OPT2-L2 <= OPT1-MIN1 , |OPT1 -L1 - OPT2 + L2| > 1.
:- length(ID1,PER,L1), session(ID1,_,OP,_,0,MIN1,OPT1,_,_,_,_), sessionLocation(ID1,PL,_), length(ID2,PER,L2), session(ID2,_,OP,_,0,MIN2,OPT2,_,_,_,_), sessionLocation(ID2,PL,_), OPT1-L1 > OPT2-MIN2, L2 > MIN2.
%impose that the lower ideal length sessions' allocated lengths must be reduced for last.
:- length(ID1,PER,L1), session(ID1,_,OP,_,0,MIN1,OPT1,_,_,_,_), sessionLocation(ID1,PL,_), length(ID2,PER,L2), session(ID2,_,OP,_,0,MIN2,OPT2,_,_,_,_), sessionLocation(ID2,PL,_), OPT1-L1 <= OPT2-MIN2, OPT2-L2 <= OPT1-MIN1, OPT2<OPT1, OPT1-L1 < OPT2-L2.
%Impose that for each session, the operator must not be occupied in a different place.
ses_each_hour(ID,OP,PL,PER,TS..TS+L-1) :- session(ID,_,OP,_,_,_,_,_,_,_,_), sessionLocation(ID,PL,_), extstart(ID,PER,TS), extlength(ID,PER,L).
:- ses_each_hour(ID,OP,PL,PER,T), ses_each_hour(ID2,OP,PL2,PER,T), ID != ID2, PL != PL2.
%Impose that each patient has their minimum time reserved.
:- patient(ID,_,MIN), #sum{LEN, SES: session(SES,ID,_,_,_,_,_,_,_,_,_), extlength(SES,_,LEN)} < MIN.
%Impose a limit to the concurrent use of equipment/locations with limited capacity.
:- location(LOC,LIM,PER,ST,END), LIM>0, time(PER,_,T), T>=ST, T<END, #count{ID: ses_each_hour(ID, _, LOC, PER,T)} > LIM.
%Impose that a session cannot happen during a forbidden time.
:- forbidden(PAT,PER,ST,_), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), ST>=TS, ST<TS+L.
:- forbidden(PAT,PER,ST,END), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), ST<=TS,END>TS.
:- forbidden(PAT,PER,_,END), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), END>TS, END<=TS+L.
%Check that at each time the distribution of sessions between each pair of locations inside the same macro location is fair.
:- time(PER,_,T), macroLocation(MAC,LOC1), macroLocation(MAC,LOC2), #sum{1,ID1 : ses_each_hour(ID1,_,LOC1,PER,T); -1,ID2 : ses_each_hour(ID2,_,LOC2,PER,T)} > 2.
% -------- WEAK CONSTRAINTS --------
:~ length(ID,_, L), session(ID,_,_,_,_,_, OPT,_,_,_,_), D = |L - OPT|. [D@8, ID]
:~ start(ID,PER,_), session(ID,_,_,_,0,_,_,OPT,_,_,1), D = |PER - OPT|. [D@7, ID]
:~ start(ID,PER,TS), session(ID,_,_,_,0,_,_,PER,OPT,_,1), D = |TS - OPT|. [D@6, ID]
#const optionals = 74.
:~ #count {ID : start(ID,_,_), session(ID,_,_,_,_,_,_,_,_,1,_)} = N, D = optionals - N. [D@5]
:~ start(ID,PER,_), session(ID,_,_,_,0,_,_,OPT,_,_,0), D = |PER - OPT|. [D@2, ID]
:~ start(ID,PER,TS), session(ID,_,_,_,0,_,_,PER,OPT,_,0), D = |TS - OPT|. [D@1, ID]
% -------- DIRECTIVES --------
#show start/3.
#show length/3.
#show sessionLocation/3.
#show session/11.