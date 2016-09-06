-module(day1).
-export([   count_words/1,
            count_to_ten/0,
            print_result/1]).


%% Write a function that use recursion to return the number of words in a string.
count_elements([]) -> 0;
count_elements([_|T]) -> 1 + count_elements(T).

count_words(S) -> count_elements(string:tokens(S, " ")).


%% Write a function that uses recursion to count to ten.
inner_count_to_ten(10) -> ok;
inner_count_to_ten(N) ->
    M = N + 1,
    io:format("~w~n", [M]),
    inner_count_to_ten(M).

count_to_ten() -> inner_count_to_ten(0).


%% Write a function that uses matching to selectively print "success" or "error: message" given input
%% of the form {error, Message} or success.
print_result(success) -> io:format("success~n");
print_result({error, Message}) -> io:format("error: ~s~n", [Message]).
