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

%checkLeadingZeros(HashedString, LeadingZeroes, idx) ->
 % io:format("Leading Zeroes function called \n").

generateHash(LeadingZeros) ->
  RandomString = generateRandomString(),
  HashInputString = concat([?UFID],RandomString) ,
  HashOutputString  = binary:decode_unsigned(crypto:hash(sha256 , HashInputString)),
  io:format("~64.16.0b \n", [HashOutputString]).
  %generateHash(LeadingZeros).  Used for recursively mining coins. Commen

startMining(2,LeadingZeros) -> {ok, LeadingZeros};

startMining(Itr, LeadingZeros) ->
  spawn( fun() -> generateHash(LeadingZeros) end),
  startMining(Itr + 1, LeadingZeros).