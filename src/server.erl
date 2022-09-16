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
-export([init_server/0, local_ip_v4/0]).

  init_server() ->
    io:format("Initializing a server here \n"),
    NodeName = "akhiltest1",
    io:format("Nodename is ~p~n", [NodeName]),
    net_kernel:start([NodeName], shortnames).


local_ip_v4() ->
  {ok, Addrs} =  inet:getifaddrs(),
  hd([
    Addr || {_, Opts} <- Addrs, {addr, Addr} <- Opts,
    size(Addr) == 4, Addr =/= {127,0,0,1}
  ]).
