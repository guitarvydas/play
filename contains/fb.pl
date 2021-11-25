contains(r1,r2).
contains(r1,r3).
contains(r1,r4).
contains(r2,r3).
contains(r2,r4).
contains(r4,r4).

transitive_contains(X,Y):-
    contains(X,Y),
    X \= Y.
