/*****************************************************************************

		Copyright (c) VARD

 Project:  LAB1
 FileName: LAB1.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab1.inc"

global facts
single count (integer) 

domains
list = integer*

Predicates
nondeterm Passenger (integer, integer, real)
nondeterm pas_num (real)
bag_mean (real)
summa (list, real)
mean (list, list, real)
nondeterm Bags

Goal Bags.

Clauses
count(1).
Passenger (1, 1, 15.0).
Passenger (2, 2, 1.6).
Passenger (3, 3, 6.8).
Passenger (4, 1, 5.6).
Passenger (5, 2, 16.5).
Passenger (6, 1, 3.9).

summa ([], 0.0).
summa ([X|Y], S) :- summa (Y, S1), S = S1+X.

mean (L, K, M) :- summa (L, D), summa(K, S), M = D/S.

bag_mean(M):- findall (P1, Passenger(_, _, P1), L1),
	findall (P2, Passenger(_, P2, _), L2),
	mean (L1, L2, M).
	
pas_num (V) :- Passenger(N, P2, P1), bag_mean(M), A = P1/P2, abs(M - A) <= V,
	write("\tномер пасажира : ", N, ", ", "середня вага однієї речі пасажира : ", A, "\n" ), fail.
pas_num (_).

Bags :- bag_mean(M),
	write("Загальна середня вага речей всіх пасажирів :  ", M, ".\n"),
	write("Вага не відріднізняється від середньої більше ніж на 3 : \n"),
	pas_num(3.0).
