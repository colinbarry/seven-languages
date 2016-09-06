-module(remote_translator).
-compile(export_all).

start_server(Port) ->
    Pid = spawn_link(fun() ->
        {ok, Listen} = gen_tcp:listen(Port, [binary, {active, false}]),
        spawn(fun() -> acceptor(Listen) end),
        timer:sleep(infinity)
    end),
    {ok, Pid}.

acceptor(ListenSocket) ->
    {ok, Socket} = gen_tcp:accept(ListenSocket),
    spawn(fun() -> acceptor(ListenSocket) end),
    handle(Socket).

handle(Socket) ->
    inet:setopts(Socket, [{active, once}]),
    receive
        {tcp, Socket, <<"quit", _/binary>>} ->
            gen_tcp:close(Socket);
        {tcp, Socket, Msg} ->
            gen_tcp:send(Socket, translate(strip(Msg)) ++ "\r\n"),
            handle(Socket)
    end.
    
    
translate(Word) ->
    io:format("received: ~p~n", [Word]),
    case Word of
        "casa" -> "house";
        "blanca" -> "white";
        _ -> "I dont' understand."
    end.
    
strip(Data) ->
    binary:bin_to_list(Data, {0, byte_size(Data) - 2}).