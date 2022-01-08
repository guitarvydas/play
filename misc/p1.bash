#!/bin/bash
temp=temp${RANDOM}
cat >/tmp/${temp} <<'~~~EOF~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("PREFIX/shapes.pl").
?- consult("PREFIX/onSameDiagram.pl").
?- consult("PREFIX/inside.pl").
?- consult("PREFIX/ports.pl").
?- consult("PREFIX/contains.pl").
query_helper(ID,Name):- 
    diagram_fact(vertex,ID,_),
    diagram_fact(value,ID,Name),
    true.
query:-
    bagof([ID,Name],query_helper(ID,Name),Bag),
    json_write(user_output,Bag,[width(128)]).
~~~EOF~~~
sed -E -e 's/PREFIX/./' </tmp/${temp} >${temp}.pl
swipl -g "consult(${temp})." -g 'query.' -g 'halt.'
rm /tmp/${temp}
rm ${temp}.pl
