%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Sept 2022 5:01 PM
%%%-------------------------------------------------------------------
-module(server).
-author("akhil").

%% API
-export([start/0, listen_to_server_events/2, accept_state/2]).
-define(PORT, 9000).


%Actively listen to all server events.
listen_to_server_events(UserInput, Instance) ->
  receive
    {print_output_event, HashString, ActorId} ->

      if
        Instance == "master" -> io:format("Server Printing HashValue ~s mined by actor: ~w ~n", [HashString, ActorId] );
        true ->
          io:format("Sending Hash Value to Master ~s ~n", [HashString]),
          {ok, Socket} = gen_tcp:connect({100,64,7,16}, ?PORT, [binary,{active, true}]),%Connect to Ip Address of the server
          gen_tcp:send(Socket, HashString)
      end,
      listen_to_server_events(UserInput, Instance);

    {print_output_event_client, HashString} -> io:format("Server printing HashValue ~s mined by a client ~n",
                                                [HashString]),
      listen_to_server_events(UserInput, Instance)
  end.


handler(ASocket, UserInput) ->
  inet:setopts(ASocket, [{active, once}] ),
  receive
    {tcp, ASocket, BinaryMsg} ->
      if
        (BinaryMsg =:= <<"New Client Available">>) ->
          io:format("Ping received from a client to establish connection ~w ~n", [UserInput]),
          gen_tcp:send(ASocket, [UserInput]);
        true ->
          io:format("Ping received from a client with Hashed String ~s ~n", [BinaryMsg]),
          server_event_listener_process ! {print_output_event_client, BinaryMsg} ,
          gen_tcp:send(ASocket, "Thanks")
      end,
      handler(ASocket, UserInput)
  end.




accept_state(LSocket, UserInput) ->
  io:format("accepting state...."),
  {ok, ASocket} = gen_tcp:accept(LSocket),
  spawn(fun() -> accept_state(LSocket, UserInput) end),
  handler(ASocket, UserInput).


init_tcp(UserInput) ->
  PID =  spawn_link(fun() ->
    {ok, LSocket} = gen_tcp:listen(?PORT, [binary, {active, false}]),
    spawn( fun() -> accept_state(LSocket, UserInput) end),
    timer:sleep(infinity)
             end),
  {ok, PID}.

start() ->

  % Reading input from user %
  {ok, UserInput} = io:read("Enter the input ~n"),
  IsInputIPAddress =  lists:member(hd("."), UserInput),
  if
    IsInputIPAddress == false ->
      LeadingZeroes = list_to_integer(UserInput),
      {ok, Tcp_id} = init_tcp(LeadingZeroes),                    %Init TCP process.
      io:format("My Tcp id ~w ~n", [Tcp_id]),
      Pid = spawn(fun() -> listen_to_server_events(LeadingZeroes, "master") end),
      register(server_event_listener_process, Pid),
      PID = spawn(worker, parent_actor, []),
      PID ! {LeadingZeroes, self()};

    true->
      io:format("Ip Address is ~s ~n", [UserInput]),
      {ok, Socket} = gen_tcp:connect({100,64,7,16}, 9000, [binary,{active, true}]),%Connect to Ip Address of the server
      gen_tcp:send(Socket, "New Client Available"),
      receive
        {tcp,Socket,<<LeadingZeroes>>} ->
          io:format("Server sent zeroes to mine = ~w~n",[LeadingZeroes]),

          Pid = spawn(fun() -> listen_to_server_events(LeadingZeroes, "slave") end),
          register(server_event_listener_process, Pid),
          PID = spawn(worker, parent_actor, []),
          PID ! {LeadingZeroes, self()},
          gen_tcp:close(Socket)
      end
  end.







