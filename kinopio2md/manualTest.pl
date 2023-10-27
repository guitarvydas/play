:- use_module(library(ugraphs)).

text(nT, 'T').
text(nU, 'U').
text(nV, 'V').
text(nW, 'W').
text(nX, 'X').
text(nY, 'Y').
text(nZ, 'Z').

parent(nU, nT).
parent(nX, nT).
parent(nV, nU).
parent(nY, nX).
parent(nW, nV).
parent(nZ, nW).

main :-
    top_sort([nT-[nU,nX],nU-[nV],nV-[nW],nW-[nZ],nX-[nY],nY-[],nZ-[]],L),
    printText(L).

printText([H|T]):-
    text(H,Text),
    write(Text),
    nl,
    printText(T).

printText([]).
