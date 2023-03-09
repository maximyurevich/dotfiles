local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.bashdb = {
	type = "executable",
	command = os.getenv("HOME")
		.. "/.local/share/nvim/mason/bin/bash-debug-adapter",
	name = "bashdb",
	options = {
		initialize_timeout_sec = 100,
	},
}

dap.configurations.sh = {
	{
		type = "bashdb",
		request = "launch",
		name = "Launch file",
		showDebugOutput = true,
		pathBashdb = vim.fn.stdpath("data")
			.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
		pathBashdbLib = vim.fn.stdpath("data")
			.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = "${workspaceFolder}",
		pathCat = "cat",
		pathBash = "/bin/bash",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		env = {},
		terminalKind = "integrated",
	},
}
