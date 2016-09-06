% Solve the Eight Queens problem by taking a list of queens. Rather than a tuple, represent each queen
% with an integer from 1-8. Get the row of a queen by its position in the list and the column by the
% value in the list.

uniqueColumns(List) :-
    fd_all_different(List).

% cellSum(list, rowNumber, accumulator, results)
cellSum([], _, Acc, Acc).
cellSum([H|T], Row, Acc, Results) :-
    Sum is Row + H,
    Row2 is Row + 1,
    cellSum(T, Row2, [Sum|Acc], Results).
        
uniqueSum(Solution) :-
    cellSum(Solution, 1, [], Sums),
    fd_all_different(Sums).
    
% cellDifference(list, rowNumber, accumulator, results)
cellDifference([], _, Acc, Acc).
cellDifference([H|T], Row, Acc, Results) :-
    Diff is Row - H,
    Row2 is Row + 1,
    cellDifference(T, Row2, [Diff|Acc], Results).
    
uniqueDifference(Solution) :-
    cellDifference(Solution, 1, [], Diffs),
    fd_all_different(Diffs).

queens(Solution) :-
    length(Solution, 8),
    fd_domain(Solution, 1, 8),
    uniqueColumns(Solution),
    fd_labeling(Solution),
    uniqueSum(Solution),
    uniqueDifference(Solution).