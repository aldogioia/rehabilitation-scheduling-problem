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
operator(1 , 30 , 0, 3  , 0  , 0  , 2  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 0  ).
operator(2 , 42 , 0, 5  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 4  , 0  , 0  , 0  ).
operator(3 , 30 , 0, 3  , 0  , 1  , 0  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(4 , 42 , 0, 12 , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 12 , 0  , 0  ).
operator(5 , 42 , 0, 5  , 0  , 0  , 0  , 0  , 0  , 1  , 0  , 3  , 0  , 0  , 0  ).
operator(6 , 42 , 0, 5  , 0  , 0  , 2  , 0  , 0  , 1  , 0  , 1  , 0  , 0  , 0  ).
operator(7 , 42 , 0, 5  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 4  , 0  , 0  , 0  ).
operator(8 , 42 , 0, 5  , 0  , 1  , 1  , 0  , 0  , 0  , 0  , 3  , 0  , 0  , 0  ).
operator(9 , 18 , 1, 1  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(10, 30 , 0, 3  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 4  ).
operator(11, 42 , 0, 5  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 6  ).
operator(12, 42 , 0, 7  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 7  ).
operator(13, 18 , 1, 1  , 0  , 0  , 1  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 0  ).
operator(14, 30 , 0, 5  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 5  ).
operator(15, 42 , 0, 5  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 3  ).
operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).
% patient(ID,TYP,PAY,AID,MIN)
% - ID: id - ID of the patient
% - TYP: type - Type of patient (neurologico, ortopedico, alcolista, covid+, covid-, MAC)
% - PAY: paying - If the patient is paying
% - AID: aidNeeds - In the patient needs aid (lifter)
% - MIN: minimumDuration - Minimum cumulative time in rehab in TU for all sessions on the same day
patient(41, 1, 2, 0, 5).
patient(8 , 2, 2, 0, 5).
patient(22, 4, 2, 0, 1).
patient(1 , 1, 2, 0, 6).
patient(57, 6, 2, 0, 6).
patient(3 , 2, 2, 1, 5).
patient(66, 6, 2, 0, 6).
patient(49, 6, 2, 0, 6).
patient(40, 1, 2, 1, 7).
patient(23, 2, 2, 0, 6).
patient(67, 6, 2, 0, 6).
patient(50, 6, 2, 0, 6).
patient(27, 1, 2, 0, 6).
patient(62, 2, 2, 1, 6).
patient(55, 6, 2, 0, 6).
patient(56, 6, 2, 0, 6).
patient(24, 2, 2, 1, 6).
patient(53, 6, 2, 0, 6).
patient(36, 1, 2, 0, 6).
patient(26, 2, 2, 0, 6).
patient(48, 6, 2, 0, 6).
patient(5 , 2, 2, 0, 7).
patient(47, 6, 2, 0, 6).
patient(4 , 2, 2, 0, 7).
patient(25, 2, 2, 0, 5).
patient(46, 6, 2, 0, 6).
patient(33, 2, 2, 0, 5).
patient(54, 6, 2, 0, 6).
patient(29, 2, 2, 1, 7).
patient(18, 4, 2, 0, 1).
patient(64, 6, 2, 0, 6).
patient(19, 4, 2, 0, 1).
patient(65, 6, 2, 0, 6).
patient(30, 1, 2, 0, 7).
patient(70, 6, 2, 0, 6).
patient(20, 4, 2, 0, 1).
patient(45, 6, 2, 0, 6).
patient(28, 2, 2, 0, 5).
patient(32, 2, 2, 0, 7).
patient(60, 6, 2, 0, 6).
patient(21, 4, 2, 0, 1).
patient(42, 2, 2, 0, 7).
patient(12, 4, 2, 0, 1).
patient(6 , 1, 2, 0, 7).
patient(39, 2, 2, 0, 7).
patient(68, 6, 2, 0, 6).
patient(17, 4, 2, 0, 1).
patient(13, 4, 2, 0, 1).
patient(69, 6, 2, 0, 6).
patient(14, 4, 2, 0, 1).
patient(2 , 1, 2, 0, 7).
patient(15, 4, 2, 0, 1).
patient(16, 4, 2, 0, 1).
patient(34, 2, 2, 0, 7).
patient(11, 4, 2, 0, 1).
patient(58, 6, 2, 0, 6).
patient(63, 6, 2, 0, 6).
patient(31, 1, 2, 0, 6).
patient(51, 6, 2, 0, 6).
patient(10, 2, 2, 0, 7).
patient(9 , 1, 2, 1, 7).
patient(59, 6, 2, 0, 6).
patient(43, 2, 2, 0, 7).
patient(61, 1, 2, 0, 7).
patient(44, 6, 2, 0, 6).
patient(38, 2, 2, 0, 4).
patient(37, 2, 2, 0, 7).
patient(7 , 2, 2, 0, 7).
patient(52, 6, 2, 0, 6).
patient(35, 2, 2, 0, 7).
% session(ID,PAT,MIN,LOC)
% - ID: id - ID of the session
% - PAT: patientId - ID of the patient that does the session
% - MIN: minimumDuration - Minimum length of the session in TU
% - LOC: location - Location in which the session took place
session(41, 41, 3, 1).
session(8 , 8 , 3, 1).
session(22, 22, 1, 2).
session(1 , 1 , 3, 1).
session(57, 57, 6, 1).
session(3 , 3 , 3, 1).
session(66, 66, 6, 1).
session(49, 49, 6, 1).
session(40, 40, 3, 1).
session(23, 23, 3, 1).
session(67, 67, 6, 1).
session(50, 50, 6, 1).
session(27, 27, 3, 1).
session(62, 62, 3, 1).
session(55, 55, 6, 1).
session(56, 56, 6, 1).
session(24, 24, 3, 1).
session(53, 53, 6, 2).
session(36, 36, 3, 1).
session(26, 26, 3, 1).
session(48, 48, 6, 1).
session(5 , 5 , 3, 1).
session(47, 47, 6, 1).
session(4 , 4 , 3, 1).
session(25, 25, 3, 1).
session(46, 46, 6, 1).
session(33, 33, 3, 1).
session(54, 54, 6, 1).
session(29, 29, 3, 1).
session(18, 18, 1, 2).
session(64, 64, 6, 1).
session(19, 19, 1, 2).
session(65, 65, 6, 1).
session(30, 30, 3, 1).
session(70, 70, 6, 1).
session(20, 20, 1, 2).
session(45, 45, 6, 1).
session(28, 28, 3, 1).
session(32, 32, 3, 1).
session(60, 60, 6, 1).
session(21, 21, 1, 2).
session(42, 42, 3, 1).
session(12, 12, 1, 2).
session(6 , 6 , 3, 1).
session(39, 39, 3, 1).
session(68, 68, 6, 1).
session(17, 17, 1, 2).
session(13, 13, 1, 2).
session(69, 69, 6, 1).
session(14, 14, 1, 2).
session(2 , 2 , 3, 1).
session(15, 15, 1, 2).
session(16, 16, 1, 2).
session(34, 34, 3, 1).
session(11, 11, 1, 2).
session(58, 58, 6, 1).
session(63, 63, 6, 1).
session(31, 31, 3, 1).
session(51, 51, 6, 1).
session(10, 10, 3, 1).
session(9 , 9 , 3, 1).
session(59, 59, 6, 1).
session(43, 43, 3, 1).
session(61, 61, 3, 1).
session(44, 44, 6, 1).
session(38, 38, 3, 1).
session(37, 37, 3, 1).
session(7 , 7 , 3, 1).
session(52, 52, 6, 1).
session(35, 35, 3, 1).
% pref(OPE,PAT,WEI,HAS)
% - OPE: operatorId - ID of the Operator
% - PAT: patientId - ID of the Patient
% - WEI: weight - Priority of the preference
% - HAS: hasUserChosenOperator - Indicates if the preference has been given by the operator/patient or if it is inherited from the previous schedules 
pref(-1, 41, 10, 1).
pref(72, 41, 0 , 1).
pref(2 , 41, 1 , 1).
pref(1 , 41, 1 , 1).
pref(8 , 41, 1 , 1).
pref(13, 41, 1 , 1).
pref(9 , 41, 1 , 1).
pref(6 , 41, 1 , 1).
pref(7 , 41, 1 , 1).
pref(-1, 8 , 10, 1).
pref(66, 8 , 0 , 1).
pref(9 , 8 , 1 , 1).
pref(6 , 8 , 1 , 1).
pref(7 , 8 , 1 , 1).
pref(8 , 8 , 1 , 1).
pref(5 , 8 , 1 , 1).
pref(2 , 8 , 1 , 1).
pref(3 , 8 , 1 , 1).
pref(-1, 22, 10, 1).
pref(-1, 1 , 10, 1).
pref(59, 1 , 0 , 1).
pref(1 , 1 , 1 , 1).
pref(7 , 1 , 1 , 1).
pref(13, 1 , 1 , 1).
pref(6 , 1 , 1 , 1).
pref(8 , 1 , 1 , 1).
pref(9 , 1 , 1 , 1).
pref(2 , 1 , 1 , 1).
pref(-1, 57, 10, 1).
pref(70, 57, 0 , 1).
pref(11, 57, 1 , 1).
pref(15, 57, 1 , 1).
pref(12, 57, 1 , 1).
pref(14, 57, 1 , 1).
pref(10, 57, 1 , 1).
pref(-1, 3 , 10, 1).
pref(59, 3 , 0 , 1).
pref(5 , 3 , 1 , 1).
pref(6 , 3 , 1 , 1).
pref(1 , 3 , 1 , 1).
pref(13, 3 , 1 , 1).
pref(-1, 66, 10, 1).
pref(57, 66, 0 , 1).
pref(10, 66, 1 , 1).
pref(11, 66, 1 , 1).
pref(12, 66, 1 , 1).
pref(14, 66, 1 , 1).
pref(15, 66, 1 , 1).
pref(-1, 49, 10, 1).
pref(64, 49, 0 , 1).
pref(11, 49, 1 , 1).
pref(15, 49, 1 , 1).
pref(14, 49, 1 , 1).
pref(10, 49, 1 , 1).
pref(12, 49, 1 , 1).
pref(-1, 40, 10, 1).
pref(69, 40, 0 , 1).
pref(8 , 40, 1 , 1).
pref(3 , 40, 1 , 1).
pref(-1, 23, 10, 1).
pref(61, 23, 0 , 1).
pref(7 , 23, 1 , 1).
pref(9 , 23, 1 , 1).
pref(5 , 23, 1 , 1).
pref(3 , 23, 1 , 1).
pref(6 , 23, 1 , 1).
pref(2 , 23, 1 , 1).
pref(8 , 23, 1 , 1).
pref(-1, 67, 10, 1).
pref(57, 67, 0 , 1).
pref(12, 67, 1 , 1).
pref(11, 67, 1 , 1).
pref(10, 67, 1 , 1).
pref(14, 67, 1 , 1).
pref(15, 67, 1 , 1).
pref(-1, 50, 10, 1).
pref(64, 50, 0 , 1).
pref(14, 50, 1 , 1).
pref(10, 50, 1 , 1).
pref(15, 50, 1 , 1).
pref(11, 50, 1 , 1).
pref(12, 50, 1 , 1).
pref(-1, 27, 10, 1).
pref(62, 27, 0 , 1).
pref(7 , 27, 1 , 1).
pref(2 , 27, 1 , 1).
pref(1 , 27, 1 , 1).
pref(9 , 27, 1 , 1).
pref(6 , 27, 1 , 1).
pref(8 , 27, 1 , 1).
pref(13, 27, 1 , 1).
pref(-1, 62, 10, 1).
pref(74, 62, 0 , 1).
pref(13, 62, 1 , 1).
pref(6 , 62, 1 , 1).
pref(1 , 62, 1 , 1).
pref(5 , 62, 1 , 1).
pref(-1, 55, 10, 1).
pref(70, 55, 0 , 1).
pref(12, 55, 1 , 1).
pref(11, 55, 1 , 1).
pref(10, 55, 1 , 1).
pref(15, 55, 1 , 1).
pref(14, 55, 1 , 1).
pref(-1, 56, 10, 1).
pref(70, 56, 0 , 1).
pref(15, 56, 1 , 1).
pref(12, 56, 1 , 1).
pref(11, 56, 1 , 1).
pref(10, 56, 1 , 1).
pref(14, 56, 1 , 1).
pref(-1, 24, 10, 1).
pref(61, 24, 0 , 1).
pref(6 , 24, 1 , 1).
pref(5 , 24, 1 , 1).
pref(1 , 24, 1 , 1).
pref(13, 24, 1 , 1).
pref(-1, 53, 10, 1).
pref(64, 53, 0 , 1).
pref(12, 53, 1 , 1).
pref(15, 53, 1 , 1).
pref(14, 53, 1 , 1).
pref(11, 53, 1 , 1).
pref(10, 53, 1 , 1).
pref(-1, 36, 10, 1).
pref(69, 36, 0 , 1).
pref(9 , 36, 1 , 1).
pref(8 , 36, 1 , 1).
pref(1 , 36, 1 , 1).
pref(6 , 36, 1 , 1).
pref(2 , 36, 1 , 1).
pref(7 , 36, 1 , 1).
pref(13, 36, 1 , 1).
pref(-1, 26, 10, 1).
pref(61, 26, 0 , 1).
pref(7 , 26, 1 , 1).
pref(6 , 26, 1 , 1).
pref(5 , 26, 1 , 1).
pref(2 , 26, 1 , 1).
pref(8 , 26, 1 , 1).
pref(3 , 26, 1 , 1).
pref(9 , 26, 1 , 1).
pref(-1, 48, 10, 1).
pref(64, 48, 0 , 1).
pref(12, 48, 1 , 1).
pref(14, 48, 1 , 1).
pref(15, 48, 1 , 1).
pref(10, 48, 1 , 1).
pref(11, 48, 1 , 1).
pref(-1, 5 , 10, 1).
pref(66, 5 , 0 , 1).
pref(8 , 5 , 1 , 1).
pref(2 , 5 , 1 , 1).
pref(9 , 5 , 1 , 1).
pref(6 , 5 , 1 , 1).
pref(7 , 5 , 1 , 1).
pref(3 , 5 , 1 , 1).
pref(5 , 5 , 1 , 1).
pref(-1, 47, 10, 1).
pref(53, 47, 0 , 1).
pref(12, 47, 1 , 1).
pref(15, 47, 1 , 1).
pref(11, 47, 1 , 1).
pref(14, 47, 1 , 1).
pref(10, 47, 1 , 1).
pref(-1, 4 , 10, 1).
pref(66, 4 , 0 , 1).
pref(5 , 4 , 1 , 1).
pref(3 , 4 , 1 , 1).
pref(9 , 4 , 1 , 1).
pref(7 , 4 , 1 , 1).
pref(8 , 4 , 1 , 1).
pref(2 , 4 , 1 , 1).
pref(6 , 4 , 1 , 1).
pref(-1, 25, 10, 1).
pref(61, 25, 0 , 1).
pref(3 , 25, 1 , 1).
pref(2 , 25, 1 , 1).
pref(9 , 25, 1 , 1).
pref(5 , 25, 1 , 1).
pref(7 , 25, 1 , 1).
pref(6 , 25, 1 , 1).
pref(8 , 25, 1 , 1).
pref(-1, 46, 10, 1).
pref(53, 46, 0 , 1).
pref(14, 46, 1 , 1).
pref(12, 46, 1 , 1).
pref(10, 46, 1 , 1).
pref(15, 46, 1 , 1).
pref(11, 46, 1 , 1).
pref(-1, 33, 10, 1).
pref(63, 33, 0 , 1).
pref(7 , 33, 1 , 1).
pref(3 , 33, 1 , 1).
pref(9 , 33, 1 , 1).
pref(8 , 33, 1 , 1).
pref(2 , 33, 1 , 1).
pref(6 , 33, 1 , 1).
pref(5 , 33, 1 , 1).
pref(-1, 54, 10, 1).
pref(70, 54, 0 , 1).
pref(12, 54, 1 , 1).
pref(14, 54, 1 , 1).
pref(15, 54, 1 , 1).
pref(10, 54, 1 , 1).
pref(11, 54, 1 , 1).
pref(-1, 29, 10, 1).
pref(62, 29, 0 , 1).
pref(6 , 29, 1 , 1).
pref(13, 29, 1 , 1).
pref(5 , 29, 1 , 1).
pref(1 , 29, 1 , 1).
pref(-1, 18, 10, 1).
pref(-1, 64, 10, 1).
pref(57, 64, 0 , 1).
pref(10, 64, 1 , 1).
pref(12, 64, 1 , 1).
pref(14, 64, 1 , 1).
pref(11, 64, 1 , 1).
pref(15, 64, 1 , 1).
pref(-1, 19, 10, 1).
pref(-1, 65, 10, 1).
pref(57, 65, 0 , 1).
pref(10, 65, 1 , 1).
pref(11, 65, 1 , 1).
pref(14, 65, 1 , 1).
pref(12, 65, 1 , 1).
pref(15, 65, 1 , 1).
pref(-1, 30, 10, 1).
pref(62, 30, 0 , 1).
pref(13, 30, 1 , 1).
pref(8 , 30, 1 , 1).
pref(7 , 30, 1 , 1).
pref(6 , 30, 1 , 1).
pref(1 , 30, 1 , 1).
pref(2 , 30, 1 , 1).
pref(9 , 30, 1 , 1).
pref(-1, 70, 10, 1).
pref(65, 70, 0 , 1).
pref(11, 70, 1 , 1).
pref(15, 70, 1 , 1).
pref(10, 70, 1 , 1).
pref(14, 70, 1 , 1).
pref(12, 70, 1 , 1).
pref(-1, 20, 10, 1).
pref(-1, 45, 10, 1).
pref(53, 45, 0 , 1).
pref(14, 45, 1 , 1).
pref(12, 45, 1 , 1).
pref(10, 45, 1 , 1).
pref(15, 45, 1 , 1).
pref(11, 45, 1 , 1).
pref(-1, 28, 10, 1).
pref(62, 28, 0 , 1).
pref(7 , 28, 1 , 1).
pref(5 , 28, 1 , 1).
pref(3 , 28, 1 , 1).
pref(9 , 28, 1 , 1).
pref(2 , 28, 1 , 1).
pref(6 , 28, 1 , 1).
pref(8 , 28, 1 , 1).
pref(-1, 32, 10, 1).
pref(63, 32, 0 , 1).
pref(9 , 32, 1 , 1).
pref(3 , 32, 1 , 1).
pref(5 , 32, 1 , 1).
pref(8 , 32, 1 , 1).
pref(2 , 32, 1 , 1).
pref(7 , 32, 1 , 1).
pref(6 , 32, 1 , 1).
pref(-1, 60, 10, 1).
pref(70, 60, 0 , 1).
pref(10, 60, 1 , 1).
pref(11, 60, 1 , 1).
pref(15, 60, 1 , 1).
pref(12, 60, 1 , 1).
pref(14, 60, 1 , 1).
pref(-1, 21, 10, 1).
pref(-1, 42, 10, 1).
pref(72, 42, 0 , 1).
pref(8 , 42, 1 , 1).
pref(5 , 42, 1 , 1).
pref(9 , 42, 1 , 1).
pref(3 , 42, 1 , 1).
pref(7 , 42, 1 , 1).
pref(6 , 42, 1 , 1).
pref(2 , 42, 1 , 1).
pref(-1, 12, 10, 1).
pref(-1, 6 , 10, 1).
pref(66, 6 , 0 , 1).
pref(2 , 6 , 1 , 1).
pref(9 , 6 , 1 , 1).
pref(8 , 6 , 1 , 1).
pref(13, 6 , 1 , 1).
pref(7 , 6 , 1 , 1).
pref(1 , 6 , 1 , 1).
pref(6 , 6 , 1 , 1).
pref(-1, 39, 10, 1).
pref(69, 39, 0 , 1).
pref(2 , 39, 1 , 1).
pref(5 , 39, 1 , 1).
pref(8 , 39, 1 , 1).
pref(6 , 39, 1 , 1).
pref(9 , 39, 1 , 1).
pref(3 , 39, 1 , 1).
pref(7 , 39, 1 , 1).
pref(-1, 68, 10, 1).
pref(65, 68, 0 , 1).
pref(10, 68, 1 , 1).
pref(12, 68, 1 , 1).
pref(15, 68, 1 , 1).
pref(14, 68, 1 , 1).
pref(11, 68, 1 , 1).
pref(-1, 17, 10, 1).
pref(-1, 13, 10, 1).
pref(-1, 69, 10, 1).
pref(65, 69, 0 , 1).
pref(11, 69, 1 , 1).
pref(15, 69, 1 , 1).
pref(10, 69, 1 , 1).
pref(14, 69, 1 , 1).
pref(12, 69, 1 , 1).
pref(-1, 14, 10, 1).
pref(-1, 2 , 10, 1).
pref(59, 2 , 0 , 1).
pref(2 , 2 , 1 , 1).
pref(8 , 2 , 1 , 1).
pref(6 , 2 , 1 , 1).
pref(1 , 2 , 1 , 1).
pref(7 , 2 , 1 , 1).
pref(13, 2 , 1 , 1).
pref(9 , 2 , 1 , 1).
pref(-1, 15, 10, 1).
pref(-1, 16, 10, 1).
pref(-1, 34, 10, 1).
pref(63, 34, 0 , 1).
pref(3 , 34, 1 , 1).
pref(9 , 34, 1 , 1).
pref(6 , 34, 1 , 1).
pref(2 , 34, 1 , 1).
pref(7 , 34, 1 , 1).
pref(5 , 34, 1 , 1).
pref(8 , 34, 1 , 1).
pref(-1, 11, 10, 1).
pref(-1, 58, 10, 1).
pref(70, 58, 0 , 1).
pref(14, 58, 1 , 1).
pref(10, 58, 1 , 1).
pref(12, 58, 1 , 1).
pref(11, 58, 1 , 1).
pref(15, 58, 1 , 1).
pref(-1, 63, 10, 1).
pref(57, 63, 0 , 1).
pref(12, 63, 1 , 1).
pref(11, 63, 1 , 1).
pref(14, 63, 1 , 1).
pref(15, 63, 1 , 1).
pref(10, 63, 1 , 1).
pref(-1, 31, 10, 1).
pref(63, 31, 0 , 1).
pref(13, 31, 1 , 1).
pref(1 , 31, 1 , 1).
pref(9 , 31, 1 , 1).
pref(7 , 31, 1 , 1).
pref(6 , 31, 1 , 1).
pref(8 , 31, 1 , 1).
pref(2 , 31, 1 , 1).
pref(-1, 51, 10, 1).
pref(64, 51, 0 , 1).
pref(11, 51, 1 , 1).
pref(12, 51, 1 , 1).
pref(15, 51, 1 , 1).
pref(14, 51, 1 , 1).
pref(10, 51, 1 , 1).
pref(-1, 10, 10, 1).
pref(54, 10, 0 , 1).
pref(9 , 10, 1 , 1).
pref(5 , 10, 1 , 1).
pref(2 , 10, 1 , 1).
pref(8 , 10, 1 , 1).
pref(7 , 10, 1 , 1).
pref(3 , 10, 1 , 1).
pref(6 , 10, 1 , 1).
pref(-1, 9 , 10, 1).
pref(54, 9 , 0 , 1).
pref(8 , 9 , 1 , 1).
pref(3 , 9 , 1 , 1).
pref(-1, 59, 10, 1).
pref(70, 59, 0 , 1).
pref(11, 59, 1 , 1).
pref(10, 59, 1 , 1).
pref(12, 59, 1 , 1).
pref(15, 59, 1 , 1).
pref(14, 59, 1 , 1).
pref(-1, 43, 10, 1).
pref(72, 43, 0 , 1).
pref(6 , 43, 1 , 1).
pref(8 , 43, 1 , 1).
pref(3 , 43, 1 , 1).
pref(2 , 43, 1 , 1).
pref(9 , 43, 1 , 1).
pref(5 , 43, 1 , 1).
pref(7 , 43, 1 , 1).
pref(-1, 61, 10, 1).
pref(74, 61, 0 , 1).
pref(13, 61, 1 , 1).
pref(8 , 61, 1 , 1).
pref(9 , 61, 1 , 1).
pref(7 , 61, 1 , 1).
pref(6 , 61, 1 , 1).
pref(2 , 61, 1 , 1).
pref(1 , 61, 1 , 1).
pref(-1, 44, 10, 1).
pref(53, 44, 0 , 1).
pref(14, 44, 1 , 1).
pref(12, 44, 1 , 1).
pref(10, 44, 1 , 1).
pref(15, 44, 1 , 1).
pref(11, 44, 1 , 1).
pref(-1, 38, 10, 1).
pref(69, 38, 0 , 1).
pref(9 , 38, 1 , 1).
pref(5 , 38, 1 , 1).
pref(3 , 38, 1 , 1).
pref(6 , 38, 1 , 1).
pref(8 , 38, 1 , 1).
pref(7 , 38, 1 , 1).
pref(2 , 38, 1 , 1).
pref(-1, 37, 10, 1).
pref(69, 37, 0 , 1).
pref(2 , 37, 1 , 1).
pref(3 , 37, 1 , 1).
pref(5 , 37, 1 , 1).
pref(8 , 37, 1 , 1).
pref(9 , 37, 1 , 1).
pref(6 , 37, 1 , 1).
pref(7 , 37, 1 , 1).
pref(-1, 7 , 10, 1).
pref(66, 7 , 0 , 1).
pref(9 , 7 , 1 , 1).
pref(7 , 7 , 1 , 1).
pref(2 , 7 , 1 , 1).
pref(3 , 7 , 1 , 1).
pref(6 , 7 , 1 , 1).
pref(8 , 7 , 1 , 1).
pref(5 , 7 , 1 , 1).
pref(-1, 52, 10, 1).
pref(64, 52, 0 , 1).
pref(10, 52, 1 , 1).
pref(11, 52, 1 , 1).
pref(12, 52, 1 , 1).
pref(15, 52, 1 , 1).
pref(14, 52, 1 , 1).
pref(-1, 35, 10, 1).
pref(63, 35, 0 , 1).
pref(8 , 35, 1 , 1).
pref(7 , 35, 1 , 1).
pref(5 , 35, 1 , 1).
pref(6 , 35, 1 , 1).
pref(9 , 35, 1 , 1).
pref(3 , 35, 1 , 1).
pref(2 , 35, 1 , 1).
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
:- assignment(OP,49,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,67,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,67,_,_), assignment(OP,49,_,_), OP != -1.
:- assignment(OP,48,_,_), assignment(OP,55,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,49,_,_), OP != -1.
:- assignment(OP,47,_,_), assignment(OP,67,_,_), OP != -1.
:- assignment(OP,46,_,_), assignment(OP,56,_,_), OP != -1.
:- assignment(OP,54,_,_), assignment(OP,50,_,_), OP != -1.
:- assignment(OP,64,_,_), assignment(OP,55,_,_), OP != -1.
:- assignment(OP,64,_,_), assignment(OP,48,_,_), OP != -1.
:- assignment(OP,65,_,_), assignment(OP,56,_,_), OP != -1.
:- assignment(OP,65,_,_), assignment(OP,46,_,_), OP != -1.
:- assignment(OP,45,_,_), assignment(OP,50,_,_), OP != -1.
:- assignment(OP,45,_,_), assignment(OP,54,_,_), OP != -1.
:- assignment(OP,68,_,_), assignment(OP,57,_,_), OP != -1.
:- assignment(OP,68,_,_), assignment(OP,49,_,_), OP != -1.
:- assignment(OP,68,_,_), assignment(OP,67,_,_), OP != -1.
:- assignment(OP,68,_,_), assignment(OP,47,_,_), OP != -1.
:- assignment(OP,69,_,_), assignment(OP,60,_,_), OP != -1.
:- assignment(OP,58,_,_), assignment(OP,53,_,_), OP != -1.
:- assignment(OP,63,_,_), assignment(OP,50,_,_), OP != -1.
:- assignment(OP,63,_,_), assignment(OP,54,_,_), OP != -1.
:- assignment(OP,63,_,_), assignment(OP,45,_,_), OP != -1.
:- assignment(OP,51,_,_), assignment(OP,70,_,_), OP != -1.
:- assignment(OP,59,_,_), assignment(OP,70,_,_), OP != -1.
:- assignment(OP,59,_,_), assignment(OP,51,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,55,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,48,_,_), OP != -1.
:- assignment(OP,44,_,_), assignment(OP,64,_,_), OP != -1.
:- assignment(OP,52,_,_), assignment(OP,60,_,_), OP != -1.
:- assignment(OP,52,_,_), assignment(OP,69,_,_), OP != -1.
% -------- WEAK CONSTRAINTS --------
%minimize the sum of weights for patients with preference specified by history and not explicitly by patient
:~ #sum{W, PAT: assignment(_, PAT, W, 0)} = N. [N@1]
%minimize the number of assignments to the pretend operator
:~ #count{PAT: assignment(-1, PAT, _, _)} = N. [N@2]
%minimize the sum of weights for patients with preferred operators
:~ #sum{W, PAT : assignment(_,PAT,W,1)} = N. [N@3]
% -------- DIRECTIVES --------
#show assignment/4.