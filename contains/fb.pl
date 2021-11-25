contains(r0,r1).
contains(r0,r2).
contains(r0,r3).
contains(r0,r4).

contains(r1,r2).
contains(r1,r3).
contains(r1,r4).

contains(r2,r3).
contains(r2,r4).

contains(r3,r4).

%% transitive_contains(X,Y):-
%%     contains(X,Y),
%%     X \= Y.

%% transitive_contains(X,Z):-
%%     contains(X,Y),
%%     \+ contains(X,Z),
%%     transitive_contains(Y,Z).

indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.
indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    \+ contains(A,Y),
    indirect_contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.

set_indirect_contains(Set):-
    setof([G,H],indirect_contains(G,H),Set).

set_contains(Set):-
    setof([J,K],contains(J,K),Set).

direct_contains(Direct):-
    set_indirect_contains(Indirect),
    set_contains(All),
    subtract(All,Indirect,Direct).
