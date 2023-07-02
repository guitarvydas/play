on my Mac (MacOS Ventura 13.4)

create file "bubblesort.pl":
```
% this is a straight-forward version
% see link below for other versions
% https://stackoverflow.com/questions/4753663/bubble-sort-in-prolog-language
bubblesort( List, SortedList) :-
    swap( List, List1 ), ! ,
    bubblesort( List1, SortedList) .
bubblesort( List, List).
swap([X,Y|Rest],[Y,X|Rest]) :-
    X > Y,
    !.
swap([Z|Rest],[Z|Rest1]) :-
    swap(Rest,Rest1).

test(Sorted):-
    bubblesort([2, 3, 1],Sorted).
```

- brew install swi-prolog
- swipl
  - ?- consult(bubblesort).
  - ?- test(X).
  - ?- bubblesort([2,3,1,4],X).
  
