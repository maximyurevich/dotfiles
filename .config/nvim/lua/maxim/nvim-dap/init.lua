local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

local mason_nvim_dap_status_ok, mason_nvim_dap =
	pcall(require, "mason-nvim-dap")
if not mason_nvim_dap_status_ok then
	return
end

mason_nvim_dap.setup({
	ensure_installed = {
		"python",
		"bash",
		"javadbg",
		"javatest",
		"dart",
	},
})

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Toggle DAP UI

vim.keymap.set(
	"n",
	"<leader>d",
	":lua require('dapui').toggle()<CR>",
	{ noremap = true, silent = true }
)

-- Virtual text

local virtual_text_status_ok, virtual_text =
	pcall(require, "nvim-dap-virtual-text")
if not virtual_text_status_ok then
	return
end

virtual_text.setup()

-- Breakpoint sign

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "🛑", texthl = "", linehl = "", numhl = "" }
)

-- Mappings

vim.keymap.set(
	"n",
	"<F5>",
	":lua require('dap').continue()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<F10>",
	":lua require('dap').step_over()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<F11>",
	":lua require('dap').step_into()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<F12>",
	":lua require('dap').step_out()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<Leader>b",
	":lua require('dap').toggle_breakpoint()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<Leader>B",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<silent><Leader>lp",
	":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<silent><Leader>dr",
	":lua require('dap').repl.open()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<silent><Leader>dl",
	":lua require('dap').run_last()<CR>",
	{ noremap = true, silent = true }
)
