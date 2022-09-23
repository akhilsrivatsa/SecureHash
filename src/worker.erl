%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Sept 2022 4:40 PM
%%%-------------------------------------------------------------------
-module(worker).
-author("akhil").

%% API
-import(string,[concat/2]).
-export([parent_actor/0, spawn_child_actors/0]).
-define( UFID,"akhilsrivatsa;").


generateRandomString() -> base64:encode(crypto:strong_rand_bytes(8)).

mine_coins(LeadingZeroes, Parent) ->
  %io:format("Mine in progress ~n"),

  Rand_str = generateRandomString(),
  Hash_input = concat([?UFID],Rand_str),
  Hash_output  = [element(C+1, {$0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$a,$b,$c,$d,$e,$f}) || <<C:4>> <= crypto:hash(sha256,Hash_input)],
  Sub_str = string:sub_string(Hash_output, 1, LeadingZeroes),
  Zero_str = string:right("", LeadingZeroes, $0),
  if
    (Sub_str == Zero_str) ->
      Parent ! {hash_found, Hash_output, self(), LeadingZeroes};
    true ->  mine_coins(LeadingZeroes, Parent)
  end.


spawn_child_actors() ->
  receive {LeadingZeroes, Parent} ->
    mine_coins(LeadingZeroes, Parent),
    spawn_child_actors()
  end.

%Purpose is to supervise all child actors. Child actors do the mining and return the hashed strings.
parent_actor() ->
  receive
    {LeadingZeroes, Sender} ->
      Sender,  % Remove this line, added only to get rid of compilation error
      lists:foreach(
        fun(_) ->
          PID = spawn(?MODULE, spawn_child_actors, []),
          erlang:monitor(process, PID),    %% Parent acts as a supervisor and monitors its childs.
          PID ! {LeadingZeroes, self()}
        end, lists:seq(1, 1)),
      parent_actor();

    {hash_found, Hash_output, Sender, LeadingZeroes} ->
      server_event_listener_process ! {print_output_event, Hash_output, Sender},
      Sender ! {LeadingZeroes, self()},
      parent_actor()
  end.

