%%%-------------------------------------------------------------------
%%% @author mayur
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Sept 2022 5:01 PM
%%%-------------------------------------------------------------------
-module(server).
-author("mayur").

%% API
-export([start/0, print_output_events/3, accept_state/2]).
-define(PORT, 9000).

%Actively listen to all server events.
print_output_events(UserInput, Instance, IP_address) ->
  receive
    {print_output_event, HashString, ActorId} ->
      {Total_Wallclock_Time, Wallclock_Time_Since_Last_Call} = statistics(wall_clock),
      {Total_Run_Time, Time_Since_Last_Call} = statistics(runtime),
      {Total_Wallclock_TimeN, Wallclock_Time_Since_Last_CallN} = {Total_Wallclock_Time + 1, Wallclock_Time_Since_Last_Call + 1},
      {Total_Run_TimeN, Time_Since_Last_CallN} = {Total_Run_Time + 1, Time_Since_Last_Call + 1},
      if
        Instance == "master" -> io:format("Server mined Coin : ~s mined by actor: ~w with performance metrics (since last call) : ~p and (total) : ~p ~n", [HashString, ActorId, Time_Since_Last_CallN / Wallclock_Time_Since_Last_CallN, Total_Run_TimeN / Total_Wallclock_TimeN]);
        true ->
          io:format("Sending Coin to Master ~s with performance metrics (since last call) : ~p and (total) : ~p ~n", [HashString, Time_Since_Last_CallN / Wallclock_Time_Since_Last_CallN, Total_Run_TimeN / Total_Wallclock_TimeN]),
          {ok, Socket} = gen_tcp:connect(IP_address, ?PORT, [binary,{active, true}]),%Connect to Ip Address of the server
          gen_tcp:send(Socket, HashString)
      end,
      print_output_events(UserInput, Instance, IP_address);

    {print_output_event_client, HashString} ->
      {Total_Wallclock_Time, Wallclock_Time_Since_Last_Call} = statistics(wall_clock),
      {Total_Run_Time, Time_Since_Last_Call} = statistics(runtime),
      {Total_Wallclock_TimeN, Wallclock_Time_Since_Last_CallN} = {Total_Wallclock_Time + 1, Wallclock_Time_Since_Last_Call + 1},
      {Total_Run_TimeN, Time_Since_Last_CallN} = {Total_Run_Time + 1, Time_Since_Last_Call + 1},
      io:format("Server mined Coin : ~s mined by a client with performance metrics (since last call) : ~p and (total) : ~p ~n", [HashString, Time_Since_Last_CallN / Wallclock_Time_Since_Last_CallN, Total_Run_TimeN / Total_Wallclock_TimeN]),
      print_output_events(UserInput, Instance, IP_address)
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
          gen_tcp:send(ASocket, "Hash Received")
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
  {ok, UserInput} = io:read("Enter the input (Number of leading zeros if you are the server or The IP Address of the server if you are the client)"),
  IsInputIPAddress =  lists:member(hd("."), UserInput),
  if
    IsInputIPAddress == false ->
      LeadingZeroes = list_to_integer(UserInput),
      {ok, _} = init_tcp(LeadingZeroes),                    %Init TCP process.
      Pid = spawn(fun() -> print_output_events(LeadingZeroes, "master", "") end),
      register(server_event_listener_process, Pid),
      PID = spawn(worker, parent_actor, []),
      PID ! {LeadingZeroes, self()};

    true->
      {ok, ParsedAddress} = inet:parse_address(UserInput),
      {ok, Socket} = gen_tcp:connect(ParsedAddress, 9000, [binary,{active, true}]),%Connect to Ip Address of the server
      gen_tcp:send(Socket, "New Client Available"),
      receive
        {tcp,Socket,<<LeadingZeroes>>} ->
          io:format("Server sent zeroes to mine = ~w~n",[LeadingZeroes]),

          Pid = spawn(fun() -> print_output_events(LeadingZeroes, "slave", ParsedAddress) end),
          register(server_event_listener_process, Pid),
          PID = spawn(worker, parent_actor, []),
          PID ! {LeadingZeroes, self()},
          gen_tcp:close(Socket)
      end
  end.







