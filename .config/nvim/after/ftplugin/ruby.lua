local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.ruby = function(callback, config)
	callback({
		type = "server",
		host = "127.0.0.1",
		port = "${port}",
		executable = {
			command = "bundle",
			args = {
				"exec",
				"rdbg",
				"-n",
				"--open",
				"--port",
				"${port}",
				"-c",
				"--",
				"bundle",
				"exec",
				config.command,
				config.script,
			},
		},
	})
end

dap.configurations.ruby = {
	{
		type = "ruby",
		name = "Debug current file",
		request = "attach",
		localfs = true,
		command = "ruby",
		script = "${file}",
		debugPort = "127.0.0.1:12345",
	},
	{
		type = "ruby",
		name = "Debug Rails app",
		request = "attach",
		localfs = true,
		command = "rails",
		script = "server",
		debugPort = "127.0.0.1:12345",
	},
}
