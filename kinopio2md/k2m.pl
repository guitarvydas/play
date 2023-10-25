:- use_module(library(http/json)).

main :-
    open("out.json", read, In),
    json_read(In, JSON),
    open("swiplout.json", write, Out),
    json_write(Out, JSON).

    
