%% I interpreted "Make the Doctor process restart itself if it should die" as to mean 
%% "Make the Doctor process restart if it should die."

-module(doctor).
-behaviour(supervisor).

-export([start_link/0, init/1, terminate/0]).

start_link() ->
    supervisor:start_link(doctor, []).
    
init(_) ->
    {ok, {{one_for_one, 60, 60}, 
    [{roulette, {roulette, start_link, []}, permanent, 5000, worker, [roulette]}]}}.
    
terminate() ->
    supervisor:terminate("doctor terminated", terminated).
    