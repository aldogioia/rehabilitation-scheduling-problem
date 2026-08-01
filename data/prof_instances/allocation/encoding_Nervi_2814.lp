% -------- FACTS --------
% operator(ID,EFF,TYP,MAX,NLP,NL,N,NP,OLP,OL,OP,O,CP,CN,MAC)
% - ID: id - ID of the operator
% - EFF: effectiveTime - How much time the operator can spend on visits in TU
% - TYP: type - Indicates if the operator is part-time or not (0: full-time, 1: part-time)
% - MAX: maximumAssignments - Indicates the maximum num of patients that the operator can take
% - NLP: nlp - The maximum number of patients of type Paying Neurological Patient with Lift the operator can take
% - NL: nl - The maximum number of patients of type (Not Paying) Neurological Patient with Lift the operator can take
% - N: n - The maximum number of patients of type (Not Paying) Neurological Patient (without Lift) the operator can take
% - NP: np - The maximum number of patients of type Paying Neurological Patient (without Lift) the operator can take
% - OLP: olp - The maximum number of patients of type Paying Orthopedic Patient with Lift the operator can take
% - OL: ol - The maximum number of patients of type (Not Paying) Orthopedic Patient with Lift the operator can take
% - OP: op - The maximum number of patients of type Paying Orthopedic Patient (without Lift) the operator can take
% - O: o - The maximum number of patients of type (Not Paying) Orthopedic Patient (without Lift) the operator can take
% - CP: cp - The maximum number of patients of type CoViD Positive the operator can take
% - CN: cn - The maximum number of patients of type CoViD Negative the operator can take
% - MAC: mac - The maximum number of patieof of type MAC the operator can take
operator(1 , 33 , 0, 7  , 0  , 0  , 4  , 0  , 0  , 1  , 1  , 1  , 0  , 0  , 0  ).
operator(2 , 20 , 1, 4  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(3 , 20 , 1, 4  , 0  , 0  , 2  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(4 , 34 , 0, 7  , 0  , 0  , 4  , 0  , 0  , 0  , 0  , 3  , 0  , 0  , 0  ).
operator(5 , 29 , 0, 6  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 3  , 0  , 0  , 0  ).
operator(7 , 27 , 0, 5  , 0  , 0  , 4  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(8 , 17 , 1, 3  , 0  , 0  , 2  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(9 , 33 , 0, 7  , 0  , 1  , 3  , 0  , 0  , 0  , 1  , 2  , 0  , 0  , 0  ).
operator(12, 33 , 0, 6  , 0  , 0  , 5  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(13, 20 , 1, 4  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(14, 20 , 1, 4  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(16, 14 , 1, 3  , 0  , 0  , 2  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).
% patient(ID,TYP,PAY,AID,MIN)
% - ID: id - ID of the patient
% - TYP: type - Type of patient (neurologico, ortopedico, alcolista, covid+, covid-, MAC)
% - PAY: paying - If the patient is paying
% - AID: aidNeeds - In the patient needs aid (lifter)
% - MIN: minimumDuration - Minimum cumulative time in rehab in TU for all sessions on the same day
patient(30, 1, 2, 0, 6).
patient(7 , 2, 1, 0, 9).
patient(12, 1, 2, 0, 6).
patient(6 , 1, 2, 0, 6).
patient(57, 1, 2, 0, 6).
patient(4 , 1, 2, 0, 6).
patient(43, 1, 2, 0, 6).
patient(13, 1, 2, 0, 6).
patient(28, 1, 2, 0, 6).
patient(34, 1, 2, 0, 6).
patient(32, 1, 2, 0, 6).
patient(37, 1, 2, 0, 6).
patient(47, 1, 2, 0, 6).
patient(49, 1, 2, 0, 6).
patient(52, 1, 2, 0, 6).
patient(36, 1, 2, 0, 6).
patient(17, 1, 2, 0, 6).
patient(56, 1, 2, 0, 6).
patient(16, 1, 2, 0, 6).
patient(38, 1, 2, 1, 6).
patient(29, 1, 2, 0, 6).
patient(45, 1, 2, 0, 6).
patient(55, 2, 2, 0, 6).
patient(48, 1, 2, 0, 6).
patient(9 , 1, 2, 0, 6).
patient(54, 1, 2, 0, 6).
patient(21, 2, 2, 0, 6).
patient(5 , 2, 2, 0, 6).
patient(8 , 2, 2, 0, 6).
patient(39, 1, 2, 0, 6).
patient(25, 2, 2, 0, 6).
patient(27, 1, 2, 0, 6).
patient(40, 2, 2, 0, 6).
patient(3 , 2, 2, 1, 6).
patient(31, 2, 2, 0, 6).
patient(59, 2, 2, 0, 6).
patient(58, 1, 2, 0, 6).
patient(42, 2, 1, 0, 9).
patient(10, 1, 2, 0, 6).
patient(33, 2, 2, 0, 6).
patient(46, 2, 2, 0, 6).
patient(1 , 1, 2, 0, 6).
patient(14, 2, 2, 0, 6).
patient(24, 2, 2, 0, 6).
patient(15, 2, 2, 0, 6).
patient(35, 2, 2, 0, 6).
patient(51, 1, 2, 0, 6).
patient(18, 2, 2, 0, 6).
patient(53, 1, 2, 0, 5).
patient(2 , 1, 2, 0, 6).
patient(26, 2, 2, 0, 6).
patient(44, 2, 2, 0, 6).
patient(23, 1, 2, 0, 6).
patient(22, 1, 2, 0, 6).
patient(11, 1, 2, 0, 6).
patient(19, 1, 2, 0, 6).
patient(41, 1, 2, 0, 6).
patient(50, 2, 2, 0, 6).
patient(20, 2, 2, 0, 6).
% session(ID,PAT,MIN,LOC)
% - ID: id - ID of the session
% - PAT: patientId - ID of the patient that does the session
% - MIN: minimumDuration - Minimum length of the session in TU
% - LOC: location - Location in which the session took place
session(35, 30, 3, 1).
session(8 , 7 , 3, 1).
session(9 , 7 , 2, 2).
session(15, 12, 3, 1).
session(7 , 6 , 3, 1).
session(69, 57, 3, 1).
session(5 , 4 , 3, 1).
session(51, 43, 3, 1).
session(16, 13, 3, 1).
session(32, 28, 3, 1).
session(40, 34, 3, 1).
session(38, 32, 3, 1).
session(44, 37, 3, 1).
session(57, 47, 3, 1).
session(59, 49, 3, 1).
session(63, 52, 3, 1).
session(42, 36, 3, 1).
session(20, 17, 3, 1).
session(68, 56, 3, 1).
session(19, 16, 3, 1).
session(45, 38, 3, 1).
session(33, 29, 3, 1).
session(54, 45, 3, 1).
session(67, 55, 3, 1).
session(58, 48, 3, 1).
session(11, 9 , 3, 1).
session(66, 54, 3, 1).
session(25, 21, 3, 1).
session(6 , 5 , 3, 1).
session(10, 8 , 3, 1).
session(46, 39, 3, 1).
session(29, 25, 3, 1).
session(31, 27, 3, 1).
session(47, 40, 3, 1).
session(4 , 3 , 3, 1).
session(36, 31, 3, 1).
session(71, 59, 3, 1).
session(70, 58, 3, 1).
session(49, 42, 3, 1).
session(13, 10, 3, 1).
session(39, 33, 3, 1).
session(55, 46, 3, 1).
session(1 , 1 , 3, 1).
session(17, 14, 3, 1).
session(28, 24, 3, 1).
session(18, 15, 3, 1).
session(41, 35, 3, 1).
session(62, 51, 3, 1).
session(22, 18, 3, 1).
session(65, 53, 3, 2).
session(3 , 2 , 3, 1).
session(30, 26, 3, 1).
session(53, 44, 3, 1).
session(27, 23, 3, 1).
session(26, 22, 3, 1).
session(14, 11, 3, 1).
session(23, 19, 3, 1).
session(48, 41, 3, 1).
session(61, 50, 3, 1).
session(24, 20, 3, 1).
% pref(OPE,PAT,WEI,HAS)
% - OPE: operatorId - ID of the Operator
% - PAT: patientId - ID of the Patient
% - WEI: weight - Priority of the preference
% - HAS: hasUserChosenOperator - Indicates if the preference has been given by the operator/patient or if it is inherited from the previous schedules 
pref(-1, 30, 10, 1).
pref(38, 30, 0 , 1).
pref(12, 30, 1 , 1).
pref(7 , 30, 1 , 1).
pref(2 , 30, 1 , 1).
pref(9 , 30, 1 , 1).
pref(1 , 30, 1 , 1).
pref(16, 30, 1 , 1).
pref(14, 30, 1 , 1).
pref(13, 30, 1 , 1).
pref(5 , 30, 1 , 1).
pref(3 , 30, 1 , 1).
pref(4 , 30, 1 , 1).
pref(8 , 30, 1 , 1).
pref(-1, 7 , 10, 1).
pref(29, 7 , 0 , 1).
pref(1 , 7 , 1 , 1).
pref(9 , 7 , 1 , 1).
pref(-1, 12, 10, 1).
pref(31, 12, 0 , 1).
pref(1 , 12, 1 , 1).
pref(4 , 12, 1 , 1).
pref(16, 12, 1 , 1).
pref(8 , 12, 1 , 1).
pref(13, 12, 1 , 1).
pref(5 , 12, 1 , 1).
pref(9 , 12, 1 , 1).
pref(7 , 12, 1 , 1).
pref(2 , 12, 1 , 1).
pref(3 , 12, 1 , 1).
pref(12, 12, 1 , 1).
pref(14, 12, 1 , 1).
pref(-1, 6 , 10, 1).
pref(29, 6 , 0 , 1).
pref(4 , 6 , 1 , 1).
pref(9 , 6 , 1 , 1).
pref(1 , 6 , 1 , 1).
pref(3 , 6 , 1 , 1).
pref(14, 6 , 1 , 1).
pref(8 , 6 , 1 , 1).
pref(5 , 6 , 1 , 1).
pref(2 , 6 , 1 , 1).
pref(12, 6 , 1 , 1).
pref(16, 6 , 1 , 1).
pref(7 , 6 , 1 , 1).
pref(13, 6 , 1 , 1).
pref(-1, 57, 10, 1).
pref(49, 57, 0 , 1).
pref(4 , 57, 1 , 1).
pref(16, 57, 1 , 1).
pref(13, 57, 1 , 1).
pref(3 , 57, 1 , 1).
pref(2 , 57, 1 , 1).
pref(1 , 57, 1 , 1).
pref(12, 57, 1 , 1).
pref(5 , 57, 1 , 1).
pref(8 , 57, 1 , 1).
pref(7 , 57, 1 , 1).
pref(14, 57, 1 , 1).
pref(9 , 57, 1 , 1).
pref(-1, 4 , 10, 1).
pref(46, 4 , 0 , 1).
pref(8 , 4 , 1 , 1).
pref(3 , 4 , 1 , 1).
pref(9 , 4 , 1 , 1).
pref(7 , 4 , 1 , 1).
pref(5 , 4 , 1 , 1).
pref(12, 4 , 1 , 1).
pref(14, 4 , 1 , 1).
pref(1 , 4 , 1 , 1).
pref(13, 4 , 1 , 1).
pref(16, 4 , 1 , 1).
pref(2 , 4 , 1 , 1).
pref(4 , 4 , 1 , 1).
pref(-1, 43, 10, 1).
pref(42, 43, 0 , 1).
pref(1 , 43, 1 , 1).
pref(3 , 43, 1 , 1).
pref(14, 43, 1 , 1).
pref(12, 43, 1 , 1).
pref(8 , 43, 1 , 1).
pref(13, 43, 1 , 1).
pref(16, 43, 1 , 1).
pref(2 , 43, 1 , 1).
pref(5 , 43, 1 , 1).
pref(9 , 43, 1 , 1).
pref(4 , 43, 1 , 1).
pref(7 , 43, 1 , 1).
pref(-1, 13, 10, 1).
pref(31, 13, 0 , 1).
pref(3 , 13, 1 , 1).
pref(12, 13, 1 , 1).
pref(7 , 13, 1 , 1).
pref(16, 13, 1 , 1).
pref(14, 13, 1 , 1).
pref(5 , 13, 1 , 1).
pref(2 , 13, 1 , 1).
pref(1 , 13, 1 , 1).
pref(8 , 13, 1 , 1).
pref(9 , 13, 1 , 1).
pref(4 , 13, 1 , 1).
pref(13, 13, 1 , 1).
pref(-1, 28, 10, 1).
pref(37, 28, 0 , 1).
pref(2 , 28, 1 , 1).
pref(9 , 28, 1 , 1).
pref(16, 28, 1 , 1).
pref(13, 28, 1 , 1).
pref(3 , 28, 1 , 1).
pref(7 , 28, 1 , 1).
pref(14, 28, 1 , 1).
pref(4 , 28, 1 , 1).
pref(12, 28, 1 , 1).
pref(5 , 28, 1 , 1).
pref(8 , 28, 1 , 1).
pref(1 , 28, 1 , 1).
pref(-1, 34, 10, 1).
pref(37, 34, 0 , 1).
pref(7 , 34, 1 , 1).
pref(14, 34, 1 , 1).
pref(5 , 34, 1 , 1).
pref(12, 34, 1 , 1).
pref(1 , 34, 1 , 1).
pref(4 , 34, 1 , 1).
pref(3 , 34, 1 , 1).
pref(13, 34, 1 , 1).
pref(8 , 34, 1 , 1).
pref(9 , 34, 1 , 1).
pref(16, 34, 1 , 1).
pref(2 , 34, 1 , 1).
pref(-1, 32, 10, 1).
pref(37, 32, 0 , 1).
pref(8 , 32, 1 , 1).
pref(7 , 32, 1 , 1).
pref(9 , 32, 1 , 1).
pref(4 , 32, 1 , 1).
pref(16, 32, 1 , 1).
pref(1 , 32, 1 , 1).
pref(14, 32, 1 , 1).
pref(2 , 32, 1 , 1).
pref(12, 32, 1 , 1).
pref(5 , 32, 1 , 1).
pref(3 , 32, 1 , 1).
pref(13, 32, 1 , 1).
pref(-1, 37, 10, 1).
pref(39, 37, 0 , 1).
pref(1 , 37, 1 , 1).
pref(12, 37, 1 , 1).
pref(4 , 37, 1 , 1).
pref(8 , 37, 1 , 1).
pref(13, 37, 1 , 1).
pref(16, 37, 1 , 1).
pref(5 , 37, 1 , 1).
pref(14, 37, 1 , 1).
pref(7 , 37, 1 , 1).
pref(3 , 37, 1 , 1).
pref(9 , 37, 1 , 1).
pref(2 , 37, 1 , 1).
pref(-1, 47, 10, 1).
pref(34, 47, 0 , 1).
pref(9 , 47, 1 , 1).
pref(7 , 47, 1 , 1).
pref(8 , 47, 1 , 1).
pref(13, 47, 1 , 1).
pref(12, 47, 1 , 1).
pref(16, 47, 1 , 1).
pref(2 , 47, 1 , 1).
pref(3 , 47, 1 , 1).
pref(5 , 47, 1 , 1).
pref(14, 47, 1 , 1).
pref(1 , 47, 1 , 1).
pref(4 , 47, 1 , 1).
pref(-1, 49, 10, 1).
pref(44, 49, 0 , 1).
pref(13, 49, 1 , 1).
pref(1 , 49, 1 , 1).
pref(4 , 49, 1 , 1).
pref(2 , 49, 1 , 1).
pref(7 , 49, 1 , 1).
pref(3 , 49, 1 , 1).
pref(16, 49, 1 , 1).
pref(14, 49, 1 , 1).
pref(5 , 49, 1 , 1).
pref(12, 49, 1 , 1).
pref(9 , 49, 1 , 1).
pref(8 , 49, 1 , 1).
pref(-1, 52, 10, 1).
pref(45, 52, 0 , 1).
pref(14, 52, 1 , 1).
pref(13, 52, 1 , 1).
pref(12, 52, 1 , 1).
pref(8 , 52, 1 , 1).
pref(2 , 52, 1 , 1).
pref(1 , 52, 1 , 1).
pref(16, 52, 1 , 1).
pref(4 , 52, 1 , 1).
pref(7 , 52, 1 , 1).
pref(3 , 52, 1 , 1).
pref(5 , 52, 1 , 1).
pref(9 , 52, 1 , 1).
pref(-1, 36, 10, 1).
pref(39, 36, 0 , 1).
pref(9 , 36, 1 , 1).
pref(5 , 36, 1 , 1).
pref(1 , 36, 1 , 1).
pref(12, 36, 1 , 1).
pref(7 , 36, 1 , 1).
pref(8 , 36, 1 , 1).
pref(2 , 36, 1 , 1).
pref(16, 36, 1 , 1).
pref(3 , 36, 1 , 1).
pref(4 , 36, 1 , 1).
pref(14, 36, 1 , 1).
pref(13, 36, 1 , 1).
pref(-1, 17, 10, 1).
pref(32, 17, 0 , 1).
pref(16, 17, 1 , 1).
pref(3 , 17, 1 , 1).
pref(9 , 17, 1 , 1).
pref(12, 17, 1 , 1).
pref(8 , 17, 1 , 1).
pref(13, 17, 1 , 1).
pref(2 , 17, 1 , 1).
pref(5 , 17, 1 , 1).
pref(7 , 17, 1 , 1).
pref(1 , 17, 1 , 1).
pref(4 , 17, 1 , 1).
pref(14, 17, 1 , 1).
pref(-1, 56, 10, 1).
pref(46, 56, 0 , 1).
pref(9 , 56, 1 , 1).
pref(4 , 56, 1 , 1).
pref(3 , 56, 1 , 1).
pref(5 , 56, 1 , 1).
pref(2 , 56, 1 , 1).
pref(14, 56, 1 , 1).
pref(13, 56, 1 , 1).
pref(16, 56, 1 , 1).
pref(12, 56, 1 , 1).
pref(7 , 56, 1 , 1).
pref(8 , 56, 1 , 1).
pref(1 , 56, 1 , 1).
pref(-1, 16, 10, 1).
pref(32, 16, 0 , 1).
pref(1 , 16, 1 , 1).
pref(14, 16, 1 , 1).
pref(2 , 16, 1 , 1).
pref(5 , 16, 1 , 1).
pref(16, 16, 1 , 1).
pref(4 , 16, 1 , 1).
pref(7 , 16, 1 , 1).
pref(8 , 16, 1 , 1).
pref(3 , 16, 1 , 1).
pref(12, 16, 1 , 1).
pref(9 , 16, 1 , 1).
pref(13, 16, 1 , 1).
pref(-1, 38, 10, 1).
pref(40, 38, 0 , 1).
pref(9 , 38, 1 , 1).
pref(-1, 29, 10, 1).
pref(38, 29, 0 , 1).
pref(12, 29, 1 , 1).
pref(7 , 29, 1 , 1).
pref(9 , 29, 1 , 1).
pref(14, 29, 1 , 1).
pref(2 , 29, 1 , 1).
pref(13, 29, 1 , 1).
pref(1 , 29, 1 , 1).
pref(5 , 29, 1 , 1).
pref(4 , 29, 1 , 1).
pref(16, 29, 1 , 1).
pref(8 , 29, 1 , 1).
pref(3 , 29, 1 , 1).
pref(-1, 45, 10, 1).
pref(48, 45, 0 , 1).
pref(7 , 45, 1 , 1).
pref(3 , 45, 1 , 1).
pref(13, 45, 1 , 1).
pref(1 , 45, 1 , 1).
pref(16, 45, 1 , 1).
pref(5 , 45, 1 , 1).
pref(14, 45, 1 , 1).
pref(12, 45, 1 , 1).
pref(4 , 45, 1 , 1).
pref(8 , 45, 1 , 1).
pref(9 , 45, 1 , 1).
pref(2 , 45, 1 , 1).
pref(-1, 55, 10, 1).
pref(46, 55, 0 , 1).
pref(16, 55, 1 , 1).
pref(4 , 55, 1 , 1).
pref(5 , 55, 1 , 1).
pref(8 , 55, 1 , 1).
pref(2 , 55, 1 , 1).
pref(7 , 55, 1 , 1).
pref(3 , 55, 1 , 1).
pref(9 , 55, 1 , 1).
pref(1 , 55, 1 , 1).
pref(14, 55, 1 , 1).
pref(12, 55, 1 , 1).
pref(-1, 48, 10, 1).
pref(48, 48, 0 , 1).
pref(7 , 48, 1 , 1).
pref(13, 48, 1 , 1).
pref(16, 48, 1 , 1).
pref(4 , 48, 1 , 1).
pref(8 , 48, 1 , 1).
pref(12, 48, 1 , 1).
pref(1 , 48, 1 , 1).
pref(5 , 48, 1 , 1).
pref(9 , 48, 1 , 1).
pref(2 , 48, 1 , 1).
pref(14, 48, 1 , 1).
pref(3 , 48, 1 , 1).
pref(-1, 9 , 10, 1).
pref(30, 9 , 0 , 1).
pref(2 , 9 , 1 , 1).
pref(3 , 9 , 1 , 1).
pref(9 , 9 , 1 , 1).
pref(13, 9 , 1 , 1).
pref(14, 9 , 1 , 1).
pref(7 , 9 , 1 , 1).
pref(8 , 9 , 1 , 1).
pref(12, 9 , 1 , 1).
pref(1 , 9 , 1 , 1).
pref(16, 9 , 1 , 1).
pref(4 , 9 , 1 , 1).
pref(5 , 9 , 1 , 1).
pref(-1, 54, 10, 1).
pref(45, 54, 0 , 1).
pref(13, 54, 1 , 1).
pref(1 , 54, 1 , 1).
pref(7 , 54, 1 , 1).
pref(8 , 54, 1 , 1).
pref(16, 54, 1 , 1).
pref(12, 54, 1 , 1).
pref(14, 54, 1 , 1).
pref(3 , 54, 1 , 1).
pref(9 , 54, 1 , 1).
pref(2 , 54, 1 , 1).
pref(4 , 54, 1 , 1).
pref(5 , 54, 1 , 1).
pref(-1, 21, 10, 1).
pref(30, 21, 0 , 1).
pref(7 , 21, 1 , 1).
pref(9 , 21, 1 , 1).
pref(3 , 21, 1 , 1).
pref(12, 21, 1 , 1).
pref(4 , 21, 1 , 1).
pref(2 , 21, 1 , 1).
pref(5 , 21, 1 , 1).
pref(16, 21, 1 , 1).
pref(8 , 21, 1 , 1).
pref(14, 21, 1 , 1).
pref(1 , 21, 1 , 1).
pref(-1, 5 , 10, 1).
pref(34, 5 , 0 , 1).
pref(14, 5 , 1 , 1).
pref(4 , 5 , 1 , 1).
pref(7 , 5 , 1 , 1).
pref(2 , 5 , 1 , 1).
pref(12, 5 , 1 , 1).
pref(1 , 5 , 1 , 1).
pref(8 , 5 , 1 , 1).
pref(16, 5 , 1 , 1).
pref(3 , 5 , 1 , 1).
pref(5 , 5 , 1 , 1).
pref(9 , 5 , 1 , 1).
pref(-1, 8 , 10, 1).
pref(30, 8 , 0 , 1).
pref(12, 8 , 1 , 1).
pref(3 , 8 , 1 , 1).
pref(4 , 8 , 1 , 1).
pref(1 , 8 , 1 , 1).
pref(9 , 8 , 1 , 1).
pref(5 , 8 , 1 , 1).
pref(16, 8 , 1 , 1).
pref(7 , 8 , 1 , 1).
pref(8 , 8 , 1 , 1).
pref(14, 8 , 1 , 1).
pref(2 , 8 , 1 , 1).
pref(-1, 39, 10, 1).
pref(40, 39, 0 , 1).
pref(13, 39, 1 , 1).
pref(8 , 39, 1 , 1).
pref(3 , 39, 1 , 1).
pref(12, 39, 1 , 1).
pref(16, 39, 1 , 1).
pref(7 , 39, 1 , 1).
pref(2 , 39, 1 , 1).
pref(4 , 39, 1 , 1).
pref(5 , 39, 1 , 1).
pref(1 , 39, 1 , 1).
pref(9 , 39, 1 , 1).
pref(14, 39, 1 , 1).
pref(-1, 25, 10, 1).
pref(45, 25, 0 , 1).
pref(1 , 25, 1 , 1).
pref(12, 25, 1 , 1).
pref(4 , 25, 1 , 1).
pref(3 , 25, 1 , 1).
pref(7 , 25, 1 , 1).
pref(16, 25, 1 , 1).
pref(9 , 25, 1 , 1).
pref(14, 25, 1 , 1).
pref(8 , 25, 1 , 1).
pref(5 , 25, 1 , 1).
pref(2 , 25, 1 , 1).
pref(-1, 27, 10, 1).
pref(35, 27, 0 , 1).
pref(14, 27, 1 , 1).
pref(13, 27, 1 , 1).
pref(8 , 27, 1 , 1).
pref(7 , 27, 1 , 1).
pref(3 , 27, 1 , 1).
pref(9 , 27, 1 , 1).
pref(12, 27, 1 , 1).
pref(5 , 27, 1 , 1).
pref(4 , 27, 1 , 1).
pref(1 , 27, 1 , 1).
pref(2 , 27, 1 , 1).
pref(16, 27, 1 , 1).
pref(-1, 40, 10, 1).
pref(45, 40, 0 , 1).
pref(12, 40, 1 , 1).
pref(8 , 40, 1 , 1).
pref(3 , 40, 1 , 1).
pref(16, 40, 1 , 1).
pref(2 , 40, 1 , 1).
pref(5 , 40, 1 , 1).
pref(1 , 40, 1 , 1).
pref(14, 40, 1 , 1).
pref(4 , 40, 1 , 1).
pref(7 , 40, 1 , 1).
pref(9 , 40, 1 , 1).
pref(-1, 3 , 10, 1).
pref(29, 3 , 0 , 1).
pref(1 , 3 , 1 , 1).
pref(-1, 31, 10, 1).
pref(38, 31, 0 , 1).
pref(8 , 31, 1 , 1).
pref(2 , 31, 1 , 1).
pref(12, 31, 1 , 1).
pref(14, 31, 1 , 1).
pref(9 , 31, 1 , 1).
pref(1 , 31, 1 , 1).
pref(16, 31, 1 , 1).
pref(5 , 31, 1 , 1).
pref(3 , 31, 1 , 1).
pref(7 , 31, 1 , 1).
pref(4 , 31, 1 , 1).
pref(-1, 59, 10, 1).
pref(49, 59, 0 , 1).
pref(4 , 59, 1 , 1).
pref(7 , 59, 1 , 1).
pref(5 , 59, 1 , 1).
pref(12, 59, 1 , 1).
pref(3 , 59, 1 , 1).
pref(9 , 59, 1 , 1).
pref(16, 59, 1 , 1).
pref(1 , 59, 1 , 1).
pref(2 , 59, 1 , 1).
pref(8 , 59, 1 , 1).
pref(14, 59, 1 , 1).
pref(-1, 58, 10, 1).
pref(49, 58, 0 , 1).
pref(3 , 58, 1 , 1).
pref(16, 58, 1 , 1).
pref(8 , 58, 1 , 1).
pref(9 , 58, 1 , 1).
pref(5 , 58, 1 , 1).
pref(2 , 58, 1 , 1).
pref(1 , 58, 1 , 1).
pref(14, 58, 1 , 1).
pref(12, 58, 1 , 1).
pref(4 , 58, 1 , 1).
pref(13, 58, 1 , 1).
pref(7 , 58, 1 , 1).
pref(-1, 42, 10, 1).
pref(40, 42, 0 , 1).
pref(1 , 42, 1 , 1).
pref(9 , 42, 1 , 1).
pref(-1, 10, 10, 1).
pref(30, 10, 0 , 1).
pref(3 , 10, 1 , 1).
pref(8 , 10, 1 , 1).
pref(14, 10, 1 , 1).
pref(7 , 10, 1 , 1).
pref(9 , 10, 1 , 1).
pref(16, 10, 1 , 1).
pref(4 , 10, 1 , 1).
pref(13, 10, 1 , 1).
pref(2 , 10, 1 , 1).
pref(1 , 10, 1 , 1).
pref(5 , 10, 1 , 1).
pref(12, 10, 1 , 1).
pref(-1, 33, 10, 1).
pref(38, 33, 0 , 1).
pref(3 , 33, 1 , 1).
pref(7 , 33, 1 , 1).
pref(16, 33, 1 , 1).
pref(4 , 33, 1 , 1).
pref(9 , 33, 1 , 1).
pref(1 , 33, 1 , 1).
pref(5 , 33, 1 , 1).
pref(2 , 33, 1 , 1).
pref(12, 33, 1 , 1).
pref(14, 33, 1 , 1).
pref(8 , 33, 1 , 1).
pref(-1, 46, 10, 1).
pref(44, 46, 0 , 1).
pref(9 , 46, 1 , 1).
pref(3 , 46, 1 , 1).
pref(5 , 46, 1 , 1).
pref(4 , 46, 1 , 1).
pref(8 , 46, 1 , 1).
pref(16, 46, 1 , 1).
pref(2 , 46, 1 , 1).
pref(12, 46, 1 , 1).
pref(1 , 46, 1 , 1).
pref(14, 46, 1 , 1).
pref(7 , 46, 1 , 1).
pref(-1, 1 , 10, 1).
pref(29, 1 , 0 , 1).
pref(14, 1 , 1 , 1).
pref(1 , 1 , 1 , 1).
pref(13, 1 , 1 , 1).
pref(2 , 1 , 1 , 1).
pref(12, 1 , 1 , 1).
pref(4 , 1 , 1 , 1).
pref(8 , 1 , 1 , 1).
pref(16, 1 , 1 , 1).
pref(9 , 1 , 1 , 1).
pref(5 , 1 , 1 , 1).
pref(7 , 1 , 1 , 1).
pref(3 , 1 , 1 , 1).
pref(-1, 14, 10, 1).
pref(31, 14, 0 , 1).
pref(5 , 14, 1 , 1).
pref(14, 14, 1 , 1).
pref(9 , 14, 1 , 1).
pref(16, 14, 1 , 1).
pref(12, 14, 1 , 1).
pref(3 , 14, 1 , 1).
pref(4 , 14, 1 , 1).
pref(7 , 14, 1 , 1).
pref(8 , 14, 1 , 1).
pref(2 , 14, 1 , 1).
pref(1 , 14, 1 , 1).
pref(-1, 24, 10, 1).
pref(35, 24, 0 , 1).
pref(7 , 24, 1 , 1).
pref(5 , 24, 1 , 1).
pref(16, 24, 1 , 1).
pref(3 , 24, 1 , 1).
pref(2 , 24, 1 , 1).
pref(9 , 24, 1 , 1).
pref(12, 24, 1 , 1).
pref(8 , 24, 1 , 1).
pref(4 , 24, 1 , 1).
pref(1 , 24, 1 , 1).
pref(14, 24, 1 , 1).
pref(-1, 15, 10, 1).
pref(30, 15, 0 , 1).
pref(2 , 15, 1 , 1).
pref(12, 15, 1 , 1).
pref(5 , 15, 1 , 1).
pref(8 , 15, 1 , 1).
pref(14, 15, 1 , 1).
pref(1 , 15, 1 , 1).
pref(7 , 15, 1 , 1).
pref(4 , 15, 1 , 1).
pref(3 , 15, 1 , 1).
pref(16, 15, 1 , 1).
pref(9 , 15, 1 , 1).
pref(-1, 35, 10, 1).
pref(39, 35, 0 , 1).
pref(3 , 35, 1 , 1).
pref(14, 35, 1 , 1).
pref(4 , 35, 1 , 1).
pref(8 , 35, 1 , 1).
pref(1 , 35, 1 , 1).
pref(2 , 35, 1 , 1).
pref(9 , 35, 1 , 1).
pref(5 , 35, 1 , 1).
pref(12, 35, 1 , 1).
pref(16, 35, 1 , 1).
pref(7 , 35, 1 , 1).
pref(-1, 51, 10, 1).
pref(44, 51, 0 , 1).
pref(7 , 51, 1 , 1).
pref(14, 51, 1 , 1).
pref(5 , 51, 1 , 1).
pref(3 , 51, 1 , 1).
pref(1 , 51, 1 , 1).
pref(9 , 51, 1 , 1).
pref(12, 51, 1 , 1).
pref(8 , 51, 1 , 1).
pref(4 , 51, 1 , 1).
pref(16, 51, 1 , 1).
pref(2 , 51, 1 , 1).
pref(13, 51, 1 , 1).
pref(-1, 18, 10, 1).
pref(32, 18, 0 , 1).
pref(12, 18, 1 , 1).
pref(3 , 18, 1 , 1).
pref(1 , 18, 1 , 1).
pref(7 , 18, 1 , 1).
pref(4 , 18, 1 , 1).
pref(9 , 18, 1 , 1).
pref(2 , 18, 1 , 1).
pref(5 , 18, 1 , 1).
pref(8 , 18, 1 , 1).
pref(16, 18, 1 , 1).
pref(14, 18, 1 , 1).
pref(-1, 53, 10, 1).
pref(45, 53, 0 , 1).
pref(5 , 53, 1 , 1).
pref(7 , 53, 1 , 1).
pref(3 , 53, 1 , 1).
pref(4 , 53, 1 , 1).
pref(16, 53, 1 , 1).
pref(14, 53, 1 , 1).
pref(9 , 53, 1 , 1).
pref(2 , 53, 1 , 1).
pref(12, 53, 1 , 1).
pref(1 , 53, 1 , 1).
pref(8 , 53, 1 , 1).
pref(13, 53, 1 , 1).
pref(-1, 2 , 10, 1).
pref(29, 2 , 0 , 1).
pref(4 , 2 , 1 , 1).
pref(1 , 2 , 1 , 1).
pref(2 , 2 , 1 , 1).
pref(13, 2 , 1 , 1).
pref(14, 2 , 1 , 1).
pref(7 , 2 , 1 , 1).
pref(5 , 2 , 1 , 1).
pref(16, 2 , 1 , 1).
pref(8 , 2 , 1 , 1).
pref(9 , 2 , 1 , 1).
pref(12, 2 , 1 , 1).
pref(3 , 2 , 1 , 1).
pref(-1, 26, 10, 1).
pref(35, 26, 0 , 1).
pref(4 , 26, 1 , 1).
pref(2 , 26, 1 , 1).
pref(8 , 26, 1 , 1).
pref(3 , 26, 1 , 1).
pref(7 , 26, 1 , 1).
pref(12, 26, 1 , 1).
pref(1 , 26, 1 , 1).
pref(16, 26, 1 , 1).
pref(9 , 26, 1 , 1).
pref(14, 26, 1 , 1).
pref(5 , 26, 1 , 1).
pref(-1, 44, 10, 1).
pref(43, 44, 0 , 1).
pref(2 , 44, 1 , 1).
pref(8 , 44, 1 , 1).
pref(16, 44, 1 , 1).
pref(1 , 44, 1 , 1).
pref(12, 44, 1 , 1).
pref(7 , 44, 1 , 1).
pref(5 , 44, 1 , 1).
pref(14, 44, 1 , 1).
pref(9 , 44, 1 , 1).
pref(3 , 44, 1 , 1).
pref(4 , 44, 1 , 1).
pref(-1, 23, 10, 1).
pref(35, 23, 0 , 1).
pref(13, 23, 1 , 1).
pref(12, 23, 1 , 1).
pref(1 , 23, 1 , 1).
pref(8 , 23, 1 , 1).
pref(5 , 23, 1 , 1).
pref(2 , 23, 1 , 1).
pref(9 , 23, 1 , 1).
pref(4 , 23, 1 , 1).
pref(14, 23, 1 , 1).
pref(3 , 23, 1 , 1).
pref(16, 23, 1 , 1).
pref(7 , 23, 1 , 1).
pref(-1, 22, 10, 1).
pref(43, 22, 0 , 1).
pref(16, 22, 1 , 1).
pref(7 , 22, 1 , 1).
pref(5 , 22, 1 , 1).
pref(8 , 22, 1 , 1).
pref(12, 22, 1 , 1).
pref(3 , 22, 1 , 1).
pref(4 , 22, 1 , 1).
pref(9 , 22, 1 , 1).
pref(14, 22, 1 , 1).
pref(1 , 22, 1 , 1).
pref(13, 22, 1 , 1).
pref(2 , 22, 1 , 1).
pref(-1, 11, 10, 1).
pref(30, 11, 0 , 1).
pref(12, 11, 1 , 1).
pref(13, 11, 1 , 1).
pref(16, 11, 1 , 1).
pref(2 , 11, 1 , 1).
pref(3 , 11, 1 , 1).
pref(7 , 11, 1 , 1).
pref(5 , 11, 1 , 1).
pref(14, 11, 1 , 1).
pref(9 , 11, 1 , 1).
pref(4 , 11, 1 , 1).
pref(8 , 11, 1 , 1).
pref(1 , 11, 1 , 1).
pref(-1, 19, 10, 1).
pref(34, 19, 0 , 1).
pref(8 , 19, 1 , 1).
pref(4 , 19, 1 , 1).
pref(14, 19, 1 , 1).
pref(1 , 19, 1 , 1).
pref(5 , 19, 1 , 1).
pref(2 , 19, 1 , 1).
pref(7 , 19, 1 , 1).
pref(12, 19, 1 , 1).
pref(13, 19, 1 , 1).
pref(9 , 19, 1 , 1).
pref(16, 19, 1 , 1).
pref(3 , 19, 1 , 1).
pref(-1, 41, 10, 1).
pref(40, 41, 0 , 1).
pref(12, 41, 1 , 1).
pref(9 , 41, 1 , 1).
pref(14, 41, 1 , 1).
pref(3 , 41, 1 , 1).
pref(13, 41, 1 , 1).
pref(4 , 41, 1 , 1).
pref(7 , 41, 1 , 1).
pref(2 , 41, 1 , 1).
pref(5 , 41, 1 , 1).
pref(1 , 41, 1 , 1).
pref(8 , 41, 1 , 1).
pref(16, 41, 1 , 1).
pref(-1, 50, 10, 1).
pref(-1, 20, 10, 1).
pref(43, 20, 0 , 1).
pref(7 , 20, 1 , 1).
pref(12, 20, 1 , 1).
pref(5 , 20, 1 , 1).
pref(14, 20, 1 , 1).
pref(8 , 20, 1 , 1).
pref(1 , 20, 1 , 1).
pref(2 , 20, 1 , 1).
pref(4 , 20, 1 , 1).
pref(9 , 20, 1 , 1).
pref(3 , 20, 1 , 1).
pref(16, 20, 1 , 1).
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
% -------- WEAK CONSTRAINTS --------
%minimize the sum of weights for patients with preference specified by history and not explicitly by patient
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
%minimize the number of assignments to the pretend operator
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
%minimize the sum of weights for patients with preferred operators
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]
% -------- DIRECTIVES --------
#show assignment/4.