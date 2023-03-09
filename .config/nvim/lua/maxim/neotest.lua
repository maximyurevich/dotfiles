local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local message = diagnostic.message
				:gsub("\n", " ")
				:gsub("\t", " ")
				:gsub("%s+", " ")
				:gsub("^%s+", "")
			return message
		end,
	},
}, neotest_ns)

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = { "--log-level", "DEBUG" },
			runner = "pytest",
			python = ".venv/bin/python",
		}),
		require("neotest-plenary"),
		require("neotest-go")({
			experimental = {
				test_table = true,
			},
			args = { "-count=1", "-timeout=60s" },
		}),
		require("neotest-jest")({
			jestCommand = "jest --watch ",
		}),
		require("neotest-dart")({
			command = "flutter",
			use_lsp = true,
		}),
		require("neotest-rust"),
		require("neotest-rspec"),
		require("neotest-deno"),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
	},
})

vim.keymap.set(
	"n",
	"<leader>t",
	":lua require('neotest').run.run()<CR>",
	{ silent = true }
)

vim.keymap.set(
	"n",
	"<leader>T",
	":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
	{ silent = true }
)

vim.keymap.set(
	"n",
	"<leader>td",
	":lua require('neotest').run.run({ strategy = 'dap' })<CR>",
	{ silent = true }
)

vim.keymap.set(
	"n",
	"<leader>ts",
	":lua require('neotest').run.stop()<CR>",
	{ silent = true }
)

vim.keymap.set(
	"n",
	"<leader>ta",
	":lua require('neotest').run.attach()<CR>",
	{ silent = true }
)
