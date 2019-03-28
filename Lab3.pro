/*****************************************************************************

		Copyright (c) VARD

 Project:  LAB3
 FileName: LAB3.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab3.inc"

domains
intlist = integer*

predicates
delete(integer, intlist, intlist)
nondeterm max(intlist, integer)
nondeterm max(intlist, integer, integer)
nondeterm Delete

goal Delete.

clauses
delete(_,[],[]) :- !.
delete(X, [X|L1], L2) :- !, delete(X, L1, L2). 
delete(X, [H|L1], [H|L2]) :- delete(X, L1, L2).

max([], N, N).
max([X|Xs], WK, N) :- X >  WK, max(Xs, X, N).
max([X|Xs], WK, N) :- X <= WK, max(Xs, WK, N).
max([X|Xs], N) :- max(Xs, X, N).

Delete :- readterm(intlist, Lst), max(Lst, Max), delete(Max, Lst, Res),
	write(Res).