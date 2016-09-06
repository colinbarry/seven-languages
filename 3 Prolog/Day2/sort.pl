% Sort the elements of a list.

insertSort([], []).

insertSort([H|T], Sorted) :-
    insertSort(T, List),
    addInPlace(H, List, Sorted).

addInPlace(Val, [], [Val]).

addInPlace(Val, [H|T], Result) :-
    Val =< H,
    Result = [Val, H | T].
    
addInPlace(Val, [H|T], Result) :-
    Val > H,
    addInPlace(Val, T, R),
    Result = [H|R].


