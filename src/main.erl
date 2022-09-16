%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <UF>
%%% @doc
%%%
%%% @end
%%% Created : 05. Sept 2022 11:43 PM
%%%-------------------------------------------------------------------
-module(main).
-author("akhil").

-define( REQUIRED_PROCESSES, 10).
-define( UFID,"akhilsrivatsa;").

-import(string,[concat/2]).
-import('/Users/akhil/projects/dosp/SecureHash/src/Server.erl', [init_server/ 0]).
-behavior(gen_server).
-export([startMining/0]).
-export([code_change/3,
  handle_call/3,
  handle_cast/2,
  handle_info/2,
  init/1,
  terminate/2]).



code_change(_OldVsn, _State, _Extra) ->
  {error, "NYI"}.

handle_call(Name, _From, State) ->
  Reply = lists:flatten(io_lib:format("hello ~s from myserver", [Name])),
  {reply, Reply, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

init(_Args) ->
  process_flag(trap_exit, true),
  io:format("Secure Hash Server has been intialized~n"),
  {ok, LeadingZeros} = io:read("Enter the required no.of leading zeros: \n"),
  spawnMiningActors(1, LeadingZeros).

terminate(_Reason, _State) -> [].

generateRandomString() -> base64:encode(crypto:strong_rand_bytes(8)).  % re:replace(base64:encode(crypto:strong_rand_bytes(8)),"\\W","",[global,{return,binary}]),

checkLeadingZeros([]) -> true;

checkLeadingZeros([H|T]) ->
  if H =:= 48 -> checkLeadingZeros(T);
     true -> false
  end.

generateHash(LeadingZeros) ->

    RandomString = generateRandomString(),
    HashInputString = concat([?UFID],RandomString),
    HashOutputString  = [element(C+1, {$0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$a,$b,$c,$d,$e,$f}) || <<C:4>> <= crypto:hash(sha256,HashInputString)],
    Substring = string:sub_string(HashOutputString, 1, LeadingZeros),
    Result = checkLeadingZeros(Substring),
    if Result -> io:format("Mined String is ~s \n", [HashOutputString]);
         true -> do_nothing
    end,
    generateHash(LeadingZeros).

startMining() ->
  receive{LeadingZeroes} ->
    generateHash(LeadingZeroes)
  end.

spawnMiningActors(100,LeadingZeros) -> {ok, LeadingZeros};

spawnMiningActors(Itr, LeadingZeros) ->
  Pid = spawn(?MODULE, startMining, []),
  Pid ! {LeadingZeros},
  erlang:monitor(process, Pid), c:flush(),
  spawnMiningActors(Itr + 1, LeadingZeros).