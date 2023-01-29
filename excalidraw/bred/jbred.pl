:- use_module(library(http/json)).
    
jbred(J) :-
    open('bred.json',read,Strm),
    json_read(Strm,J),
    close(Strm).
