-module(remote_translate).
-export([client/1, server/0]).

client(Word) ->
    SomeHostInNet = "localhost", % to make it runnable on one machine
    {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5678, 
                                 [binary, {packet, 0}]),
    ok = gen_tcp:send(Sock, Word),
    
    ok = gen_tcp:close(Sock).
    
server() ->
    {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, 
                                        {active, false}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Msg} = do_recv(Sock, []),
    gen_tcp:send(Sock, Msg),
    ok = gen_tcp:close(Sock),
    server().

do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, process(list_to_binary(Bs))}
    end.
    
process(Word) ->
    case Word of
        "casa" -> "house";
        "blanca" -> "white";
        _ -> "I dont' understand."
    end.