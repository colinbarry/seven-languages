-module(superdoctor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link(superdoctor, []).
    
init(_) ->
    {ok, {{one_for_one, 60, 60}, 
    [{doctor, {doctor, start_link, []}, permanent, 5000, supervisor, [doctor]}]}}.
