:- use_module(library(http/json)).
    
test(J) :-
    open('test.json',read,Strm),
    json_read_dict(Strm,J),
    close(Strm),
    open('copy.json',write,Ostrm),
    json_write_dict(Ostrm,J),
    nl(Ostrm),
    close(Ostrm).

