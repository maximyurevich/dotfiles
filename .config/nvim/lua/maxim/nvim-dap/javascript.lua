local dap = require("dap")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			os.getenv("HOME")
				.. "/.local/share/nvim/lazy/js-debug/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}

dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch Node",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "node",
		request = "attach",
		name = "Attach to remote",
		address = function()
			return vim.fn.input("Address: ", "", "file")
		end,
		port = 9229,
	},
	{
		type = "node",
		request = "attach",
		name = "Attach to node",
		restart = true,
		port = 9229,
	},
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch Deno",
		runtimeExecutable = "deno",
		runtimeArgs = {
			"run",
			"--inspect-wait",
			"--allow-all",
		},
		program = "${file}",
		cwd = "${workspaceFolder}",
		attachSimplePort = 9229,
	},
}

dap.configurations.typescript = dap.configurations.javascript

dap.configurations.javascriptreact = {
	{
		type = "pwa-chrome",
		request = "launch",
		name = "Debug Chromium",
		url = function()
			return vim.fn.input("URI: ", "", "file")
		end,
		webRoot = "${workspaceFolder}",
		runtimeExecutable = "/usr/bin/brave",
	},
	{
		name = "Attach to Chrome",
		port = 9222,
		request = "attach",
		type = "pwa-chrome",
		webRoot = "${workspaceFolder}",
		runtimeExecutable = "/usr/bin/brave",
	},
}

dap.configurations.javascriptreact = dap.configurations.typescriptreact
