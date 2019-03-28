/*****************************************************************************

		Copyright (c) VARD

 Project:  LAB12
 FileName: LAB12.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "lab12.inc"

Predicates
nondeterm Server (string, string, string)
info (integer)
read_value(integer, string)
select(integer, string)
write_info(string, string, string)
nondeterm Info

Goal Info.

Clauses
Server ("example", "http://example.com", "en").
Server ("dhcp", "192.168.100.100", "ru").
Server ("localhost", "0.0.0.0", "ua").
Server ("http", "localhost:8080", "ua").

info(Index) :- read_value(Index, Value), select(Index, Value).

write_info(Name, Address, Lang) :- write("Name = ", Name, ", Address = ", Address, ", Language = ", Lang, "\n").

read_value(0, Value) :- write("Name = "), readln(Value).
read_value(1, Value) :- write("Address = "), readln(Value).
read_value(2, Value) :- write("Language = "), readln(Value).	

select(0, Value) :- Server(Name, Address, Lang), Name = Value, write_info(Name, Address, Lang), fail.
select(1, Value) :- Server(Name, Address, Lang), Address = Value, write_info(Name, Address, Lang), fail.
select(2, Value) :- Server(Name, Address, Lang), Lang = Value, write_info(Name, Address, Lang), fail.	
select (_,  _).

Info :- info(0), info(1), info(2).