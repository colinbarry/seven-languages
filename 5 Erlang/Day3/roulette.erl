-module(roulette).
-behaviour(gen_server).
-export([start_link/0, init/1, code_change/3, handle_call/3, handle_cast/2, handle_info/2, terminate/2, spin/2]).

start_link() ->
    gen_server:start_link({local, roulette}, roulette, [], []).

init([]) -> {ok, []}.

handle_call(N, _From, State) ->
    Result = case N of
        3 -> io:format("bang.~n"), terminate("Banged", State);
        _ -> io:format("click.~n")
        end,
    {reply, Result, State}.
        
handle_cast(_, State) -> {reply, State}.

handle_info(_, State) -> {reply, State}.

code_change(_, State, _) -> {ok, State}.

terminate(Reason, _) -> io:format("Roulette stopping: ~p~n", [Reason]).

spin(Pid, Number) -> gen_server:call(Pid, Number).

% {ok, Pid} = roulette:start_link().
% roulette:spin(Pid, 1).
% roulette:spin(Pid, 2).
% roulette:spin(Pid, 3).