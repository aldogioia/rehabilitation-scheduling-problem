% -------- FACTS --------
% patient(ID,AUT,MIN)
% - ID: id - ID of the patient
% - AUT: autonomous - Indicates if the patient is autonomous
% - MIN: minSessionLength - Minimum time in TU that the patient should spend in all the sessions
patient(1 , 0, 7).
patient(2 , 0, 6).
patient(3 , 0, 1).
patient(4 , 0, 1).
patient(5 , 0, 1).
patient(6 , 0, 1).
patient(7 , 0, 1).
patient(8 , 0, 1).
patient(9 , 0, 5).
patient(10, 0, 5).
patient(11, 0, 7).
patient(12, 0, 6).
patient(13, 0, 7).
patient(14, 0, 5).
patient(15, 0, 7).
patient(16, 0, 7).
patient(17, 0, 5).
patient(18, 0, 7).
patient(19, 0, 6).
patient(20, 0, 6).
patient(21, 0, 6).
patient(22, 0, 6).
patient(23, 0, 6).
patient(24, 0, 6).
patient(25, 0, 7).
patient(26, 0, 7).
patient(27, 0, 5).
patient(28, 0, 7).
patient(29, 0, 7).
patient(30, 0, 7).
patient(31, 0, 6).
patient(32, 0, 7).
patient(33, 0, 6).
patient(34, 0, 7).
patient(35, 0, 5).
patient(36, 0, 6).
patient(37, 0, 5).
patient(38, 0, 7).
patient(39, 0, 6).
patient(40, 0, 7).
patient(41, 0, 5).
patient(42, 0, 6).
patient(43, 0, 6).
patient(44, 0, 6).
patient(45, 0, 6).
patient(46, 0, 6).
patient(47, 0, 6).
patient(48, 0, 6).
patient(49, 0, 6).
patient(50, 0, 6).
patient(51, 0, 6).
patient(52, 0, 6).
patient(53, 0, 6).
patient(54, 0, 6).
patient(55, 0, 6).
patient(56, 0, 6).
patient(57, 0, 6).
patient(58, 0, 6).
patient(59, 0, 6).
patient(60, 0, 6).
patient(61, 0, 6).
patient(62, 0, 6).
patient(63, 0, 6).
patient(64, 0, 6).
patient(65, 0, 6).
% location(ID,CAP,PER,STA,END)
% - ID: id - ID of the location
% - CAP: capacity - Maximum number of patients that a location can host at the same time
% - PER: period - In which period the location is available (morning or afternoon)
% - STA: start - At which time, in TU, the location starts to be available
% - END: end - At which time, in TU, the location will not be available anymore
location(1 , 4, 1, 0, 24).
location(1 , 4, 2, 0, 24).
location(2 , 5, 1, 0, 24).
location(2 , 5, 2, 0, 24).
location(3 , 5, 1, 0, 24).
location(3 , 5, 2, 0, 24).
location(4 , 1, 1, 0, 24).
location(4 , 1, 2, 0, 30).
location(5 , 1, 1, 0, 24).
location(5 , 1, 2, 0, 30).
location(6 , 1, 1, 0, 24).
location(6 , 1, 2, 0, 30).
location(7 , 1, 1, 0, 24).
location(7 , 1, 2, 0, 30).
location(8 , 1, 1, 0, 24).
location(8 , 1, 2, 0, 30).
location(9 , 1, 1, 0, 24).
location(9 , 1, 2, 0, 30).
location(10, 1, 1, 0, 24).
location(10, 1, 2, 0, 30).
% session(ID,PAT,OPE,LOC,TYP,MIN,LEN,PER,TIM,OPT,PRI)
% - ID: id - ID of the session
% - PAT: patientId - ID of the patient that partecipates in the session
% - OPE: operatorId - ID of the operator that partecipates in the session
% - LOC: locationId - ID of the location in which the session takes place
% - TYP: type - If the session is individual, supervised or a group one
% - MIN: minSessionLength - The minimal duration of the session, in TU
% - LEN: lenghtIdeal - The ideal length of the session in TU (often it corresponds to the maximum duration)
% - PER: periodIdeal - The best period to carry out the session (morning or afternoon)
% - TIM: timeIdeal - The best hour (in TU) to begin the session
% - OPT: optional - If the session is optional or mandatory
% - PRI: priority - The priority by which the ideal* settings are to be taken
session(1 , 1 , 1 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(2 , 2 , 1 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(3 , 3 , 2 , 3, 0, 1, 1, 0, 0 , 0, 0).
session(4 , 4 , 2 , 4, 0, 1, 1, 0, 0 , 0, 0).
session(5 , 5 , 2 , 7, 0, 1, 1, 0, 0 , 0, 0).
session(6 , 6 , 2 , 9, 0, 1, 1, 0, 0 , 0, 0).
session(7 , 7 , 2 , 5, 0, 1, 1, 0, 0 , 0, 0).
session(8 , 8 , 2 , 6, 0, 1, 1, 0, 0 , 0, 0).
session(9 , 9 , 3 , 1, 0, 3, 5, 0, 0 , 0, 0).
session(10, 10, 3 , 1, 0, 3, 5, 0, 0 , 0, 0).
session(11, 11, 3 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(12, 12, 3 , 1, 0, 3, 6, 0, 0 , 0, 0).
session(13, 13, 4 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(14, 14, 4 , 1, 0, 3, 5, 0, 0 , 0, 0).
session(15, 15, 5 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(16, 16, 5 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(17, 17, 5 , 1, 0, 3, 5, 0, 0 , 0, 0).
session(18, 18, 5 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(19, 19, 6 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(20, 20, 7 , 1, 0, 3, 7, 0, 0 , 1, 0).
session(21, 21, 7 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(22, 22, 7 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(23, 23, 7 , 1, 0, 3, 6, 0, 0 , 1, 0).
session(24, 24, 7 , 1, 0, 3, 6, 0, 0 , 0, 0).
session(25, 25, 8 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(26, 26, 8 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(27, 27, 8 , 1, 0, 3, 5, 0, 0 , 0, 0).
session(28, 28, 8 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(29, 29, 9 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(30, 30, 9 , 1, 0, 3, 7, 0, 0 , 0, 0).
session(31, 31, 9 , 1, 0, 3, 6, 0, 0 , 0, 0).
session(32, 32, 10, 1, 0, 3, 7, 0, 0 , 0, 0).
session(33, 33, 10, 1, 0, 3, 6, 0, 0 , 0, 0).
session(34, 34, 10, 1, 0, 3, 7, 0, 0 , 0, 0).
session(35, 35, 10, 1, 0, 3, 5, 0, 0 , 1, 0).
session(36, 36, 11, 1, 0, 3, 7, 0, 0 , 0, 0).
session(37, 37, 11, 1, 0, 3, 5, 0, 0 , 0, 0).
session(38, 38, 11, 1, 0, 3, 7, 0, 0 , 0, 0).
session(39, 39, 11, 1, 0, 3, 6, 0, 0 , 0, 0).
session(40, 40, 12, 1, 0, 3, 7, 0, 0 , 0, 0).
session(41, 41, 12, 1, 0, 3, 5, 0, 0 , 0, 0).
session(42, 42, 13, 2, 0, 6, 6, 2, 12, 0, 1).
session(43, 43, 13, 2, 0, 6, 6, 2, 18, 0, 1).
session(44, 44, 14, 2, 0, 6, 6, 1, 0 , 0, 1).
session(45, 45, 14, 2, 0, 6, 6, 1, 12, 0, 1).
session(46, 46, 14, 2, 0, 6, 6, 1, 6 , 0, 1).
session(47, 47, 14, 2, 0, 6, 6, 1, 18, 0, 1).
session(48, 48, 15, 8, 0, 6, 6, 2, 6 , 0, 1).
session(49, 49, 15, 2, 0, 6, 6, 1, 6 , 0, 1).
session(50, 50, 15, 2, 0, 6, 6, 1, 18, 0, 1).
session(51, 51, 15, 2, 0, 6, 6, 2, 18, 0, 1).
session(52, 52, 15, 2, 0, 6, 6, 2, 12, 0, 1).
session(53, 53, 15, 2, 0, 6, 6, 1, 0 , 0, 1).
session(54, 54, 16, 2, 0, 6, 6, 2, 18, 0, 1).
session(55, 55, 16, 2, 0, 6, 6, 1, 0 , 0, 1).
session(56, 56, 16, 2, 0, 6, 6, 1, 6 , 0, 1).
session(57, 57, 16, 2, 0, 6, 6, 1, 12, 0, 1).
session(58, 58, 16, 2, 0, 6, 6, 2, 12, 0, 1).
session(59, 59, 16, 2, 0, 6, 6, 2, 6 , 0, 1).
session(60, 60, 16, 2, 0, 6, 6, 1, 18, 0, 1).
session(61, 61, 17, 2, 0, 6, 6, 1, 6 , 0, 1).
session(62, 62, 17, 2, 0, 6, 6, 1, 12, 0, 1).
session(63, 63, 17, 2, 0, 6, 6, 1, 0 , 0, 1).
session(64, 64, 17, 2, 0, 6, 6, 1, 18, 0, 1).
session(65, 65, 17, 2, 0, 6, 6, 2, 0 , 0, 1).
% period(PER,OPE,STA,END)
% - PER: period - Indicates in which period the shift starts (morning or afternoon)
% - OPE: operatorId - The ID of the operator that does the shift
% - STA: start - The time, in TU, at which the session starts
% - END: end - The time, in TU, at which the session ends
period(1, 1 , 0, 24).
period(2, 1 , 6, 24).
period(1, 2 , 6, 24).
period(2, 2 , 6, 30).
period(1, 3 , 0, 24).
period(2, 3 , 6, 24).
period(1, 4 , 0, 24).
period(2, 4 , 0, 6 ).
period(1, 5 , 6, 24).
period(2, 5 , 0, 12).
period(1, 6 , 6, 24).
period(1, 7 , 0, 24).
period(2, 7 , 6, 24).
period(1, 8 , 0, 24).
period(2, 8 , 6, 24).
period(1, 9 , 0, 24).
period(2, 9 , 6, 24).
period(1, 10, 0, 24).
period(2, 10, 6, 24).
period(1, 11, 0, 24).
period(2, 11, 6, 24).
period(1, 12, 6, 24).
period(1, 13, 0, 24).
period(2, 13, 6, 24).
period(1, 14, 0, 24).
period(2, 14, 0, 6 ).
period(1, 15, 0, 24).
period(2, 15, 6, 24).
period(1, 16, 0, 24).
period(2, 16, 6, 24).
period(1, 17, 0, 24).
period(2, 17, 0, 6 ).
% time(PER,OPE,LEN)
% - PER: period - Indicates in which period the shift starts (morning or afternoon)
% - OPE: operatorId - The ID of the operator that does the shift
% - LEN: length - The length, in TU, of the operator's shift
time(1, 1 , 0..24).
time(2, 1 , 6..24).
time(1, 2 , 6..24).
time(2, 2 , 6..30).
time(1, 3 , 0..24).
time(2, 3 , 6..24).
time(1, 4 , 0..24).
time(2, 4 , 0..6 ).
time(1, 5 , 6..24).
time(2, 5 , 0..12).
time(1, 6 , 6..24).
time(1, 7 , 0..24).
time(2, 7 , 6..24).
time(1, 8 , 0..24).
time(2, 8 , 6..24).
time(1, 9 , 0..24).
time(2, 9 , 6..24).
time(1, 10, 0..24).
time(2, 10, 6..24).
time(1, 11, 0..24).
time(2, 11, 6..24).
time(1, 12, 6..24).
time(1, 13, 0..24).
time(2, 13, 6..24).
time(1, 14, 0..24).
time(2, 14, 0..6 ).
time(1, 15, 0..24).
time(2, 15, 6..24).
time(1, 16, 0..24).
time(2, 16, 6..24).
time(1, 17, 0..24).
time(2, 17, 0..6 ).
% macroLocation(MAC,LOC)
% - MAC: macroLocationId - The id of the macro-location
% - LOC: locationId - The id of the location
macroLocation(1, 1).
macroLocation(1, 2).
% sessionLocation(SES,LOC,MAC)
% - SES: sessionId - The id of the session
% - LOC: locationId - The id of the location in which the session takes place
% - MAC: macroLocationId - The if of the macro-location in which the session takes place
sessionLocation(3 , 4 , 3).
sessionLocation(4 , 5 , 4).
sessionLocation(5 , 8 , 7).
sessionLocation(6 , 10, 9).
sessionLocation(7 , 6 , 5).
sessionLocation(8 , 7 , 6).
sessionLocation(42, 3 , 2).
sessionLocation(43, 3 , 2).
sessionLocation(44, 3 , 2).
sessionLocation(45, 3 , 2).
sessionLocation(46, 3 , 2).
sessionLocation(47, 3 , 2).
sessionLocation(48, 9 , 8).
sessionLocation(49, 3 , 2).
sessionLocation(50, 3 , 2).
sessionLocation(51, 3 , 2).
sessionLocation(52, 3 , 2).
sessionLocation(53, 3 , 2).
sessionLocation(54, 3 , 2).
sessionLocation(55, 3 , 2).
sessionLocation(56, 3 , 2).
sessionLocation(57, 3 , 2).
sessionLocation(58, 3 , 2).
sessionLocation(59, 3 , 2).
sessionLocation(60, 3 , 2).
sessionLocation(61, 3 , 2).
sessionLocation(62, 3 , 2).
sessionLocation(63, 3 , 2).
sessionLocation(64, 3 , 2).
sessionLocation(65, 3 , 2).
% -------- RULES --------
%Defines the allowed times in which a session can actually start.
forbiddenRange(ID, PER, XSTA, END) :- forbidden(PAT, PER, STA, END), session(ID,PAT,OP,_,_,MIN,_,_,_,_,_), XSTA = STA - MIN + 1.
forbiddenTime(ID, PER, STA..END-1) :- forbiddenRange(ID, PER, STA, END).
allowedTime(ID,PER,T) :- time(PER,OP,T), session(ID,PAT,OP,_,_,MIN,_,_,_,_,_), period(PER,OP,_, MAX), T <= MAX - MIN, not forbiddenTime(ID,PER,T).
%Finds the maximum lenght of a session comparing the ideal time with the mimimum time of the patient.
sessionMaxLengths(ID, MAX1..MAX2) :-  session(ID,PAT,_,_,_,_,MAX1,_,_,_,_), patient(PAT, _, MAX2).
sessionMaxLengths(ID, MAX2..MAX1) :-  session(ID,PAT,_,_,_,_,MAX1,_,_,_,_), patient(PAT, _, MAX2).
sessionMaxLength(ID, MAX) :- sessionMaxLengths(ID, MAX), session(ID,PAT,_,_,_,_,MAX1,_,_,_,_), patient(PAT, _, MAX2), MAX >= MAX1, MAX >= MAX2.
%Assign the starting time to every compulsory session and to the maximum number of the optional ones.
1 {start(ID,PER,TS) : allowedTime(ID,PER,TS)} 1 :- session(ID,_,OP,_,_,MIN,_,_,_,0,_).
0 {start(ID,PER,TS) : allowedTime(ID,PER,TS)} 1 :- session(ID,_,OP,_,_,MIN,_,_,_,1,_).
%For each starting time, assign the length.
1 {length(ID,PER,NL) : time(PER,OP,T), NL=T-TS, NL>= MIN, NL<= MAX} 1 :- start(ID,PER,TS), session(ID,_,OP,_,_,MIN,_,_,_,_,_), sessionMaxLength(ID, MAX).
%Get guess that assign to each session a location according to its macro location.
1 {sessionLocation(SES,LOC,MAC) : macroLocation(MAC,LOC)} 1 :- macroLocation(MAC,_), session(SES,_,_,MAC,_,_,_,_,_,_,_).
%reserve some time before the start of the individual session.
1 {before(ID,NL): allowedTime(ID,PER,T), T<=TS, NL=TS-T, NL<=MAX-MIN} 1 :- start(ID,PER,TS), session(ID,_,OP,_,0,MIN,_,_,_,_,_), sessionMaxLength(ID, MAX).
%reserve some time after the end of the individual session.
1 {after(ID,NL): time(PER,OP,T), T>=TS+LEN, NL=T-TS-LEN, NL<=MAX-MIN} 1 :- start(ID,PER,TS), length(ID,PER,LEN), session(ID,_,OP,_,0,MIN,_,_,_,_,_), sessionMaxLength(ID, MAX).
%supervised sessions don't need before and after.
before(ID,0) :- session(ID,_,_,_,1,_,_,_,_,_,_).
after(ID,0) :- session(ID,_,_,_,1,_,_,_,_,_,_).
%Define the candidate extended start and length.
extstart(ID,PER,TS-LB) :- start(ID,PER,TS), before(ID,LB).
extlength(ID,PER,LEN) :- length(ID,PER,L), after(ID,LA),before(ID,LB), LEN=L+LA+LB, sessionMaxLength(ID, MAX), LEN <= MAX.
:- start(ID, _, _), not extlength(ID, _, _).
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
sessionAtTime(ID,OP,PL,PER,TS..TS+L-1) :- session(ID,_,OP,_,_,_,_,_,_,_,_), sessionLocation(ID,PL,_), extstart(ID,PER,TS), extlength(ID,PER,L).
:- time(PER,OP,T), #count{PL : sessionAtTime(_,OP,PL,PER,T)} > 1.
%Impose that each patient has their minimum time reserved.
:- patient(ID,_,MIN), #sum{LEN, SES: session(SES,ID,_,_,_,_,_,_,_,_,_), extlength(SES,_,LEN)} < MIN.
%Impose a limit to the concurrent use of equipment/locations with limited capacity.
:- location(LOC,LIM,PER,ST,END), LIM>0, time(PER,_,T), T>=ST, T<END, #count{ID: sessionAtTime(ID, _, LOC, PER,T)} > LIM.
%Impose that a session cannot happen during a forbidden time.
:- forbidden(PAT,PER,ST,_), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), ST>=TS, ST<TS+L.
:- forbidden(PAT,PER,ST,END), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), ST<=TS,END>TS.
:- forbidden(PAT,PER,_,END), session(ID,PAT,_,_,_,_,_,_,_,_,_), extstart(ID,PER,TS), extlength(ID,PER,L), END>TS, END<=TS+L.
%Check that at each time the distribution of sessions between each pair of locations inside the same macro location is fair.
:- time(PER,_,T), macroLocation(MAC,LOC1), macroLocation(MAC,LOC2), #sum{1,ID1 : sessionAtTime(ID1,_,LOC1,PER,T); -1,ID2 : sessionAtTime(ID2,_,LOC2,PER,T)} > 2.
% -------- WEAK CONSTRAINTS --------
%For each session minimize the difference between the allocated and ideal lengths
:~ length(ID,_, L), session(ID,_,_,_,_,_, OPT,_,_,_,_), D = |L - OPT|. [D@8, ID]
%Try to place individual prioritized sessions near their ideal period
:~ start(ID,PER,_), session(ID,_,_,_,0,_,_,OPT,_,_,1), D = |PER - OPT|. [D@7, ID]
%Try to place individual prioritized sessions near their ideal time
:~ start(ID,PER,TS), session(ID,_,_,_,0,_,_,PER,OPT,_,1), D = |TS - OPT|. [D@6, ID]
%Minimize the number of optional session not assigned
#const optionals = 3.
:~ #count {ID : start(ID,_,_), session(ID,_,_,_,_,_,_,_,_,1,_)} = N, D = optionals - N. [D@5]
%Try to place individual not prioritized sessions near their ideal period
:~ start(ID,PER,_), session(ID,_,_,_,0,_,_,OPT,_,_,0), D = |PER - OPT|. [D@2, ID]
%Try to place individual not prioritized sessions near their ideal time
:~ start(ID,PER,TS), session(ID,_,_,_,0,_,_,PER,OPT,_,0), D = |TS - OPT|. [D@1, ID]
% -------- DIRECTIVES --------
#show start/3.
#show length/3.
#show sessionLocation/3.