# SyslogLoggingCompose

[![Build Status](https://travis-ci.org/tanmaykm/SyslogLoggingCompose.jl.png)](https://travis-ci.org/tanmaykm/SyslogLoggingCompose.jl) 
[![Coverage Status](https://coveralls.io/repos/github/tanmaykm/SyslogLoggingCompose.jl/badge.svg?branch=master)](https://coveralls.io/github/tanmaykm/SyslogLoggingCompose.jl?branch=master)

Provides plugins to allow logger provided by [SyslogLogging](https://github.com/tanmaykm/SyslogLogging.jl) to be used with [LogCompose](https://github.com/tanmaykm/LogCompose.jl).

Example configuration:

```toml
[loggers.syslog]
type = "SyslogLogging.SyslogLogger"
identity = "testapp"
# min_level = "Info"                      # default is Info
# facility = "user"                       # one of the facility types listed in Syslogs.jl (default is user)
# server_type = "tcp"                     # tcp or udp or local (default)
# server_host = syslogsrvr
# server_port =
# lock = false                            # whether to lock the syslog facility while logging
# topmodule = "SyslogLoggingComposeTest"  # optional top module to use to resolve SyslogLogging module
#                                         #   usually module that says `using SyslogLogging` in your code
```

Check documentation of [SyslogLogging](https://github.com/tanmaykm/SyslogLogging.jl) for more details about parameter values.
