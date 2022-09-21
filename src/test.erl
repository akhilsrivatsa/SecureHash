%%%-------------------------------------------------------------------
%%% @author akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Sept 2022 2:13 PM
%%%-------------------------------------------------------------------
-module(test).
-author("akhil").

%% Purpose is to test functions only
-export([start/0]).

start() ->
  {ok, Input} = io:read("enter any input"),
  IsInputIP =  lists:member(hd("."), Input),
  io:format("Input Ip res: ~s", [IsInputIP]),

  if IsInputIP == false ->
    LeadingZeroes = list_to_integer(Input),
    io:format("Integer Val ~w ~n", [LeadingZeroes]);

    true ->
      io:format("occurence is ~s ~n", [Input])

  end,
  start().

