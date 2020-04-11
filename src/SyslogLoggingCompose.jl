module SyslogLoggingCompose

using SyslogLogging, LogCompose
import LogCompose: logcompose, log_min_level, log_assumed_level

const sysloglck = ReentrantLock()
function logcompose(::Type{SyslogLogging.SyslogLogger}, config::Dict{String,Any}, logger_config::Dict{String,Any})
    ident = logger_config["identity"]
    level = log_min_level(logger_config, "Info")

    kwargs = Dict{Symbol,Any}()

    kwargs[:facility] = Symbol(get(logger_config, "facility", "user"))

    if get(logger_config, "lock", false)
        kwargs[:lck] = sysloglck
    end

    server_type = get(logger_config, "server_type", "local")
    if (server_type == "tcp") || (server_type == "udp")
        kwargs[:tcp] = (server_type == "tcp")
        if haskey(logger_config, "server_host")
            kwargs[:host] = logger_config["server_host"]
        end
        if haskey(logger_config, "server_port")
            kwargs[:port] = logger_config["server_port"]
        end
    end
    SyslogLogging.SyslogLogger(ident, level; kwargs...)
end

end # module
