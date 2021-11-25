contains(r1,r2).
contains(r1,r3).
contains(r1,r4).
contains(r2,r3).
contains(r2,r4).
contains(r3,r4).

transitive_contains(X,Y):-
    contains(X,Y),
    X \= Y.

transitive_contains(X,Z):-
    contains(X,Y),
    \+ contains(X,Z),
    transitive_contains(Y,Z).

indirect_contains(X,Z):-
    contains(X,Y),
    \+ contains(X,Z),
    indirect_contains(Y,Z).
indirect_contains(X,Z):-
    contains(X,Y),
    \+ contains(X,Z),
    contains(Y,Z).
