local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.go = {
	type = "executable",
	command = "sh",
	args = {
		os.getenv("HOME") .. "/.local/share/nvim/mason/bin/go-debug-adapter",
	},
}

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"),
	},
}
