{application,secureHash, [
  {description, "A Bitcoin mining distributed system"},
  {vsn, "1"},
  {modules, [secureHash, main, mysupervisor, server]},
  {registered, []},
  {applications, [kernel,stdlib]},
  {mod, {secureHash, []}},
  {env, []}
]}.