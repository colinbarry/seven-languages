-module(supersupersuperdoctor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link(supersupersuperdoctor, []).
    
init(_) ->
    {ok, {{one_for_one, 60, 60}, 
    [{supersuperdoctor, {supersuperdoctor, start_link, []}, permanent, 5000, supervisor, [supersuperdoctor]}]}}.

% Start the supervisor tree root with:
% {ok, SupervisorRoot} = supersupersuperdoctor:start_link(). 