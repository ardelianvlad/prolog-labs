/*****************************************************************************

		Copyright (c) VARD

 Project:  LAB4
 FileName: LAB4.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

domains
reallist = real*

global domains
file = f; g; m

predicates 
nondeterm wfile
nondeterm Do
nondeterm sum(reallist, reallist, reallist)

goal Do.

clauses
wfile :- readterm(reallist, L), write(L), nl.
	
sum([],[],[]).
sum([H1|T1],[H2|T2],[X|L3]) :- sum(T1,T2,L3), X = H1+H2.	

Do :- openwrite(f,  "C:\\VIP52\\BIN\\WIN\\32\\files\\f.txt"),
		writedevice(f), wfile, closefile(f),
         openwrite(g, "C:\\VIP52\\BIN\\WIN\\32\\files\\g.txt"),
         	writedevice(g), wfile, closefile(g),
         openread(f, "C:\\VIP52\\BIN\\WIN\\32\\files\\f.txt"),
         	readdevice(f), readterm(reallist, X), closefile(f),
        openread(g, "C:\\VIP52\\BIN\\WIN\\32\\files\\g.txt"),
         	readdevice(g), readterm(reallist, Y), closefile(g),
         openwrite(m, "C:\\VIP52\\BIN\\WIN\\32\\files\\m.txt"),
         	writedevice(m), sum(X, Y, R), write(R), nl, closefile(m),
         write("Success").
         
         

