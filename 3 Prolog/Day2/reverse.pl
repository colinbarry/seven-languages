% Reverses the elements of a list.

% solution with append.

rev([], []).
rev([H|T], Result) :-
    rev(T, X),
    append(X, [H], Result).

% Solution with accumlator.
rv([], Acc, Acc).
rv([H|T], Acc, Result) :-
    rv(T, [H|Acc], Result).
    
doreverse(L, R) :-
    rv(L, [], R).