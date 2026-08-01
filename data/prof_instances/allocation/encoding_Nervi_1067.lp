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
operator(29, 33 , 0, 6  , 0  , 0  , 4  , 1  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(30, 29 , 0, 6  , 0  , 1  , 4  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(31, 20 , 1, 4  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(32, 14 , 1, 3  , 0  , 0  , 2  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(35, 23 , 0, 5  , 0  , 1  , 2  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(38, 21 , 0, 4  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 2  , 0  , 1  , 0  ).
operator(39, 20 , 1, 4  , 0  , 0  , 3  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(40, 33 , 0, 6  , 0  , 1  , 3  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(42, 14 , 1, 3  , 0  , 1  , 2  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  ).
operator(44, 33 , 0, 6  , 0  , 0  , 5  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(46, 17 , 0, 6  , 0  , 3  , 1  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(48, 34 , 0, 6  , 0  , 2  , 3  , 0  , 0  , 0  , 0  , 1  , 0  , 0  , 0  ).
operator(49, 27 , 0, 5  , 0  , 1  , 3  , 0  , 0  , 0  , 0  , 2  , 0  , 0  , 0  ).
operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).
% patient(ID,TYP,PAY,AID,MIN)
% - ID: id - ID of the patient
% - TYP: type - Type of patient (neurologico, ortopedico, alcolista, covid+, covid-, MAC)
% - PAY: paying - If the patient is paying
% - AID: aidNeeds - In the patient needs aid (lifter)
% - MIN: minimumDuration - Minimum cumulative time in rehab in TU for all sessions on the same day
patient(210, 1, 2, 0, 4).
patient(216, 1, 2, 0, 6).
patient(219, 1, 2, 1, 6).
patient(222, 1, 2, 0, 4).
patient(225, 1, 2, 1, 6).
patient(229, 1, 2, 0, 6).
patient(230, 1, 2, 0, 6).
patient(234, 1, 2, 0, 6).
patient(235, 1, 2, 0, 6).
patient(236, 1, 2, 1, 6).
patient(238, 2, 2, 0, 6).
patient(241, 1, 2, 0, 6).
patient(244, 1, 2, 0, 6).
patient(245, 1, 2, 0, 6).
patient(246, 1, 2, 0, 6).
patient(248, 1, 2, 1, 6).
patient(250, 2, 2, 0, 6).
patient(253, 1, 2, 1, 6).
patient(254, 1, 2, 0, 6).
patient(257, 1, 2, 0, 6).
patient(258, 2, 2, 0, 6).
patient(259, 1, 2, 0, 6).
patient(260, 1, 2, 0, 6).
patient(261, 1, 2, 0, 6).
patient(265, 1, 2, 0, 6).
patient(266, 1, 2, 0, 6).
patient(267, 1, 2, 0, 6).
patient(268, 1, 2, 0, 6).
patient(269, 1, 2, 1, 6).
patient(270, 1, 2, 0, 6).
patient(271, 1, 2, 0, 6).
patient(272, 1, 2, 0, 6).
patient(273, 1, 2, 1, 4).
patient(275, 1, 2, 0, 6).
patient(276, 1, 2, 0, 6).
patient(277, 2, 2, 0, 6).
patient(278, 1, 2, 0, 6).
patient(281, 1, 2, 0, 6).
patient(282, 2, 2, 0, 6).
patient(284, 5, 2, 0, 6).
patient(285, 1, 2, 0, 6).
patient(286, 1, 2, 0, 6).
patient(287, 1, 2, 1, 6).
patient(288, 1, 2, 0, 4).
patient(289, 1, 2, 0, 6).
patient(290, 2, 2, 0, 6).
patient(291, 2, 2, 0, 6).
patient(292, 1, 2, 1, 4).
patient(293, 1, 2, 0, 4).
patient(294, 1, 1, 0, 8).
patient(295, 1, 2, 0, 6).
patient(296, 2, 2, 0, 6).
patient(297, 2, 2, 0, 6).
patient(298, 2, 2, 0, 6).
patient(300, 2, 2, 0, 6).
patient(301, 2, 2, 0, 6).
patient(302, 1, 2, 0, 6).
patient(303, 1, 2, 0, 4).
patient(304, 1, 2, 1, 4).
patient(305, 1, 2, 0, 6).
patient(307, 2, 2, 0, 6).
patient(308, 1, 2, 0, 6).
patient(309, 1, 2, 0, 6).
patient(311, 2, 2, 0, 6).
% session(ID,PAT,MIN,LOC)
% - ID: id - ID of the session
% - PAT: patientId - ID of the patient that does the session
% - MIN: minimumDuration - Minimum length of the session in TU
% - LOC: location - Location in which the session took place
session(1317, 210, 3, 2).
session(1554, 216, 3, 1).
session(1550, 219, 3, 1).
session(1223, 222, 3, 2).
session(1191, 225, 3, 1).
session(919 , 229, 2, 1).
session(1347, 230, 3, 1).
session(1512, 234, 3, 1).
session(1495, 235, 3, 1).
session(1511, 236, 3, 1).
session(1623, 238, 3, 1).
session(1591, 241, 3, 1).
session(1492, 244, 3, 1).
session(1488, 245, 3, 1).
session(1467, 246, 3, 1).
session(1653, 248, 3, 1).
session(1562, 250, 3, 1).
session(1197, 253, 3, 1).
session(1490, 254, 3, 1).
session(1556, 257, 3, 1).
session(1616, 258, 3, 1).
session(1572, 259, 3, 1).
session(1123, 260, 3, 1).
session(1124, 261, 3, 1).
session(1483, 265, 3, 1).
session(1117, 266, 3, 1).
session(1542, 267, 3, 1).
session(1470, 268, 3, 1).
session(1482, 269, 3, 1).
session(1652, 270, 3, 1).
session(1540, 271, 3, 1).
session(1479, 272, 3, 1).
session(1499, 273, 3, 2).
session(1450, 275, 3, 1).
session(1330, 276, 3, 1).
session(1351, 277, 3, 1).
session(1326, 278, 3, 1).
session(1563, 281, 3, 1).
session(1328, 282, 3, 1).
session(1647, 284, 3, 1).
session(1593, 285, 3, 1).
session(1517, 286, 3, 1).
session(1513, 287, 3, 1).
session(1500, 288, 3, 2).
session(1560, 289, 3, 1).
session(1464, 290, 3, 1).
session(1465, 291, 3, 1).
session(1466, 292, 3, 2).
session(1431, 293, 3, 2).
session(1515, 294, 3, 2).
session(1516, 294, 2, 2).
session(1461, 295, 3, 1).
session(1509, 296, 3, 1).
session(1436, 297, 3, 1).
session(1590, 298, 3, 1).
session(1645, 300, 3, 1).
session(1463, 301, 3, 1).
session(1649, 302, 3, 2).
session(1555, 303, 3, 2).
session(1588, 304, 3, 1).
session(1567, 305, 3, 1).
session(1570, 307, 3, 1).
session(1648, 308, 3, 1).
session(1646, 309, 3, 1).
session(1642, 311, 3, 1).
% pref(OPE,PAT,WEI,HAS)
% - OPE: operatorId - ID of the Operator
% - PAT: patientId - ID of the Patient
% - WEI: weight - Priority of the preference
% - HAS: hasUserChosenOperator - Indicates if the preference has been given by the operator/patient or if it is inherited from the previous schedules 
pref(-1, 210, 10, 1).
pref(48, 210, 0 , 1).
pref(49, 210, 1 , 1).
pref(46, 210, 1 , 1).
pref(38, 210, 1 , 1).
pref(40, 210, 1 , 1).
pref(44, 210, 1 , 1).
pref(32, 210, 1 , 1).
pref(35, 210, 1 , 1).
pref(30, 210, 1 , 1).
pref(31, 210, 1 , 1).
pref(42, 210, 1 , 1).
pref(39, 210, 1 , 1).
pref(29, 210, 1 , 1).
pref(-1, 216, 10, 1).
pref(40, 216, 0 , 1).
pref(45, 216, 0 , 1).
pref(31, 216, 1 , 1).
pref(39, 216, 1 , 1).
pref(38, 216, 1 , 1).
pref(32, 216, 1 , 1).
pref(49, 216, 1 , 1).
pref(42, 216, 1 , 1).
pref(29, 216, 1 , 1).
pref(46, 216, 1 , 1).
pref(48, 216, 1 , 1).
pref(35, 216, 1 , 1).
pref(30, 216, 1 , 1).
pref(44, 216, 1 , 1).
pref(-1, 219, 10, 1).
pref(46, 219, 0 , 1).
pref(35, 219, 1 , 1).
pref(40, 219, 1 , 1).
pref(49, 219, 1 , 1).
pref(42, 219, 1 , 1).
pref(48, 219, 1 , 1).
pref(30, 219, 1 , 1).
pref(-1, 222, 10, 1).
pref(30, 222, 0 , 1).
pref(31, 222, 1 , 1).
pref(38, 222, 1 , 1).
pref(48, 222, 1 , 1).
pref(46, 222, 1 , 1).
pref(35, 222, 1 , 1).
pref(40, 222, 1 , 1).
pref(29, 222, 1 , 1).
pref(44, 222, 1 , 1).
pref(42, 222, 1 , 1).
pref(49, 222, 1 , 1).
pref(39, 222, 1 , 1).
pref(32, 222, 1 , 1).
pref(-1, 225, 10, 1).
pref(30, 225, 0 , 1).
pref(40, 225, 1 , 1).
pref(42, 225, 1 , 1).
pref(35, 225, 1 , 1).
pref(46, 225, 1 , 1).
pref(48, 225, 1 , 1).
pref(49, 225, 1 , 1).
pref(-1, 229, 10, 1).
pref(31, 229, 0 , 1).
pref(46, 229, 1 , 1).
pref(42, 229, 1 , 1).
pref(39, 229, 1 , 1).
pref(49, 229, 1 , 1).
pref(44, 229, 1 , 1).
pref(29, 229, 1 , 1).
pref(48, 229, 1 , 1).
pref(32, 229, 1 , 1).
pref(38, 229, 1 , 1).
pref(30, 229, 1 , 1).
pref(40, 229, 1 , 1).
pref(35, 229, 1 , 1).
pref(-1, 230, 10, 1).
pref(38, 230, 0 , 1).
pref(46, 230, 1 , 1).
pref(31, 230, 1 , 1).
pref(40, 230, 1 , 1).
pref(29, 230, 1 , 1).
pref(35, 230, 1 , 1).
pref(44, 230, 1 , 1).
pref(49, 230, 1 , 1).
pref(32, 230, 1 , 1).
pref(39, 230, 1 , 1).
pref(42, 230, 1 , 1).
pref(30, 230, 1 , 1).
pref(48, 230, 1 , 1).
pref(-1, 234, 10, 1).
pref(40, 234, 0 , 1).
pref(42, 234, 1 , 1).
pref(49, 234, 1 , 1).
pref(46, 234, 1 , 1).
pref(35, 234, 1 , 1).
pref(32, 234, 1 , 1).
pref(44, 234, 1 , 1).
pref(30, 234, 1 , 1).
pref(31, 234, 1 , 1).
pref(38, 234, 1 , 1).
pref(48, 234, 1 , 1).
pref(29, 234, 1 , 1).
pref(39, 234, 1 , 1).
pref(-1, 235, 10, 1).
pref(31, 235, 0 , 1).
pref(46, 235, 1 , 1).
pref(32, 235, 1 , 1).
pref(40, 235, 1 , 1).
pref(44, 235, 1 , 1).
pref(38, 235, 1 , 1).
pref(29, 235, 1 , 1).
pref(35, 235, 1 , 1).
pref(49, 235, 1 , 1).
pref(30, 235, 1 , 1).
pref(42, 235, 1 , 1).
pref(48, 235, 1 , 1).
pref(39, 235, 1 , 1).
pref(-1, 236, 10, 1).
pref(42, 236, 0 , 1).
pref(49, 236, 1 , 1).
pref(-1, 238, 10, 1).
pref(29, 238, 0 , 1).
pref(38, 238, 1 , 1).
pref(32, 238, 1 , 1).
pref(49, 238, 1 , 1).
pref(44, 238, 1 , 1).
pref(46, 238, 1 , 1).
pref(40, 238, 1 , 1).
pref(35, 238, 1 , 1).
pref(48, 238, 1 , 1).
pref(-1, 241, 10, 1).
pref(43, 241, 0 , 1).
pref(29, 241, 0 , 1).
pref(38, 241, 1 , 1).
pref(-1, 244, 10, 1).
pref(39, 244, 0 , 1).
pref(44, 244, 1 , 1).
pref(35, 244, 1 , 1).
pref(49, 244, 1 , 1).
pref(46, 244, 1 , 1).
pref(30, 244, 1 , 1).
pref(31, 244, 1 , 1).
pref(32, 244, 1 , 1).
pref(40, 244, 1 , 1).
pref(29, 244, 1 , 1).
pref(48, 244, 1 , 1).
pref(38, 244, 1 , 1).
pref(42, 244, 1 , 1).
pref(-1, 245, 10, 1).
pref(45, 245, 0 , 1).
pref(48, 245, 1 , 1).
pref(49, 245, 1 , 1).
pref(38, 245, 1 , 1).
pref(29, 245, 1 , 1).
pref(35, 245, 1 , 1).
pref(44, 245, 1 , 1).
pref(32, 245, 1 , 1).
pref(40, 245, 1 , 1).
pref(46, 245, 1 , 1).
pref(31, 245, 1 , 1).
pref(30, 245, 1 , 1).
pref(42, 245, 1 , 1).
pref(39, 245, 1 , 1).
pref(-1, 246, 10, 1).
pref(35, 246, 0 , 1).
pref(30, 246, 1 , 1).
pref(29, 246, 1 , 1).
pref(39, 246, 1 , 1).
pref(31, 246, 1 , 1).
pref(38, 246, 1 , 1).
pref(44, 246, 1 , 1).
pref(46, 246, 1 , 1).
pref(42, 246, 1 , 1).
pref(49, 246, 1 , 1).
pref(32, 246, 1 , 1).
pref(48, 246, 1 , 1).
pref(40, 246, 1 , 1).
pref(-1, 248, 10, 1).
pref(35, 248, 0 , 1).
pref(30, 248, 1 , 1).
pref(49, 248, 1 , 1).
pref(40, 248, 1 , 1).
pref(48, 248, 1 , 1).
pref(46, 248, 1 , 1).
pref(42, 248, 1 , 1).
pref(-1, 250, 10, 1).
pref(40, 250, 0 , 1).
pref(38, 250, 1 , 1).
pref(35, 250, 1 , 1).
pref(46, 250, 1 , 1).
pref(32, 250, 1 , 1).
pref(48, 250, 1 , 1).
pref(44, 250, 1 , 1).
pref(29, 250, 1 , 1).
pref(49, 250, 1 , 1).
pref(-1, 253, 10, 1).
pref(48, 253, 0 , 1).
pref(46, 253, 1 , 1).
pref(42, 253, 1 , 1).
pref(49, 253, 1 , 1).
pref(35, 253, 1 , 1).
pref(30, 253, 1 , 1).
pref(40, 253, 1 , 1).
pref(-1, 254, 10, 1).
pref(31, 254, 0 , 1).
pref(44, 254, 1 , 1).
pref(40, 254, 1 , 1).
pref(30, 254, 1 , 1).
pref(32, 254, 1 , 1).
pref(29, 254, 1 , 1).
pref(38, 254, 1 , 1).
pref(35, 254, 1 , 1).
pref(42, 254, 1 , 1).
pref(49, 254, 1 , 1).
pref(48, 254, 1 , 1).
pref(39, 254, 1 , 1).
pref(46, 254, 1 , 1).
pref(-1, 257, 10, 1).
pref(39, 257, 0 , 1).
pref(38, 257, 1 , 1).
pref(46, 257, 1 , 1).
pref(49, 257, 1 , 1).
pref(32, 257, 1 , 1).
pref(29, 257, 1 , 1).
pref(40, 257, 1 , 1).
pref(30, 257, 1 , 1).
pref(44, 257, 1 , 1).
pref(48, 257, 1 , 1).
pref(42, 257, 1 , 1).
pref(35, 257, 1 , 1).
pref(31, 257, 1 , 1).
pref(-1, 258, 10, 1).
pref(43, 258, 0 , 1).
pref(40, 258, 0 , 1).
pref(44, 258, 1 , 1).
pref(32, 258, 1 , 1).
pref(49, 258, 1 , 1).
pref(29, 258, 1 , 1).
pref(46, 258, 1 , 1).
pref(38, 258, 1 , 1).
pref(48, 258, 1 , 1).
pref(35, 258, 1 , 1).
pref(-1, 259, 10, 1).
pref(42, 259, 0 , 1).
pref(44, 259, 1 , 1).
pref(-1, 260, 10, 1).
pref(34, 260, 0 , 1).
pref(38, 260, 1 , 1).
pref(30, 260, 1 , 1).
pref(32, 260, 1 , 1).
pref(44, 260, 1 , 1).
pref(35, 260, 1 , 1).
pref(46, 260, 1 , 1).
pref(48, 260, 1 , 1).
pref(39, 260, 1 , 1).
pref(29, 260, 1 , 1).
pref(40, 260, 1 , 1).
pref(49, 260, 1 , 1).
pref(31, 260, 1 , 1).
pref(42, 260, 1 , 1).
pref(-1, 261, 10, 1).
pref(44, 261, 0 , 1).
pref(35, 261, 1 , 1).
pref(39, 261, 1 , 1).
pref(38, 261, 1 , 1).
pref(30, 261, 1 , 1).
pref(29, 261, 1 , 1).
pref(31, 261, 1 , 1).
pref(49, 261, 1 , 1).
pref(40, 261, 1 , 1).
pref(42, 261, 1 , 1).
pref(46, 261, 1 , 1).
pref(48, 261, 1 , 1).
pref(32, 261, 1 , 1).
pref(-1, 265, 10, 1).
pref(49, 265, 0 , 1).
pref(31, 265, 1 , 1).
pref(40, 265, 1 , 1).
pref(30, 265, 1 , 1).
pref(39, 265, 1 , 1).
pref(42, 265, 1 , 1).
pref(48, 265, 1 , 1).
pref(46, 265, 1 , 1).
pref(29, 265, 1 , 1).
pref(38, 265, 1 , 1).
pref(44, 265, 1 , 1).
pref(32, 265, 1 , 1).
pref(35, 265, 1 , 1).
pref(-1, 266, 10, 1).
pref(32, 266, 0 , 1).
pref(29, 266, 1 , 1).
pref(48, 266, 1 , 1).
pref(39, 266, 1 , 1).
pref(44, 266, 1 , 1).
pref(40, 266, 1 , 1).
pref(42, 266, 1 , 1).
pref(30, 266, 1 , 1).
pref(46, 266, 1 , 1).
pref(38, 266, 1 , 1).
pref(31, 266, 1 , 1).
pref(49, 266, 1 , 1).
pref(35, 266, 1 , 1).
pref(-1, 267, 10, 1).
pref(42, 267, 0 , 1).
pref(40, 267, 1 , 1).
pref(48, 267, 1 , 1).
pref(38, 267, 1 , 1).
pref(31, 267, 1 , 1).
pref(30, 267, 1 , 1).
pref(35, 267, 1 , 1).
pref(46, 267, 1 , 1).
pref(49, 267, 1 , 1).
pref(44, 267, 1 , 1).
pref(39, 267, 1 , 1).
pref(29, 267, 1 , 1).
pref(32, 267, 1 , 1).
pref(-1, 268, 10, 1).
pref(32, 268, 0 , 1).
pref(38, 268, 1 , 1).
pref(39, 268, 1 , 1).
pref(44, 268, 1 , 1).
pref(40, 268, 1 , 1).
pref(46, 268, 1 , 1).
pref(42, 268, 1 , 1).
pref(31, 268, 1 , 1).
pref(48, 268, 1 , 1).
pref(29, 268, 1 , 1).
pref(49, 268, 1 , 1).
pref(35, 268, 1 , 1).
pref(30, 268, 1 , 1).
pref(-1, 269, 10, 1).
pref(48, 269, 0 , 1).
pref(30, 269, 1 , 1).
pref(35, 269, 1 , 1).
pref(40, 269, 1 , 1).
pref(49, 269, 1 , 1).
pref(42, 269, 1 , 1).
pref(46, 269, 1 , 1).
pref(-1, 270, 10, 1).
pref(44, 270, 0 , 1).
pref(40, 270, 1 , 1).
pref(32, 270, 1 , 1).
pref(39, 270, 1 , 1).
pref(29, 270, 1 , 1).
pref(42, 270, 1 , 1).
pref(38, 270, 1 , 1).
pref(49, 270, 1 , 1).
pref(46, 270, 1 , 1).
pref(31, 270, 1 , 1).
pref(48, 270, 1 , 1).
pref(30, 270, 1 , 1).
pref(35, 270, 1 , 1).
pref(-1, 271, 10, 1).
pref(29, 271, 0 , 1).
pref(35, 271, 1 , 1).
pref(39, 271, 1 , 1).
pref(38, 271, 1 , 1).
pref(31, 271, 1 , 1).
pref(40, 271, 1 , 1).
pref(44, 271, 1 , 1).
pref(48, 271, 1 , 1).
pref(32, 271, 1 , 1).
pref(46, 271, 1 , 1).
pref(49, 271, 1 , 1).
pref(30, 271, 1 , 1).
pref(42, 271, 1 , 1).
pref(-1, 272, 10, 1).
pref(30, 272, 0 , 1).
pref(38, 272, 1 , 1).
pref(39, 272, 1 , 1).
pref(32, 272, 1 , 1).
pref(40, 272, 1 , 1).
pref(31, 272, 1 , 1).
pref(48, 272, 1 , 1).
pref(35, 272, 1 , 1).
pref(44, 272, 1 , 1).
pref(49, 272, 1 , 1).
pref(29, 272, 1 , 1).
pref(42, 272, 1 , 1).
pref(46, 272, 1 , 1).
pref(-1, 273, 10, 1).
pref(49, 273, 0 , 1).
pref(40, 273, 1 , 1).
pref(48, 273, 1 , 1).
pref(35, 273, 1 , 1).
pref(42, 273, 1 , 1).
pref(30, 273, 1 , 1).
pref(46, 273, 1 , 1).
pref(-1, 275, 10, 1).
pref(45, 275, 0 , 1).
pref(44, 275, 1 , 1).
pref(42, 275, 1 , 1).
pref(38, 275, 1 , 1).
pref(30, 275, 1 , 1).
pref(35, 275, 1 , 1).
pref(46, 275, 1 , 1).
pref(48, 275, 1 , 1).
pref(40, 275, 1 , 1).
pref(31, 275, 1 , 1).
pref(29, 275, 1 , 1).
pref(32, 275, 1 , 1).
pref(39, 275, 1 , 1).
pref(49, 275, 1 , 1).
pref(-1, 276, 10, 1).
pref(45, 276, 0 , 1).
pref(32, 276, 1 , 1).
pref(38, 276, 1 , 1).
pref(31, 276, 1 , 1).
pref(29, 276, 1 , 1).
pref(39, 276, 1 , 1).
pref(42, 276, 1 , 1).
pref(44, 276, 1 , 1).
pref(46, 276, 1 , 1).
pref(40, 276, 1 , 1).
pref(35, 276, 1 , 1).
pref(48, 276, 1 , 1).
pref(49, 276, 1 , 1).
pref(30, 276, 1 , 1).
pref(-1, 277, 10, 1).
pref(44, 277, 0 , 1).
pref(49, 277, 1 , 1).
pref(40, 277, 1 , 1).
pref(38, 277, 1 , 1).
pref(32, 277, 1 , 1).
pref(29, 277, 1 , 1).
pref(48, 277, 1 , 1).
pref(35, 277, 1 , 1).
pref(46, 277, 1 , 1).
pref(-1, 278, 10, 1).
pref(35, 278, 0 , 1).
pref(32, 278, 1 , 1).
pref(44, 278, 1 , 1).
pref(29, 278, 1 , 1).
pref(30, 278, 1 , 1).
pref(31, 278, 1 , 1).
pref(40, 278, 1 , 1).
pref(49, 278, 1 , 1).
pref(39, 278, 1 , 1).
pref(46, 278, 1 , 1).
pref(42, 278, 1 , 1).
pref(48, 278, 1 , 1).
pref(38, 278, 1 , 1).
pref(-1, 281, 10, 1).
pref(40, 281, 0 , 1).
pref(42, 281, 1 , 1).
pref(49, 281, 1 , 1).
pref(30, 281, 1 , 1).
pref(31, 281, 1 , 1).
pref(39, 281, 1 , 1).
pref(44, 281, 1 , 1).
pref(32, 281, 1 , 1).
pref(35, 281, 1 , 1).
pref(38, 281, 1 , 1).
pref(48, 281, 1 , 1).
pref(29, 281, 1 , 1).
pref(46, 281, 1 , 1).
pref(-1, 282, 10, 1).
pref(35, 282, 0 , 1).
pref(38, 282, 1 , 1).
pref(48, 282, 1 , 1).
pref(46, 282, 1 , 1).
pref(49, 282, 1 , 1).
pref(32, 282, 1 , 1).
pref(44, 282, 1 , 1).
pref(40, 282, 1 , 1).
pref(29, 282, 1 , 1).
pref(-1, 284, 10, 1).
pref(38, 284, 0 , 1).
pref(-1, 285, 10, 1).
pref(44, 285, 0 , 1).
pref(43, 285, 0 , 1).
pref(42, 285, 1 , 1).
pref(-1, 286, 10, 1).
pref(44, 286, 0 , 1).
pref(42, 286, 1 , 1).
pref(39, 286, 1 , 1).
pref(32, 286, 1 , 1).
pref(30, 286, 1 , 1).
pref(38, 286, 1 , 1).
pref(40, 286, 1 , 1).
pref(49, 286, 1 , 1).
pref(35, 286, 1 , 1).
pref(29, 286, 1 , 1).
pref(46, 286, 1 , 1).
pref(48, 286, 1 , 1).
pref(31, 286, 1 , 1).
pref(-1, 287, 10, 1).
pref(40, 287, 0 , 1).
pref(30, 287, 1 , 1).
pref(48, 287, 1 , 1).
pref(35, 287, 1 , 1).
pref(42, 287, 1 , 1).
pref(46, 287, 1 , 1).
pref(49, 287, 1 , 1).
pref(-1, 288, 10, 1).
pref(30, 288, 0 , 1).
pref(40, 288, 1 , 1).
pref(31, 288, 1 , 1).
pref(32, 288, 1 , 1).
pref(38, 288, 1 , 1).
pref(48, 288, 1 , 1).
pref(29, 288, 1 , 1).
pref(35, 288, 1 , 1).
pref(39, 288, 1 , 1).
pref(46, 288, 1 , 1).
pref(49, 288, 1 , 1).
pref(42, 288, 1 , 1).
pref(44, 288, 1 , 1).
pref(-1, 289, 10, 1).
pref(46, 289, 0 , 1).
pref(44, 289, 1 , 1).
pref(30, 289, 1 , 1).
pref(40, 289, 1 , 1).
pref(31, 289, 1 , 1).
pref(39, 289, 1 , 1).
pref(49, 289, 1 , 1).
pref(35, 289, 1 , 1).
pref(32, 289, 1 , 1).
pref(38, 289, 1 , 1).
pref(42, 289, 1 , 1).
pref(29, 289, 1 , 1).
pref(48, 289, 1 , 1).
pref(-1, 290, 10, 1).
pref(32, 290, 0 , 1).
pref(46, 290, 1 , 1).
pref(35, 290, 1 , 1).
pref(29, 290, 1 , 1).
pref(49, 290, 1 , 1).
pref(44, 290, 1 , 1).
pref(48, 290, 1 , 1).
pref(40, 290, 1 , 1).
pref(38, 290, 1 , 1).
pref(-1, 291, 10, 1).
pref(45, 291, 0 , 1).
pref(32, 291, 1 , 1).
pref(29, 291, 1 , 1).
pref(49, 291, 1 , 1).
pref(35, 291, 1 , 1).
pref(40, 291, 1 , 1).
pref(48, 291, 1 , 1).
pref(46, 291, 1 , 1).
pref(44, 291, 1 , 1).
pref(38, 291, 1 , 1).
pref(-1, 292, 10, 1).
pref(46, 292, 0 , 1).
pref(49, 292, 1 , 1).
pref(40, 292, 1 , 1).
pref(42, 292, 1 , 1).
pref(35, 292, 1 , 1).
pref(48, 292, 1 , 1).
pref(30, 292, 1 , 1).
pref(-1, 293, 10, 1).
pref(49, 293, 0 , 1).
pref(39, 293, 1 , 1).
pref(32, 293, 1 , 1).
pref(30, 293, 1 , 1).
pref(44, 293, 1 , 1).
pref(48, 293, 1 , 1).
pref(29, 293, 1 , 1).
pref(40, 293, 1 , 1).
pref(31, 293, 1 , 1).
pref(35, 293, 1 , 1).
pref(42, 293, 1 , 1).
pref(38, 293, 1 , 1).
pref(46, 293, 1 , 1).
pref(-1, 294, 10, 1).
pref(29, 294, 0 , 1).
pref(34, 294, 1 , 1).
pref(-1, 295, 10, 1).
pref(38, 295, 0 , 1).
pref(31, 295, 1 , 1).
pref(29, 295, 1 , 1).
pref(42, 295, 1 , 1).
pref(30, 295, 1 , 1).
pref(49, 295, 1 , 1).
pref(32, 295, 1 , 1).
pref(46, 295, 1 , 1).
pref(39, 295, 1 , 1).
pref(44, 295, 1 , 1).
pref(35, 295, 1 , 1).
pref(48, 295, 1 , 1).
pref(40, 295, 1 , 1).
pref(-1, 296, 10, 1).
pref(38, 296, 0 , 1).
pref(46, 296, 1 , 1).
pref(49, 296, 1 , 1).
pref(35, 296, 1 , 1).
pref(48, 296, 1 , 1).
pref(32, 296, 1 , 1).
pref(29, 296, 1 , 1).
pref(44, 296, 1 , 1).
pref(40, 296, 1 , 1).
pref(-1, 297, 10, 1).
pref(49, 297, 0 , 1).
pref(44, 297, 1 , 1).
pref(38, 297, 1 , 1).
pref(46, 297, 1 , 1).
pref(32, 297, 1 , 1).
pref(40, 297, 1 , 1).
pref(35, 297, 1 , 1).
pref(48, 297, 1 , 1).
pref(29, 297, 1 , 1).
pref(-1, 298, 10, 1).
pref(30, 298, 0 , 1).
pref(48, 298, 1 , 1).
pref(29, 298, 1 , 1).
pref(38, 298, 1 , 1).
pref(35, 298, 1 , 1).
pref(40, 298, 1 , 1).
pref(49, 298, 1 , 1).
pref(46, 298, 1 , 1).
pref(32, 298, 1 , 1).
pref(44, 298, 1 , 1).
pref(-1, 300, 10, 1).
pref(35, 300, 0 , 1).
pref(32, 300, 1 , 1).
pref(48, 300, 1 , 1).
pref(49, 300, 1 , 1).
pref(40, 300, 1 , 1).
pref(29, 300, 1 , 1).
pref(46, 300, 1 , 1).
pref(44, 300, 1 , 1).
pref(38, 300, 1 , 1).
pref(-1, 301, 10, 1).
pref(49, 301, 0 , 1).
pref(29, 301, 1 , 1).
pref(35, 301, 1 , 1).
pref(38, 301, 1 , 1).
pref(46, 301, 1 , 1).
pref(44, 301, 1 , 1).
pref(48, 301, 1 , 1).
pref(40, 301, 1 , 1).
pref(32, 301, 1 , 1).
pref(-1, 302, 10, 1).
pref(48, 302, 0 , 1).
pref(39, 302, 1 , 1).
pref(46, 302, 1 , 1).
pref(49, 302, 1 , 1).
pref(38, 302, 1 , 1).
pref(35, 302, 1 , 1).
pref(42, 302, 1 , 1).
pref(44, 302, 1 , 1).
pref(32, 302, 1 , 1).
pref(31, 302, 1 , 1).
pref(30, 302, 1 , 1).
pref(29, 302, 1 , 1).
pref(40, 302, 1 , 1).
pref(-1, 303, 10, 1).
pref(39, 303, 0 , 1).
pref(40, 303, 1 , 1).
pref(44, 303, 1 , 1).
pref(48, 303, 1 , 1).
pref(29, 303, 1 , 1).
pref(35, 303, 1 , 1).
pref(31, 303, 1 , 1).
pref(46, 303, 1 , 1).
pref(32, 303, 1 , 1).
pref(49, 303, 1 , 1).
pref(30, 303, 1 , 1).
pref(38, 303, 1 , 1).
pref(42, 303, 1 , 1).
pref(-1, 304, 10, 1).
pref(46, 304, 0 , 1).
pref(49, 304, 1 , 1).
pref(40, 304, 1 , 1).
pref(30, 304, 1 , 1).
pref(42, 304, 1 , 1).
pref(35, 304, 1 , 1).
pref(48, 304, 1 , 1).
pref(-1, 305, 10, 1).
pref(34, 305, 0 , 1).
pref(40, 305, 1 , 1).
pref(42, 305, 1 , 1).
pref(38, 305, 1 , 1).
pref(46, 305, 1 , 1).
pref(44, 305, 1 , 1).
pref(49, 305, 1 , 1).
pref(48, 305, 1 , 1).
pref(32, 305, 1 , 1).
pref(30, 305, 1 , 1).
pref(29, 305, 1 , 1).
pref(35, 305, 1 , 1).
pref(31, 305, 1 , 1).
pref(39, 305, 1 , 1).
pref(-1, 307, 10, 1).
pref(-1, 308, 10, 1).
pref(30, 308, 0 , 1).
pref(42, 308, 1 , 1).
pref(49, 308, 1 , 1).
pref(46, 308, 1 , 1).
pref(29, 308, 1 , 1).
pref(38, 308, 1 , 1).
pref(44, 308, 1 , 1).
pref(31, 308, 1 , 1).
pref(39, 308, 1 , 1).
pref(32, 308, 1 , 1).
pref(35, 308, 1 , 1).
pref(40, 308, 1 , 1).
pref(48, 308, 1 , 1).
pref(-1, 309, 10, 1).
pref(49, 309, 0 , 1).
pref(35, 309, 1 , 1).
pref(40, 309, 1 , 1).
pref(48, 309, 1 , 1).
pref(44, 309, 1 , 1).
pref(38, 309, 1 , 1).
pref(29, 309, 1 , 1).
pref(30, 309, 1 , 1).
pref(31, 309, 1 , 1).
pref(42, 309, 1 , 1).
pref(46, 309, 1 , 1).
pref(32, 309, 1 , 1).
pref(39, 309, 1 , 1).
pref(-1, 311, 10, 1).
pref(46, 311, 0 , 1).
pref(29, 311, 1 , 1).
pref(40, 311, 1 , 1).
pref(48, 311, 1 , 1).
pref(32, 311, 1 , 1).
pref(49, 311, 1 , 1).
pref(44, 311, 1 , 1).
pref(38, 311, 1 , 1).
pref(35, 311, 1 , 1).
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