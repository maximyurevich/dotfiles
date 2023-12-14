local bufferline = require("bufferline")
bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.minimal,
		mode = "buffers",
		themable = true,
		diagnostics = "nvim_lsp",
	},
})

local opts = { noremap = true, silent = true }

-- Goto buffer in position

vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
vim.keymap.set("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)

-- Move to previous/next

vim.keymap.set("n", "b]", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "[b", "<Cmd>BufferLineCycleNext<CR>", opts)

-- Re-order to previous/next

vim.keymap.set("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>", opts)

-- Pin/unpin buffer

vim.keymap.set("n", "gB", "<Cmd>BufferLinePick<CR>", opts)

-- Close buffer

vim.keymap.set("n", "gd", "<Cmd>BufferLinePickClose<CR>", opts)
vim.keymap.set("n", "gO", "<Cmd>BufferLineCloseOthers<CR>", opts)

-- Sort automatically by...

vim.keymap.set("n", "be", "<Cmd>BufferLineSortByExtension<CR>", opts)
vim.keymap.set("n", "bd", "<Cmd>BufferLineSortByDirectory<CR>", opts)
