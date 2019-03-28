/*****************************************************************************

		Copyright (c) VARD

 Project:  LAB2
 FileName: LAB2.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab2.inc"

domains
charlist = char* 
stringlist = string*

predicates
count(string, char, integer)
split_string(string, stringlist)
nondeterm last_word(string, string)
nondeterm last(stringlist, string)

clauses
count("", _, 0) :- !.
count(Str, Chr, Count) :- frontchar(Str, Sml, Tail), Sml = Chr,
	!, count(Tail, Chr, K), Count = K + 1;
	!, frontchar(Str, _, Tail), count(Tail, Chr, Count).

split_string("", []) :- !.
split_string(".", []) :- !.
split_string("!", []) :- !.
split_string("?", []) :- !.
split_string(Str, [I|J]) :- fronttoken(Str, I, Tail), split_string(Tail, J).

last([X], Token) :- Token = X.
last([_|Tail], Token) :- last(Tail, Token).

last_word(Str, Token) :- split_string(Str, List), last(List, Token).

goal
readln(Str), last_word(Str, Token), count(Token, 'a', Count),
	write("Count = ", Count, "\n").

