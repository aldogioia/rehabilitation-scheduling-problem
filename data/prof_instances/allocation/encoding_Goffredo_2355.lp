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
operator(1 , 42 , 0, 4  , 0  , 0  , 2  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(2 , 42 , 0, 6  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 6  , 0  , 0  ).
operator(3 , 42 , 0, 4  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 3  , 0  , 0  , 0  ).
operator(4 , 30 , 0, 2  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(5 , 30 , 0, 2  , 0  , 0  , 2  , 0  , 0  , 1  , 0  , 1  , 0  , 0  , 0  ).
operator(6 , 18 , 1, 1  , 0  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 0  ).
operator(7 , 42 , 0, 4  , 0  , 0  , 0  , 0  , 0  , 1  , 0  , 4  , 0  , 0  , 0  ).
operator(8 , 42 , 0, 4  , 0  , 1  , 1  , 0  , 0  , 1  , 0  , 1  , 0  , 0  , 0  ).
operator(9 , 42 , 0, 4  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(10, 42 , 0, 4  , 0  , 1  , 1  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(11, 42 , 0, 3  , 0  , 1  , 1  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(12, 18 , 1, 1  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(13, 42 , 0, 4  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 2  ).
operator(14, 30 , 0, 4  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 4  ).
operator(15, 42 , 0, 6  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 6  ).
operator(16, 42 , 0, 7  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 7  ).
operator(17, 30 , 0, 5  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 5  ).
operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).
% patient(ID,TYP,PAY,AID,MIN)
% - ID: id - ID of the patient
% - TYP: type - Type of patient (neurologico, ortopedico, alcolista, covid+, covid-, MAC)
% - PAY: paying - If the patient is paying
% - AID: aidNeeds - In the patient needs aid (lifter)
% - MIN: minimumDuration - Minimum cumulative time in rehab in TU for all sessions on the same day
patient(41, 1, 2, 0, 5).
patient(35, 2, 2, 0, 5).
patient(6 , 4, 2, 0, 1).
patient(2 , 1, 2, 0, 6).
patient(59, 6, 2, 0, 6).
patient(33, 1, 2, 1, 6).
patient(60, 6, 2, 0, 6).
patient(31, 1, 2, 0, 6).
patient(17, 2, 2, 1, 5).
patient(65, 6, 2, 0, 6).
patient(43, 6, 2, 0, 6).
patient(63, 6, 2, 0, 6).
patient(50, 6, 2, 0, 6).
patient(15, 1, 2, 0, 7).
patient(58, 6, 2, 0, 6).
patient(36, 2, 2, 0, 6).
patient(51, 6, 2, 0, 6).
patient(21, 2, 2, 0, 6).
patient(18, 1, 2, 0, 7).
patient(20, 2, 2, 0, 6).
patient(24, 2, 2, 0, 6).
patient(52, 6, 2, 0, 6).
patient(64, 6, 2, 0, 6).
patient(53, 6, 2, 0, 6).
patient(12, 1, 2, 0, 6).
patient(19, 2, 2, 1, 6).
patient(46, 6, 2, 0, 6).
patient(56, 6, 2, 0, 6).
patient(57, 6, 2, 0, 6).
patient(22, 2, 2, 1, 6).
patient(48, 6, 2, 0, 6).
patient(39, 1, 2, 0, 6).
patient(23, 2, 2, 0, 6).
patient(49, 6, 2, 0, 6).
patient(13, 2, 2, 0, 7).
patient(47, 6, 2, 0, 6).
patient(16, 2, 2, 0, 7).
patient(34, 2, 2, 0, 7).
patient(10, 2, 2, 0, 5).
patient(37, 1, 2, 1, 5).
patient(1 , 1, 2, 0, 7).
patient(45, 6, 2, 0, 6).
patient(9 , 2, 2, 0, 5).
patient(55, 6, 2, 0, 6).
patient(26, 2, 2, 1, 7).
patient(29, 2, 2, 0, 7).
patient(8 , 4, 2, 0, 1).
patient(5 , 4, 2, 0, 1).
patient(61, 6, 2, 0, 6).
patient(11, 2, 2, 0, 7).
patient(62, 6, 2, 0, 6).
patient(14, 2, 2, 0, 5).
patient(28, 1, 2, 0, 7).
patient(42, 6, 2, 0, 6).
patient(25, 1, 2, 1, 7).
patient(3 , 4, 2, 0, 1).
patient(44, 6, 2, 0, 6).
patient(27, 2, 2, 0, 5).
patient(30, 2, 2, 0, 7).
patient(4 , 4, 2, 0, 1).
patient(54, 6, 2, 0, 6).
patient(7 , 4, 2, 0, 1).
patient(40, 2, 2, 0, 7).
patient(32, 1, 2, 0, 7).
patient(38, 2, 2, 0, 7).
% session(ID,PAT,MIN,LOC)
% - ID: id - ID of the session
% - PAT: patientId - ID of the patient that does the session
% - MIN: minimumDuration - Minimum length of the session in TU
% - LOC: location - Location in which the session took place
session(41, 41, 3, 1).
session(35, 35, 3, 1).
session(6 , 6 , 1, 2).
session(2 , 2 , 3, 1).
session(59, 59, 6, 1).
session(33, 33, 3, 1).
session(60, 60, 6, 1).
session(31, 31, 3, 1).
session(17, 17, 3, 1).
session(65, 65, 6, 1).
session(43, 43, 6, 1).
session(63, 63, 6, 1).
session(50, 50, 6, 1).
session(15, 15, 3, 1).
session(58, 58, 6, 1).
session(36, 36, 3, 1).
session(51, 51, 6, 1).
session(21, 21, 3, 1).
session(18, 18, 3, 1).
session(20, 20, 3, 1).
session(24, 24, 3, 1).
session(52, 52, 6, 1).
session(64, 64, 6, 1).
session(53, 53, 6, 1).
session(12, 12, 3, 1).
session(19, 19, 3, 1).
session(46, 46, 6, 1).
session(56, 56, 6, 1).
session(57, 57, 6, 1).
session(22, 22, 3, 1).
session(48, 48, 6, 2).
session(39, 39, 3, 1).
session(23, 23, 3, 1).
session(49, 49, 6, 1).
session(13, 13, 3, 1).
session(47, 47, 6, 1).
session(16, 16, 3, 1).
session(34, 34, 3, 1).
session(10, 10, 3, 1).
session(37, 37, 3, 1).
session(1 , 1 , 3, 1).
session(45, 45, 6, 1).
session(9 , 9 , 3, 1).
session(55, 55, 6, 1).
session(26, 26, 3, 1).
session(29, 29, 3, 1).
session(8 , 8 , 1, 2).
session(5 , 5 , 1, 2).
session(61, 61, 6, 1).
session(11, 11, 3, 1).
session(62, 62, 6, 1).
session(14, 14, 3, 1).
session(28, 28, 3, 1).
session(42, 42, 6, 1).
session(25, 25, 3, 1).
session(3 , 3 , 1, 2).
session(44, 44, 6, 1).
session(27, 27, 3, 1).
session(30, 30, 3, 1).
session(4 , 4 , 1, 2).
session(54, 54, 6, 1).
session(7 , 7 , 1, 2).
session(40, 40, 3, 1).
session(32, 32, 3, 1).
session(38, 38, 3, 1).
% pref(OPE,PAT,WEI,HAS)
% - OPE: operatorId - ID of the Operator
% - PAT: patientId - ID of the Patient
% - WEI: weight - Priority of the preference
% - HAS: hasUserChosenOperator - Indicates if the preference has been given by the operator/patient or if it is inherited from the previous schedules 
pref(-1, 41, 10, 1).
pref(72, 41, 0 , 1).
pref(11, 41, 1 , 1).
pref(12, 41, 1 , 1).
pref(9 , 41, 1 , 1).
pref(1 , 41, 1 , 1).
pref(10, 41, 1 , 1).
pref(8 , 41, 1 , 1).
pref(5 , 41, 1 , 1).
pref(3 , 41, 1 , 1).
pref(-1, 35, 10, 1).
pref(65, 35, 0 , 1).
pref(11, 35, 1 , 1).
pref(4 , 35, 1 , 1).
pref(10, 35, 1 , 1).
pref(5 , 35, 1 , 1).
pref(9 , 35, 1 , 1).
pref(8 , 35, 1 , 1).
pref(3 , 35, 1 , 1).
pref(7 , 35, 1 , 1).
pref(12, 35, 1 , 1).
pref(-1, 6 , 10, 1).
pref(-1, 2 , 10, 1).
pref(59, 2 , 0 , 1).
pref(12, 2 , 1 , 1).
pref(8 , 2 , 1 , 1).
pref(5 , 2 , 1 , 1).
pref(1 , 2 , 1 , 1).
pref(10, 2 , 1 , 1).
pref(3 , 2 , 1 , 1).
pref(11, 2 , 1 , 1).
pref(9 , 2 , 1 , 1).
pref(-1, 59, 10, 1).
pref(70, 59, 0 , 1).
pref(17, 59, 1 , 1).
pref(16, 59, 1 , 1).
pref(15, 59, 1 , 1).
pref(13, 59, 1 , 1).
pref(14, 59, 1 , 1).
pref(-1, 33, 10, 1).
pref(65, 33, 0 , 1).
pref(11, 33, 1 , 1).
pref(10, 33, 1 , 1).
pref(8 , 33, 1 , 1).
pref(-1, 60, 10, 1).
pref(70, 60, 0 , 1).
pref(13, 60, 1 , 1).
pref(14, 60, 1 , 1).
pref(17, 60, 1 , 1).
pref(15, 60, 1 , 1).
pref(16, 60, 1 , 1).
pref(-1, 31, 10, 1).
pref(63, 31, 0 , 1).
pref(1 , 31, 1 , 1).
pref(10, 31, 1 , 1).
pref(11, 31, 1 , 1).
pref(8 , 31, 1 , 1).
pref(3 , 31, 1 , 1).
pref(12, 31, 1 , 1).
pref(9 , 31, 1 , 1).
pref(5 , 31, 1 , 1).
pref(-1, 17, 10, 1).
pref(58, 17, 0 , 1).
pref(7 , 17, 1 , 1).
pref(6 , 17, 1 , 1).
pref(5 , 17, 1 , 1).
pref(8 , 17, 1 , 1).
pref(-1, 65, 10, 1).
pref(54, 65, 0 , 1).
pref(13, 65, 1 , 1).
pref(17, 65, 1 , 1).
pref(16, 65, 1 , 1).
pref(15, 65, 1 , 1).
pref(14, 65, 1 , 1).
pref(-1, 43, 10, 1).
pref(60, 43, 0 , 1).
pref(15, 43, 1 , 1).
pref(17, 43, 1 , 1).
pref(16, 43, 1 , 1).
pref(14, 43, 1 , 1).
pref(13, 43, 1 , 1).
pref(-1, 63, 10, 1).
pref(54, 63, 0 , 1).
pref(15, 63, 1 , 1).
pref(14, 63, 1 , 1).
pref(16, 63, 1 , 1).
pref(17, 63, 1 , 1).
pref(13, 63, 1 , 1).
pref(-1, 50, 10, 1).
pref(64, 50, 0 , 1).
pref(17, 50, 1 , 1).
pref(15, 50, 1 , 1).
pref(16, 50, 1 , 1).
pref(14, 50, 1 , 1).
pref(13, 50, 1 , 1).
pref(-1, 15, 10, 1).
pref(58, 15, 0 , 1).
pref(11, 15, 1 , 1).
pref(3 , 15, 1 , 1).
pref(8 , 15, 1 , 1).
pref(1 , 15, 1 , 1).
pref(12, 15, 1 , 1).
pref(5 , 15, 1 , 1).
pref(9 , 15, 1 , 1).
pref(10, 15, 1 , 1).
pref(-1, 58, 10, 1).
pref(70, 58, 0 , 1).
pref(16, 58, 1 , 1).
pref(14, 58, 1 , 1).
pref(13, 58, 1 , 1).
pref(17, 58, 1 , 1).
pref(15, 58, 1 , 1).
pref(-1, 36, 10, 1).
pref(69, 36, 0 , 1).
pref(5 , 36, 1 , 1).
pref(4 , 36, 1 , 1).
pref(7 , 36, 1 , 1).
pref(9 , 36, 1 , 1).
pref(10, 36, 1 , 1).
pref(12, 36, 1 , 1).
pref(8 , 36, 1 , 1).
pref(3 , 36, 1 , 1).
pref(11, 36, 1 , 1).
pref(-1, 51, 10, 1).
pref(64, 51, 0 , 1).
pref(17, 51, 1 , 1).
pref(16, 51, 1 , 1).
pref(15, 51, 1 , 1).
pref(14, 51, 1 , 1).
pref(13, 51, 1 , 1).
pref(-1, 21, 10, 1).
pref(61, 21, 0 , 1).
pref(8 , 21, 1 , 1).
pref(9 , 21, 1 , 1).
pref(10, 21, 1 , 1).
pref(12, 21, 1 , 1).
pref(7 , 21, 1 , 1).
pref(4 , 21, 1 , 1).
pref(3 , 21, 1 , 1).
pref(11, 21, 1 , 1).
pref(5 , 21, 1 , 1).
pref(-1, 18, 10, 1).
pref(58, 18, 0 , 1).
pref(11, 18, 1 , 1).
pref(8 , 18, 1 , 1).
pref(12, 18, 1 , 1).
pref(5 , 18, 1 , 1).
pref(3 , 18, 1 , 1).
pref(10, 18, 1 , 1).
pref(1 , 18, 1 , 1).
pref(9 , 18, 1 , 1).
pref(-1, 20, 10, 1).
pref(61, 20, 0 , 1).
pref(4 , 20, 1 , 1).
pref(10, 20, 1 , 1).
pref(12, 20, 1 , 1).
pref(7 , 20, 1 , 1).
pref(5 , 20, 1 , 1).
pref(8 , 20, 1 , 1).
pref(3 , 20, 1 , 1).
pref(9 , 20, 1 , 1).
pref(11, 20, 1 , 1).
pref(-1, 24, 10, 1).
pref(61, 24, 0 , 1).
pref(4 , 24, 1 , 1).
pref(8 , 24, 1 , 1).
pref(5 , 24, 1 , 1).
pref(12, 24, 1 , 1).
pref(7 , 24, 1 , 1).
pref(11, 24, 1 , 1).
pref(3 , 24, 1 , 1).
pref(9 , 24, 1 , 1).
pref(10, 24, 1 , 1).
pref(-1, 52, 10, 1).
pref(64, 52, 0 , 1).
pref(15, 52, 1 , 1).
pref(16, 52, 1 , 1).
pref(17, 52, 1 , 1).
pref(13, 52, 1 , 1).
pref(14, 52, 1 , 1).
pref(-1, 64, 10, 1).
pref(54, 64, 0 , 1).
pref(13, 64, 1 , 1).
pref(14, 64, 1 , 1).
pref(15, 64, 1 , 1).
pref(16, 64, 1 , 1).
pref(17, 64, 1 , 1).
pref(-1, 53, 10, 1).
pref(64, 53, 0 , 1).
pref(14, 53, 1 , 1).
pref(16, 53, 1 , 1).
pref(17, 53, 1 , 1).
pref(13, 53, 1 , 1).
pref(15, 53, 1 , 1).
pref(-1, 12, 10, 1).
pref(56, 12, 0 , 1).
pref(11, 12, 1 , 1).
pref(8 , 12, 1 , 1).
pref(9 , 12, 1 , 1).
pref(10, 12, 1 , 1).
pref(3 , 12, 1 , 1).
pref(5 , 12, 1 , 1).
pref(1 , 12, 1 , 1).
pref(12, 12, 1 , 1).
pref(-1, 19, 10, 1).
pref(55, 19, 0 , 1).
pref(7 , 19, 1 , 1).
pref(8 , 19, 1 , 1).
pref(6 , 19, 1 , 1).
pref(5 , 19, 1 , 1).
pref(-1, 46, 10, 1).
pref(53, 46, 0 , 1).
pref(17, 46, 1 , 1).
pref(14, 46, 1 , 1).
pref(15, 46, 1 , 1).
pref(13, 46, 1 , 1).
pref(16, 46, 1 , 1).
pref(-1, 56, 10, 1).
pref(70, 56, 0 , 1).
pref(13, 56, 1 , 1).
pref(14, 56, 1 , 1).
pref(15, 56, 1 , 1).
pref(17, 56, 1 , 1).
pref(16, 56, 1 , 1).
pref(-1, 57, 10, 1).
pref(70, 57, 0 , 1).
pref(15, 57, 1 , 1).
pref(17, 57, 1 , 1).
pref(14, 57, 1 , 1).
pref(16, 57, 1 , 1).
pref(13, 57, 1 , 1).
pref(-1, 22, 10, 1).
pref(61, 22, 0 , 1).
pref(6 , 22, 1 , 1).
pref(7 , 22, 1 , 1).
pref(8 , 22, 1 , 1).
pref(5 , 22, 1 , 1).
pref(-1, 48, 10, 1).
pref(64, 48, 0 , 1).
pref(17, 48, 1 , 1).
pref(14, 48, 1 , 1).
pref(16, 48, 1 , 1).
pref(13, 48, 1 , 1).
pref(15, 48, 1 , 1).
pref(-1, 39, 10, 1).
pref(69, 39, 0 , 1).
pref(11, 39, 1 , 1).
pref(1 , 39, 1 , 1).
pref(8 , 39, 1 , 1).
pref(12, 39, 1 , 1).
pref(10, 39, 1 , 1).
pref(3 , 39, 1 , 1).
pref(5 , 39, 1 , 1).
pref(9 , 39, 1 , 1).
pref(-1, 23, 10, 1).
pref(61, 23, 0 , 1).
pref(3 , 23, 1 , 1).
pref(7 , 23, 1 , 1).
pref(12, 23, 1 , 1).
pref(5 , 23, 1 , 1).
pref(10, 23, 1 , 1).
pref(11, 23, 1 , 1).
pref(8 , 23, 1 , 1).
pref(9 , 23, 1 , 1).
pref(4 , 23, 1 , 1).
pref(-1, 49, 10, 1).
pref(64, 49, 0 , 1).
pref(14, 49, 1 , 1).
pref(13, 49, 1 , 1).
pref(15, 49, 1 , 1).
pref(17, 49, 1 , 1).
pref(16, 49, 1 , 1).
pref(-1, 13, 10, 1).
pref(57, 13, 0 , 1).
pref(7 , 13, 1 , 1).
pref(5 , 13, 1 , 1).
pref(9 , 13, 1 , 1).
pref(10, 13, 1 , 1).
pref(12, 13, 1 , 1).
pref(11, 13, 1 , 1).
pref(3 , 13, 1 , 1).
pref(4 , 13, 1 , 1).
pref(8 , 13, 1 , 1).
pref(-1, 47, 10, 1).
pref(53, 47, 0 , 1).
pref(14, 47, 1 , 1).
pref(13, 47, 1 , 1).
pref(17, 47, 1 , 1).
pref(16, 47, 1 , 1).
pref(15, 47, 1 , 1).
pref(-1, 16, 10, 1).
pref(58, 16, 0 , 1).
pref(3 , 16, 1 , 1).
pref(11, 16, 1 , 1).
pref(9 , 16, 1 , 1).
pref(5 , 16, 1 , 1).
pref(4 , 16, 1 , 1).
pref(12, 16, 1 , 1).
pref(8 , 16, 1 , 1).
pref(10, 16, 1 , 1).
pref(7 , 16, 1 , 1).
pref(-1, 34, 10, 1).
pref(65, 34, 0 , 1).
pref(7 , 34, 1 , 1).
pref(3 , 34, 1 , 1).
pref(8 , 34, 1 , 1).
pref(11, 34, 1 , 1).
pref(9 , 34, 1 , 1).
pref(5 , 34, 1 , 1).
pref(4 , 34, 1 , 1).
pref(12, 34, 1 , 1).
pref(10, 34, 1 , 1).
pref(-1, 10, 10, 1).
pref(56, 10, 0 , 1).
pref(11, 10, 1 , 1).
pref(8 , 10, 1 , 1).
pref(9 , 10, 1 , 1).
pref(7 , 10, 1 , 1).
pref(4 , 10, 1 , 1).
pref(12, 10, 1 , 1).
pref(5 , 10, 1 , 1).
pref(10, 10, 1 , 1).
pref(3 , 10, 1 , 1).
pref(-1, 37, 10, 1).
pref(69, 37, 0 , 1).
pref(10, 37, 1 , 1).
pref(8 , 37, 1 , 1).
pref(11, 37, 1 , 1).
pref(-1, 1 , 10, 1).
pref(59, 1 , 0 , 1).
pref(8 , 1 , 1 , 1).
pref(5 , 1 , 1 , 1).
pref(11, 1 , 1 , 1).
pref(10, 1 , 1 , 1).
pref(3 , 1 , 1 , 1).
pref(9 , 1 , 1 , 1).
pref(1 , 1 , 1 , 1).
pref(12, 1 , 1 , 1).
pref(-1, 45, 10, 1).
pref(53, 45, 0 , 1).
pref(14, 45, 1 , 1).
pref(17, 45, 1 , 1).
pref(15, 45, 1 , 1).
pref(16, 45, 1 , 1).
pref(13, 45, 1 , 1).
pref(-1, 9 , 10, 1).
pref(56, 9 , 0 , 1).
pref(8 , 9 , 1 , 1).
pref(3 , 9 , 1 , 1).
pref(4 , 9 , 1 , 1).
pref(10, 9 , 1 , 1).
pref(5 , 9 , 1 , 1).
pref(11, 9 , 1 , 1).
pref(12, 9 , 1 , 1).
pref(7 , 9 , 1 , 1).
pref(9 , 9 , 1 , 1).
pref(-1, 55, 10, 1).
pref(70, 55, 0 , 1).
pref(17, 55, 1 , 1).
pref(14, 55, 1 , 1).
pref(16, 55, 1 , 1).
pref(15, 55, 1 , 1).
pref(13, 55, 1 , 1).
pref(-1, 26, 10, 1).
pref(62, 26, 0 , 1).
pref(7 , 26, 1 , 1).
pref(6 , 26, 1 , 1).
pref(5 , 26, 1 , 1).
pref(8 , 26, 1 , 1).
pref(-1, 29, 10, 1).
pref(63, 29, 0 , 1).
pref(7 , 29, 1 , 1).
pref(5 , 29, 1 , 1).
pref(11, 29, 1 , 1).
pref(10, 29, 1 , 1).
pref(4 , 29, 1 , 1).
pref(9 , 29, 1 , 1).
pref(3 , 29, 1 , 1).
pref(12, 29, 1 , 1).
pref(8 , 29, 1 , 1).
pref(-1, 8 , 10, 1).
pref(-1, 5 , 10, 1).
pref(-1, 61, 10, 1).
pref(54, 61, 0 , 1).
pref(13, 61, 1 , 1).
pref(14, 61, 1 , 1).
pref(17, 61, 1 , 1).
pref(15, 61, 1 , 1).
pref(16, 61, 1 , 1).
pref(-1, 11, 10, 1).
pref(56, 11, 0 , 1).
pref(9 , 11, 1 , 1).
pref(5 , 11, 1 , 1).
pref(10, 11, 1 , 1).
pref(7 , 11, 1 , 1).
pref(3 , 11, 1 , 1).
pref(12, 11, 1 , 1).
pref(4 , 11, 1 , 1).
pref(8 , 11, 1 , 1).
pref(11, 11, 1 , 1).
pref(-1, 62, 10, 1).
pref(54, 62, 0 , 1).
pref(17, 62, 1 , 1).
pref(16, 62, 1 , 1).
pref(15, 62, 1 , 1).
pref(14, 62, 1 , 1).
pref(13, 62, 1 , 1).
pref(-1, 14, 10, 1).
pref(57, 14, 0 , 1).
pref(12, 14, 1 , 1).
pref(5 , 14, 1 , 1).
pref(9 , 14, 1 , 1).
pref(7 , 14, 1 , 1).
pref(8 , 14, 1 , 1).
pref(10, 14, 1 , 1).
pref(4 , 14, 1 , 1).
pref(3 , 14, 1 , 1).
pref(11, 14, 1 , 1).
pref(-1, 28, 10, 1).
pref(62, 28, 0 , 1).
pref(11, 28, 1 , 1).
pref(8 , 28, 1 , 1).
pref(3 , 28, 1 , 1).
pref(12, 28, 1 , 1).
pref(9 , 28, 1 , 1).
pref(10, 28, 1 , 1).
pref(1 , 28, 1 , 1).
pref(5 , 28, 1 , 1).
pref(-1, 42, 10, 1).
pref(60, 42, 0 , 1).
pref(16, 42, 1 , 1).
pref(17, 42, 1 , 1).
pref(15, 42, 1 , 1).
pref(14, 42, 1 , 1).
pref(13, 42, 1 , 1).
pref(-1, 25, 10, 1).
pref(62, 25, 0 , 1).
pref(10, 25, 1 , 1).
pref(11, 25, 1 , 1).
pref(8 , 25, 1 , 1).
pref(-1, 3 , 10, 1).
pref(-1, 44, 10, 1).
pref(53, 44, 0 , 1).
pref(16, 44, 1 , 1).
pref(15, 44, 1 , 1).
pref(13, 44, 1 , 1).
pref(14, 44, 1 , 1).
pref(17, 44, 1 , 1).
pref(-1, 27, 10, 1).
pref(62, 27, 0 , 1).
pref(12, 27, 1 , 1).
pref(9 , 27, 1 , 1).
pref(8 , 27, 1 , 1).
pref(7 , 27, 1 , 1).
pref(11, 27, 1 , 1).
pref(3 , 27, 1 , 1).
pref(4 , 27, 1 , 1).
pref(5 , 27, 1 , 1).
pref(10, 27, 1 , 1).
pref(-1, 30, 10, 1).
pref(63, 30, 0 , 1).
pref(7 , 30, 1 , 1).
pref(5 , 30, 1 , 1).
pref(12, 30, 1 , 1).
pref(11, 30, 1 , 1).
pref(4 , 30, 1 , 1).
pref(8 , 30, 1 , 1).
pref(3 , 30, 1 , 1).
pref(10, 30, 1 , 1).
pref(9 , 30, 1 , 1).
pref(-1, 4 , 10, 1).
pref(-1, 54, 10, 1).
pref(70, 54, 0 , 1).
pref(14, 54, 1 , 1).
pref(13, 54, 1 , 1).
pref(15, 54, 1 , 1).
pref(17, 54, 1 , 1).
pref(16, 54, 1 , 1).
pref(-1, 7 , 10, 1).
pref(-1, 40, 10, 1).
pref(72, 40, 0 , 1).
pref(5 , 40, 1 , 1).
pref(8 , 40, 1 , 1).
pref(12, 40, 1 , 1).
pref(4 , 40, 1 , 1).
pref(7 , 40, 1 , 1).
pref(3 , 40, 1 , 1).
pref(11, 40, 1 , 1).
pref(10, 40, 1 , 1).
pref(9 , 40, 1 , 1).
pref(-1, 32, 10, 1).
pref(65, 32, 0 , 1).
pref(9 , 32, 1 , 1).
pref(12, 32, 1 , 1).
pref(3 , 32, 1 , 1).
pref(8 , 32, 1 , 1).
pref(10, 32, 1 , 1).
pref(11, 32, 1 , 1).
pref(1 , 32, 1 , 1).
pref(5 , 32, 1 , 1).
pref(-1, 38, 10, 1).
pref(69, 38, 0 , 1).
pref(7 , 38, 1 , 1).
pref(9 , 38, 1 , 1).
pref(11, 38, 1 , 1).
pref(5 , 38, 1 , 1).
pref(8 , 38, 1 , 1).
pref(4 , 38, 1 , 1).
pref(3 , 38, 1 , 1).
pref(12, 38, 1 , 1).
pref(10, 38, 1 , 1).
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
:- assignment(OP,50,_,_), assignment(OP,60,_,_), OP != -1.
:- assignment(OP,51,_,_), assignment(OP,43,_,_), OP != -1.
:- assignment(OP,52,_,_), assignment(OP,58,_,_), OP != -1.
:- assignment(OP,64,_,_), assignment(OP,60,_,_), OP != -1.
:- assignment(OP,64,_,_), assignment(OP,50,_,_), OP != -1.
:- assignment(OP,53,_,_), assignment(OP,63,_,_), OP != -1.
:- assignment(OP,56,_,_), assignment(OP,46,_,_), OP != -1.
:- assignment(OP,48,_,_), assignment(OP,59,_,_), OP != -1.
:- assignment(OP,49,_,_), assignment(OP,46,_,_), OP != -1.
:- assignment(OP,49,_,_), assignment(OP,56,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,60,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,50,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,64,_,_), OP != -1.
:- assignment(OP,45,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,55,_,_), assignment(OP,63,_,_), OP != -1.
:- assignment(OP,55,_,_), assignment(OP,53,_,_), OP != -1.
:- assignment(OP,61,_,_), assignment(OP,46,_,_), OP != -1.
:- assignment(OP,61,_,_), assignment(OP,56,_,_), OP != -1.
:- assignment(OP,61,_,_), assignment(OP,49,_,_), OP != -1.
:- assignment(OP,62,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,62,_,_), assignment(OP,45,_,_), OP != -1.
:- assignment(OP,42,_,_), assignment(OP,58,_,_), OP != -1.
:- assignment(OP,42,_,_), assignment(OP,52,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,63,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,53,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,55,_,_), OP != -1.
:- assignment(OP,54,_,_), assignment(OP,43,_,_), OP != -1.
:- assignment(OP,54,_,_), assignment(OP,51,_,_), OP != -1.
% -------- WEAK CONSTRAINTS --------
%minimize the sum of weights for patients with preference specified by history and not explicitly by patient
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
%minimize the number of assignments to the pretend operator
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
%minimize the sum of weights for patients with preferred operators
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]
% -------- DIRECTIVES --------
#show assignment/4.