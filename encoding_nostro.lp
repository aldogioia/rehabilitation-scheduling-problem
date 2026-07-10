% -------- FACTS --------
% operator(ID,EFF,TYP,MAX,NLP,NL,N,NP,OLP,OL,OP,O,CP,CN,MAC)
operator(1, 19, 1, 6, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0).
operator(2, 14, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0).
operator(3, 28, 0, 6, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0).
operator(4, 12, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1).
operator(5, 36, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4).
operator(6, 31, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5).
operator(7, 30, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3).
operator(8, 35, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4).
operator(9, 11, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1).
operator(10, 10, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2).
operator(-1, 100, 0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100).

% patient(ID,TYP,PAY,AID,MIN)
patient(1, 6, 2, 0, 6).
patient(2, 6, 1, 0, 6).
patient(3, 4, 2, 0, 1).
patient(4, 4, 2, 1, 1).
patient(5, 2, 2, 0, 3).
patient(6, 4, 2, 0, 2).
patient(7, 6, 2, 0, 6).
patient(8, 2, 2, 0, 3).
patient(9, 6, 2, 0, 6).
patient(10, 6, 2, 0, 4).
patient(11, 6, 2, 0, 6).
patient(12, 6, 2, 0, 5).
patient(13, 4, 2, 0, 2).
patient(14, 6, 2, 0, 6).
patient(15, 6, 2, 0, 6).
patient(16, 2, 2, 0, 6).
patient(17, 6, 2, 0, 6).
patient(18, 4, 2, 0, 2).
patient(19, 6, 2, 0, 6).
patient(20, 1, 2, 0, 6).
patient(21, 2, 2, 1, 4).
patient(22, 6, 2, 0, 4).
patient(23, 6, 2, 0, 6).
patient(24, 2, 2, 0, 4).
patient(25, 6, 1, 0, 5).
patient(26, 2, 2, 0, 3).
patient(27, 1, 2, 0, 5).
patient(28, 4, 2, 0, 1).
patient(29, 6, 1, 0, 6).
patient(30, 4, 2, 0, 1).
patient(31, 2, 2, 0, 4).
patient(32, 4, 2, 0, 1).
patient(33, 1, 2, 0, 6).
patient(34, 2, 2, 0, 4).
patient(35, 2, 2, 0, 6).
patient(36, 6, 2, 0, 6).
patient(37, 6, 1, 0, 5).
patient(38, 1, 1, 0, 6).
patient(39, 1, 2, 0, 6).
patient(40, 4, 2, 0, 2).
patient(41, 1, 2, 0, 6).
patient(42, 2, 2, 0, 5).
patient(43, 2, 1, 0, 5).
patient(44, 5, 2, 0, 2).
patient(45, 6, 2, 0, 6).
patient(46, 6, 1, 1, 6).
patient(47, 6, 2, 1, 4).
patient(48, 6, 2, 0, 6).
patient(49, 6, 2, 0, 6).
patient(50, 6, 2, 0, 4).

% session(ID,PAT,MIN,LOC)
session(1, 1, 5, 1).
session(3, 2, 4, 1).
session(5, 3, 1, 1).
session(6, 4, 1, 2).
session(7, 5, 3, 1).
session(8, 6, 1, 1).
session(10, 7, 4, 2).
session(12, 8, 3, 1).
session(13, 9, 3, 1).
session(15, 10, 4, 1).
session(16, 11, 4, 2).
session(18, 12, 5, 2).
session(19, 13, 1, 2).
session(21, 14, 4, 2).
session(23, 15, 4, 2).
session(25, 16, 4, 1).
session(26, 16, 4, 1).
session(27, 17, 4, 2).
session(29, 18, 1, 2).
session(31, 19, 3, 2).
session(33, 20, 4, 2).
session(35, 21, 4, 2).
session(36, 22, 4, 1).
session(37, 23, 4, 1).
session(39, 24, 4, 2).
session(40, 25, 5, 2).
session(41, 26, 3, 1).
session(42, 27, 5, 2).
session(43, 28, 1, 1).
session(44, 29, 3, 2).
session(46, 30, 1, 1).
session(47, 31, 4, 2).
session(48, 32, 1, 1).
session(49, 33, 3, 2).
session(51, 34, 4, 1).
session(52, 35, 3, 1).
session(53, 35, 3, 1).
session(54, 36, 4, 1).
session(55, 36, 5, 1).
session(56, 37, 5, 1).
session(57, 38, 4, 2).
session(59, 39, 5, 2).
session(61, 40, 1, 2).
session(63, 41, 4, 2).
session(65, 42, 5, 2).
session(66, 43, 5, 1).
session(67, 44, 1, 1).
session(69, 45, 4, 1).
session(71, 46, 5, 1).
session(73, 47, 4, 2).
session(74, 48, 4, 2).
session(76, 49, 4, 1).
session(78, 50, 4, 1).

% pref(OPE,PAT,WEI,HAS)
pref(-1, 1, 10, 1).
pref(1, 1, 0, 1).
pref(4, 1, 0, 1).
pref(9, 1, 0, 1).
pref(2, 1, 1, 1).
pref(7, 1, 1, 1).
pref(5, 1, 1, 1).
pref(6, 1, 1, 1).
pref(8, 1, 1, 1).
pref(3, 1, 1, 1).
pref(10, 1, 1, 1).
pref(-1, 2, 10, 1).
pref(8, 2, 0, 1).
pref(4, 2, 0, 1).
pref(6, 2, 0, 1).
pref(2, 2, 0, 1).
pref(5, 2, 0, 1).
pref(1, 2, 0, 1).
pref(10, 2, 0, 1).
pref(3, 2, 0, 1).
pref(9, 2, 0, 1).
pref(7, 2, 0, 1).
pref(-1, 3, 10, 1).
pref(4, 3, 0, 1).
pref(5, 3, 0, 1).
pref(6, 3, 1, 1).
pref(9, 3, 1, 1).
pref(10, 3, 1, 1).
pref(1, 3, 1, 1).
pref(8, 3, 1, 1).
pref(3, 3, 1, 1).
pref(7, 3, 1, 1).
pref(2, 3, 1, 1).
pref(-1, 4, 10, 1).
pref(10, 4, 0, 1).
pref(2, 4, 0, 1).
pref(4, 4, 0, 1).
pref(1, 4, 0, 1).
pref(6, 4, 0, 1).
pref(3, 4, 0, 1).
pref(5, 4, 0, 1).
pref(9, 4, 0, 1).
pref(7, 4, 0, 1).
pref(8, 4, 0, 1).
pref(-1, 5, 10, 0).
pref(5, 5, 0, 0).
pref(3, 5, 0, 0).
pref(7, 5, 0, 0).
pref(1, 5, 0, 0).
pref(2, 5, 0, 0).
pref(6, 5, 0, 0).
pref(10, 5, 0, 0).
pref(9, 5, 0, 0).
pref(8, 5, 0, 0).
pref(-1, 6, 10, 1).
pref(10, 6, 0, 1).
pref(8, 6, 1, 1).
pref(5, 6, 1, 1).
pref(4, 6, 1, 1).
pref(2, 6, 1, 1).
pref(3, 6, 1, 1).
pref(6, 6, 1, 1).
pref(1, 6, 1, 1).
pref(9, 6, 1, 1).
pref(7, 6, 1, 1).
pref(-1, 7, 10, 0).
pref(6, 7, 0, 0).
pref(8, 7, 1, 0).
pref(4, 7, 1, 0).
pref(7, 7, 1, 0).
pref(5, 7, 1, 0).
pref(9, 7, 1, 0).
pref(3, 7, 1, 0).
pref(2, 7, 1, 0).
pref(10, 7, 1, 0).
pref(1, 7, 1, 0).
pref(-1, 8, 10, 1).
pref(10, 8, 0, 1).
pref(7, 8, 1, 1).
pref(5, 8, 1, 1).
pref(2, 8, 1, 1).
pref(1, 8, 1, 1).
pref(9, 8, 1, 1).
pref(3, 8, 1, 1).
pref(8, 8, 1, 1).
pref(6, 8, 1, 1).
pref(-1, 9, 10, 0).
pref(7, 9, 0, 0).
pref(8, 9, 0, 0).
pref(6, 9, 0, 0).
pref(5, 9, 0, 0).
pref(3, 9, 0, 0).
pref(-1, 10, 10, 1).
pref(7, 10, 0, 1).
pref(1, 10, 0, 1).
pref(10, 10, 0, 1).
pref(3, 10, 0, 1).
pref(9, 10, 0, 1).
pref(6, 10, 0, 1).
pref(8, 10, 0, 1).
pref(2, 10, 0, 1).
pref(5, 10, 0, 1).
pref(-1, 11, 10, 0).
pref(5, 11, 0, 0).
pref(9, 11, 1, 0).
pref(10, 11, 1, 0).
pref(3, 11, 1, 0).
pref(8, 11, 1, 0).
pref(4, 11, 1, 0).
pref(6, 11, 1, 0).
pref(1, 11, 1, 0).
pref(7, 11, 1, 0).
pref(2, 11, 1, 0).
pref(-1, 12, 10, 1).
pref(5, 12, 0, 1).
pref(7, 12, 0, 1).
pref(9, 12, 0, 1).
pref(6, 12, 0, 1).
pref(8, 12, 0, 1).
pref(3, 12, 0, 1).
pref(10, 12, 0, 1).
pref(2, 12, 0, 1).
pref(4, 12, 0, 1).
pref(1, 12, 0, 1).
pref(-1, 13, 10, 0).
pref(1, 13, 0, 0).
pref(9, 13, 0, 0).
pref(5, 13, 0, 0).
pref(3, 13, 0, 0).
pref(2, 13, 0, 0).
pref(8, 13, 0, 0).
pref(10, 13, 0, 0).
pref(7, 13, 0, 0).
pref(4, 13, 0, 0).
pref(6, 13, 0, 0).
pref(-1, 14, 10, 1).
pref(3, 14, 0, 1).
pref(9, 14, 1, 1).
pref(7, 14, 1, 1).
pref(8, 14, 1, 1).
pref(10, 14, 1, 1).
pref(1, 14, 1, 1).
pref(2, 14, 1, 1).
pref(5, 14, 1, 1).
pref(4, 14, 1, 1).
pref(6, 14, 1, 1).
pref(-1, 15, 10, 1).
pref(6, 15, 0, 1).
pref(3, 15, 1, 1).
pref(4, 15, 1, 1).
pref(1, 15, 1, 1).
pref(2, 15, 1, 1).
pref(8, 15, 1, 1).
pref(5, 15, 1, 1).
pref(7, 15, 1, 1).
pref(10, 15, 1, 1).
pref(9, 15, 1, 1).
pref(-1, 16, 10, 1).
pref(1, 16, 0, 1).
pref(9, 16, 1, 1).
pref(2, 16, 1, 1).
pref(10, 16, 1, 1).
pref(4, 16, 1, 1).
pref(5, 16, 1, 1).
pref(8, 16, 1, 1).
pref(3, 16, 1, 1).
pref(7, 16, 1, 1).
pref(6, 16, 1, 1).
pref(-1, 17, 10, 1).
pref(4, 17, 0, 1).
pref(2, 17, 0, 1).
pref(7, 17, 0, 1).
pref(8, 17, 0, 1).
pref(1, 17, 0, 1).
pref(10, 17, 0, 1).
pref(9, 17, 0, 1).
pref(6, 17, 0, 1).
pref(5, 17, 0, 1).
pref(3, 17, 0, 1).
pref(-1, 18, 10, 1).
pref(10, 18, 0, 1).
pref(9, 18, 0, 1).
pref(4, 18, 0, 1).
pref(7, 18, 0, 1).
pref(1, 18, 0, 1).
pref(5, 18, 0, 1).
pref(6, 18, 0, 1).
pref(8, 18, 0, 1).
pref(3, 18, 0, 1).
pref(2, 18, 0, 1).
pref(-1, 19, 10, 0).
pref(3, 19, 0, 0).
pref(4, 19, 0, 0).
pref(9, 19, 1, 0).
pref(2, 19, 1, 0).
pref(6, 19, 1, 0).
pref(1, 19, 1, 0).
pref(8, 19, 1, 0).
pref(7, 19, 1, 0).
pref(5, 19, 1, 0).
pref(10, 19, 1, 0).
pref(-1, 20, 10, 1).
pref(3, 20, 0, 1).
pref(4, 20, 0, 1).
pref(10, 20, 0, 1).
pref(7, 20, 1, 1).
pref(5, 20, 1, 1).
pref(6, 20, 1, 1).
pref(8, 20, 1, 1).
pref(-1, 21, 10, 1).
pref(4, 21, 0, 1).
pref(7, 21, 0, 1).
pref(6, 21, 0, 1).
pref(2, 21, 0, 1).
pref(3, 21, 0, 1).
pref(5, 21, 0, 1).
pref(1, 21, 0, 1).
pref(8, 21, 0, 1).
pref(9, 21, 0, 1).
pref(10, 21, 0, 1).
pref(-1, 22, 10, 1).
pref(5, 22, 0, 1).
pref(7, 22, 0, 1).
pref(4, 22, 1, 1).
pref(1, 22, 1, 1).
pref(3, 22, 1, 1).
pref(2, 22, 1, 1).
pref(8, 22, 1, 1).
pref(6, 22, 1, 1).
pref(9, 22, 1, 1).
pref(10, 22, 1, 1).
pref(-1, 23, 10, 0).
pref(2, 23, 0, 0).
pref(10, 23, 0, 0).
pref(6, 23, 0, 0).
pref(3, 23, 0, 0).
pref(8, 23, 0, 0).
pref(1, 23, 0, 0).
pref(5, 23, 0, 0).
pref(4, 23, 0, 0).
pref(7, 23, 0, 0).
pref(9, 23, 0, 0).
pref(-1, 24, 10, 1).
pref(5, 24, 0, 1).
pref(6, 24, 1, 1).
pref(3, 24, 1, 1).
pref(8, 24, 1, 1).
pref(2, 24, 1, 1).
pref(1, 24, 1, 1).
pref(9, 24, 1, 1).
pref(7, 24, 1, 1).
pref(4, 24, 1, 1).
pref(10, 24, 1, 1).
pref(-1, 25, 10, 1).
pref(7, 25, 0, 1).
pref(10, 25, 0, 1).
pref(4, 25, 0, 1).
pref(2, 25, 0, 1).
pref(1, 25, 0, 1).
pref(9, 25, 0, 1).
pref(5, 25, 0, 1).
pref(3, 25, 0, 1).
pref(8, 25, 0, 1).
pref(6, 25, 0, 1).
pref(-1, 26, 10, 1).
pref(4, 26, 0, 1).
pref(9, 26, 0, 1).
pref(3, 26, 0, 1).
pref(6, 26, 0, 1).
pref(10, 26, 0, 1).
pref(2, 26, 0, 1).
pref(5, 26, 0, 1).
pref(1, 26, 0, 1).
pref(8, 26, 0, 1).
pref(7, 26, 0, 1).
pref(-1, 27, 10, 0).
pref(1, 27, 0, 0).
pref(9, 27, 0, 0).
pref(10, 27, 0, 0).
pref(5, 27, 1, 0).
pref(7, 27, 1, 0).
pref(3, 27, 1, 0).
pref(8, 27, 1, 0).
pref(4, 27, 1, 0).
pref(2, 27, 1, 0).
pref(6, 27, 1, 0).
pref(-1, 28, 10, 0).
pref(1, 28, 0, 0).
pref(8, 28, 0, 0).
pref(5, 28, 0, 0).
pref(7, 28, 0, 0).
pref(10, 28, 0, 0).
pref(9, 28, 0, 0).
pref(6, 28, 0, 0).
pref(3, 28, 0, 0).
pref(2, 28, 0, 0).
pref(4, 28, 0, 0).
pref(-1, 29, 10, 0).
pref(7, 29, 0, 0).
pref(9, 29, 0, 0).
pref(4, 29, 1, 0).
pref(8, 29, 1, 0).
pref(5, 29, 1, 0).
pref(3, 29, 1, 0).
pref(6, 29, 1, 0).
pref(-1, 30, 10, 1).
pref(6, 30, 0, 1).
pref(1, 30, 0, 1).
pref(10, 30, 0, 1).
pref(7, 30, 0, 1).
pref(9, 30, 0, 1).
pref(5, 30, 0, 1).
pref(4, 30, 0, 1).
pref(2, 30, 0, 1).
pref(3, 30, 0, 1).
pref(8, 30, 0, 1).
pref(-1, 31, 10, 1).
pref(10, 31, 0, 1).
pref(8, 31, 1, 1).
pref(3, 31, 1, 1).
pref(1, 31, 1, 1).
pref(7, 31, 1, 1).
pref(5, 31, 1, 1).
pref(6, 31, 1, 1).
pref(2, 31, 1, 1).
pref(9, 31, 1, 1).
pref(-1, 32, 10, 0).
pref(7, 32, 0, 0).
pref(9, 32, 0, 0).
pref(1, 32, 1, 0).
pref(6, 32, 1, 0).
pref(5, 32, 1, 0).
pref(4, 32, 1, 0).
pref(8, 32, 1, 0).
pref(2, 32, 1, 0).
pref(3, 32, 1, 0).
pref(10, 32, 1, 0).
pref(-1, 33, 10, 0).
pref(2, 33, 0, 0).
pref(4, 33, 0, 0).
pref(9, 33, 0, 0).
pref(7, 33, 1, 0).
pref(3, 33, 1, 0).
pref(10, 33, 1, 0).
pref(5, 33, 1, 0).
pref(8, 33, 1, 0).
pref(1, 33, 1, 0).
pref(6, 33, 1, 0).
pref(-1, 34, 10, 1).
pref(5, 34, 0, 1).
pref(9, 34, 0, 1).
pref(7, 34, 0, 1).
pref(2, 34, 0, 1).
pref(4, 34, 0, 1).
pref(3, 34, 0, 1).
pref(8, 34, 0, 1).
pref(1, 34, 0, 1).
pref(10, 34, 0, 1).
pref(6, 34, 0, 1).
pref(-1, 35, 10, 1).
pref(8, 35, 0, 1).
pref(9, 35, 0, 1).
pref(10, 35, 1, 1).
pref(5, 35, 1, 1).
pref(2, 35, 1, 1).
pref(6, 35, 1, 1).
pref(1, 35, 1, 1).
pref(7, 35, 1, 1).
pref(4, 35, 1, 1).
pref(3, 35, 1, 1).
pref(-1, 36, 10, 0).
pref(4, 36, 0, 0).
pref(10, 36, 0, 0).
pref(7, 36, 1, 0).
pref(3, 36, 1, 0).
pref(5, 36, 1, 0).
pref(8, 36, 1, 0).
pref(6, 36, 1, 0).
pref(-1, 37, 10, 1).
pref(1, 37, 0, 1).
pref(5, 37, 0, 1).
pref(7, 37, 0, 1).
pref(10, 37, 0, 1).
pref(3, 37, 0, 1).
pref(2, 37, 0, 1).
pref(4, 37, 0, 1).
pref(9, 37, 0, 1).
pref(8, 37, 0, 1).
pref(6, 37, 0, 1).
pref(-1, 38, 10, 1).
pref(7, 38, 0, 1).
pref(4, 38, 1, 1).
pref(8, 38, 1, 1).
pref(5, 38, 1, 1).
pref(10, 38, 1, 1).
pref(6, 38, 1, 1).
pref(3, 38, 1, 1).
pref(2, 38, 1, 1).
pref(1, 38, 1, 1).
pref(9, 38, 1, 1).
pref(-1, 39, 10, 1).
pref(7, 39, 0, 1).
pref(8, 39, 1, 1).
pref(4, 39, 1, 1).
pref(6, 39, 1, 1).
pref(5, 39, 1, 1).
pref(9, 39, 1, 1).
pref(1, 39, 1, 1).
pref(10, 39, 1, 1).
pref(2, 39, 1, 1).
pref(3, 39, 1, 1).
pref(-1, 40, 10, 1).
pref(1, 40, 0, 1).
pref(5, 40, 1, 1).
pref(7, 40, 1, 1).
pref(3, 40, 1, 1).
pref(6, 40, 1, 1).
pref(4, 40, 1, 1).
pref(8, 40, 1, 1).
pref(-1, 41, 10, 0).
pref(10, 41, 0, 0).
pref(5, 41, 1, 0).
pref(3, 41, 1, 0).
pref(8, 41, 1, 0).
pref(1, 41, 1, 0).
pref(2, 41, 1, 0).
pref(9, 41, 1, 0).
pref(6, 41, 1, 0).
pref(7, 41, 1, 0).
pref(-1, 42, 10, 1).
pref(10, 42, 0, 1).
pref(9, 42, 1, 1).
pref(1, 42, 1, 1).
pref(6, 42, 1, 1).
pref(7, 42, 1, 1).
pref(4, 42, 1, 1).
pref(8, 42, 1, 1).
pref(3, 42, 1, 1).
pref(2, 42, 1, 1).
pref(5, 42, 1, 1).
pref(-1, 43, 10, 1).
pref(4, 43, 0, 1).
pref(5, 43, 0, 1).
pref(8, 43, 0, 1).
pref(3, 43, 1, 1).
pref(7, 43, 1, 1).
pref(6, 43, 1, 1).
pref(-1, 44, 10, 1).
pref(10, 44, 0, 1).
pref(5, 44, 0, 1).
pref(9, 44, 0, 1).
pref(7, 44, 0, 1).
pref(6, 44, 0, 1).
pref(3, 44, 0, 1).
pref(1, 44, 0, 1).
pref(8, 44, 0, 1).
pref(2, 44, 0, 1).
pref(4, 44, 0, 1).
pref(-1, 45, 10, 1).
pref(8, 45, 0, 1).
pref(7, 45, 1, 1).
pref(5, 45, 1, 1).
pref(6, 45, 1, 1).
pref(1, 45, 1, 1).
pref(2, 45, 1, 1).
pref(4, 45, 1, 1).
pref(9, 45, 1, 1).
pref(3, 45, 1, 1).
pref(10, 45, 1, 1).
pref(-1, 46, 10, 0).
pref(1, 46, 0, 0).
pref(7, 46, 0, 0).
pref(3, 46, 1, 0).
pref(5, 46, 1, 0).
pref(9, 46, 1, 0).
pref(4, 46, 1, 0).
pref(2, 46, 1, 0).
pref(8, 46, 1, 0).
pref(10, 46, 1, 0).
pref(6, 46, 1, 0).
pref(-1, 47, 10, 1).
pref(3, 47, 0, 1).
pref(7, 47, 0, 1).
pref(6, 47, 0, 1).
pref(9, 47, 0, 1).
pref(1, 47, 0, 1).
pref(8, 47, 0, 1).
pref(2, 47, 0, 1).
pref(10, 47, 0, 1).
pref(5, 47, 0, 1).
pref(-1, 48, 10, 1).
pref(9, 48, 0, 1).
pref(1, 48, 0, 1).
pref(5, 48, 0, 1).
pref(3, 48, 0, 1).
pref(6, 48, 0, 1).
pref(4, 48, 0, 1).
pref(8, 48, 0, 1).
pref(7, 48, 0, 1).
pref(2, 48, 0, 1).
pref(10, 48, 0, 1).
pref(-1, 49, 10, 1).
pref(6, 49, 0, 1).
pref(3, 49, 0, 1).
pref(10, 49, 0, 1).
pref(8, 49, 0, 1).
pref(4, 49, 0, 1).
pref(7, 49, 0, 1).
pref(2, 49, 0, 1).
pref(9, 49, 0, 1).
pref(5, 49, 0, 1).
pref(1, 49, 0, 1).
pref(-1, 50, 10, 1).
pref(8, 50, 0, 1).
pref(5, 50, 1, 1).
pref(6, 50, 1, 1).
pref(4, 50, 1, 1).
pref(3, 50, 1, 1).
pref(7, 50, 1, 1).

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

% --- METRICA A: Burden-Aware Risk Routing (Priorità @2) ---
% Penalizzare l'assegnazione se il ML è incerto (ConfLevel >= 3) 
% e l'operatore reale ha un burden score elevato (> 5).
:~ assignment(OP, PAT, _, _), 
   ml_capacity(OP, PredN, ConfLevel), 
   ConfLevel >= 3,
   operator_burden(OP, BurdenScore), 
   BurdenScore > 5,
   OP != -1. 
   [BurdenScore@2, PAT, OP]

% --- METRICA B: Buffer Contrattuale (Priorità @3 - Massima) ---
% Evitare assegnazioni a massima incertezza (Livello 4) per i part-time (TYP = 1).
:~ assignment(OP, PAT, _, _),
   ml_capacity(OP, PredN, 4),
   operator(OP, _, 1, _, _, _, _, _, _, _, _, _, _, _, _),
   OP != -1.
   [10@3, PAT, OP]

% --- METRICA C: Aderenza Predittiva (Priorità @1) ---
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
    Delta = #abs(Actual - PredN).

% Penalizziamo lo scostamento per forzare l'aderenza del solver all'euristica predittiva.
:~ diff(OP, Delta), Delta > 0, OP != -1.
   [Delta@1, OP]

% -------- DIRECTIVES --------
#show assignment/4.