local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

require("maxim.nvim-dap.lldb")

local configuration = require("maxim.nvim-dap.lldb").configuration

dap.configurations.cpp = configuration
