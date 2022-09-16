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
-export([init_server/0]).

  init_server() ->
  io:format("Initializing a server here \n"),
  My_ip = local_ip_v4(),
  io:format("Printing my Ip address ~p \n", [My_ip]),
    inets:start(httpd, [
    {modules, [
      mod_alias,
      mod_auth,
      mod_esi,
      mod_actions,
      mod_cgi,
      mod_dir,
      mod_get,
      mod_head,
      mod_log,
      mod_disk_log
    ]},

    {port,8081},
    {server_name,[My_ip]},
    {server_root,"D://tmp"},
    {document_root,"D://tmp/htdocs"},
    {erl_script_alias, {"/erl", [My_ip]}},
    {error_log, "error.log"},
    {security_log, "security.log"},
    {transfer_log, "transfer.log"},

    {mime_types,[
      {"html","text/html"}, {"css","text/css"}, {"js","application/x-javascript"} ]}
  ]).

local_ip_v4() ->
  {ok, Addrs} =  inet:getifaddrs(),
  hd([
    Addr || {_, Opts} <- Addrs, {addr, Addr} <- Opts,
    size(Addr) == 4, Addr =/= {127,0,0,1}
  ]).
