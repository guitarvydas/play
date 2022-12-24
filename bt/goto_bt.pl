


% https://towardsdatascience.com/designing-ai-agents-behaviors-with-behavior-trees-b28aa1c3cf8a

%%Reactivity
%% Behavior Trees use the concept of Tick,
%%  a signal that is sent in a fixed frequency,
%%  which starts from the root node and is propagated to its children.
%% By doing this Behavior Trees can react in real-time to events
%%  that happen in the world.

% first solution to:
goto_behaviour_tree :-
    fli_InRoom2
    ;
    enterRoom2.

enterRoom2 :-
    gotoDoor,
    doorOpen,
    fli_EnterTheRoom.

gotoDoor :-
    fli_AtTheDoor
    ;
    fli_MoveToDoor.

DoorOpen :-
    fli_DoorIsOpened
    ; 
    fli_OpenTheDoor.


    
