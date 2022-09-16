%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Sept 2022 10:42 AM
%%%-------------------------------------------------------------------
-module(secureHash).
-behavior(application).
-export([start/2, stop/1, stop/0, start/0]).

start() ->
  io:format("First Init function called"),
  application:start(?MODULE).

start(_Type, Args) ->
  io:format("Starting SecureHash Application........ \n"),
  supervisor:start_link({local, mysupervisor}, mysupervisor, Args).

stop() ->
  secureHash:stop(?MODULE).

stop(_State) ->
  [].