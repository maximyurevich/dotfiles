local M = {}

local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
	options = {
		initialize_timeout_sec = 100,
	},
}

M.configuration = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input(
				"Path to executable: ",
				vim.fn.getcwd() .. "/",
				"file"
			)
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end,
	},
}

return M
