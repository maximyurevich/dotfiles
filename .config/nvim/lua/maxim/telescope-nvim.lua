local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	extensions = {
		project = {
			hidden_files = true,
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true,
		},
		media = {
			backend = "ueberzug",
			move = true,
			cache_path = "/tmp/tele.media.cache",
		},
	},
	defaults = {
		mappings = {
			n = {
				["<c-d>"] = require("telescope.actions").delete_buffer,
			},
			i = {
				["<c-d>"] = require("telescope.actions").delete_buffer,
			},
		},
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.95,
			height = 0.95,
			preview_cutoff = 0,
		},
	},
})

local opts = { noremap = true, silent = true }

local builtin = require("telescope.builtin")

telescope.load_extension("dap")

telescope.load_extension("undo")

telescope.load_extension("file_browser")

telescope.load_extension("yank_history")

telescope.load_extension("conventional_commits")

telescope.load_extension("project")

telescope.load_extension("neoclip")

telescope.load_extension("media")

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)

vim.keymap.set("n", "<leader>f", function()
	require("telescope").builtins.find_files()
end)

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", opts)

vim.keymap.set(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	opts
)

vim.keymap.set("n", "<space>yh", ":Telescope yank_history<CR>", opts)

vim.keymap.set(
	"n",
	"<space>p",
	":lua require('telescope').extensions.project.project{ display_type = 'full' }<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<space>m",
	":lua require('telescope').extensions.macroscope.default()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<leader>fm",
	":Telescope media<CR>",
	{ noremap = true, silent = true }
)
