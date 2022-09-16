%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Sept 2022 10:42 AM
%%%-------------------------------------------------------------------
-module(app).
-behavior(application).
-export([start/2, stop/1]).

start(_Type, Args) ->
  io:format("Starting SecureHash Application........ \n"),
  supervisor:start_link({local, mysupervisor}, mysupervisor, Args).

stop(_State) ->
  [].