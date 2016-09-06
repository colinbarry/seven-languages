-module(supersuperdoctor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link(supersuperdoctor, []).
    
init(_) ->
    {ok, {{one_for_one, 60, 60}, 
    [{superdoctor, {superdoctor, start_link, []}, permanent, 5000, supervisor, [superdoctor]}]}}.
