% Finds the smallest element of a list.

smallest([A], A).

smallest([H|T], Result) :-
    smallest(T, TailMin),
    Result is min(H, TailMin).

    