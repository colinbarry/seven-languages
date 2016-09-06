-module(day2).
-export([find/2,
        readBoard/1]).

%% Write a function that accepts the list and a keyword and returns the associated values for the keyword.
%% run with:                     
%% day2:find([{erlang, "a functional language"}, {ruby, "an OO language"}], erlang).
find(List, Keyword) ->  [{_, Val}|_] = lists:filter(fun({Key, _}) -> Key == Keyword end, List),
                        Val.
                        



%% Write a list comprehension that builds a list of items.
%% [{Product, Price * Quantity} || {Product, Quantity, Price} <- [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}]].


%% Write a program that reads a tic-tac-toe board...
%% readBoard accepts a list of size 9, where each element is either o, x, or empty.
readBoard([C0, C1, C2, C3, C4, C5, C6, C7, C8]) ->
    if 
        C0 /= empty, C0 == C1, C1 == C2 -> C0;
        C3 /= empty, C3 == C4, C4 == C5 -> C3;
        C6 /= empty, C6 == C7, C7 == C8 -> C6;
        C0 /= empty, C0 == C3, C3 == C6 -> C0;
        C1 /= empty, C1 == C4, C4 == C7 -> C1;
        C2 /= empty, C2 == C5, C5 == C8 -> C2;
        C0 /= empty, C0 == C4, C4 == C8 -> C0;
        C2 /= empty, C2 == C4, C4 == C6 -> C2;
        
        C0 /= empty, C1 /= empty, C2 /= empty,
        C3 /= empty, C4 /= empty, C5 /= empty,
        C6 /= empty, C7 /= empty, C8 /= empty -> cat;
        
        true -> no_winner
    end.
    