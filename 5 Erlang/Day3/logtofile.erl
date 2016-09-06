-module(logtofile).
-behaviour(gen_server).
-export([start_link/0, init/1, code_change/3, handle_call/3, handle_cast/2, handle_info/2, terminate/2, log/2]).

start_link() ->
    gen_server:start_link({local, logtofile}, logtofile, [], []).

init([]) -> 
    {ok, File} = file:open("log.txt", [append]),
    {ok, File}.
    
handle_call(Msg, _From, File) ->
    io:format(File, "~p~n", [Msg]),
    {reply, ok, File}.
        
handle_cast(_, State) -> {reply, State}.

handle_info(_, State) -> {reply, State}.

code_change(_, State, _) -> {ok, State}.

terminate(Reason, _) -> io:format("logtofile stopping: ~p~n", [Reason]).

log(Pid, Msg) -> gen_server:call(Pid, Msg).

% {ok, Pid} = logtofile:start_link().
% logtofile:log(Pid, "alfa").
% logtofile:log(Pid, "bravo").
% logtofile:log(Pid, "charlie").
