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
-export([start/0, generateHash/1]).

start() ->
  {ok, LeadingZeros} = io:read("Enter the required no.of leading zeros: \n"),
  startMining(1, LeadingZeros).

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
  generateHash(LeadingZeros). %  Used for recursively mining coins.

startMining(1000,LeadingZeros) -> {ok, LeadingZeros};

startMining(Itr, LeadingZeros) ->
  spawn( fun() -> generateHash(LeadingZeros) end),
  startMining(Itr + 1, LeadingZeros).