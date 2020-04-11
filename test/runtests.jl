using LogCompose, Test, Logging, SyslogLogging, SyslogLoggingCompose

function test()
    config = joinpath(@__DIR__, "testapp.toml")

    let logger = LogCompose.logger(config, "syslog.testapp"; section="loggers")
        with_logger(logger) do
            @info("testsyslog")
        end
    end
end

test()
