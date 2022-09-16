%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Sept 2022 10:44 AM
%%%-------------------------------------------------------------------
-module(mysupervisor).
-behavior(supervisor).
-export([init/1]).

init(_Args) ->
  io:format("Initializing Supervisor for Mining Processes........\n"),
  SupFlags = #{},
  Args = [{local, main}, main, [], []],
  ChildSpecs = [
    #{id => main, start => {gen_server, start_link, Args}}
  ],
  {ok, {SupFlags, ChildSpecs}}.