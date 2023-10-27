:- use_module(library(ugraphs)).

text(nT, 'control flow is not data').
text(nU, 'control flow is _interpretation_ of data - dynamic flow').
text(nV, 'a CPU is an interpreter').
text(nW, 'a CPU interprets _opcodes_').
text(nX, 'data is _static_ - and is not interpreted by the underlying system').
text(nY, 'static data is interpreted by the _program_, not the CPU').
text(nZ, 'a CPU interprets _opcodes_ so quickly that we think of it as something other than interpretation').
%% text(nT, 'T').
%% text(nU, 'U').
%% text(nV, 'V').
%% text(nW, 'W').
%% text(nX, 'X').
%% text(nY, 'Y').
%% text(nZ, 'Z').

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
