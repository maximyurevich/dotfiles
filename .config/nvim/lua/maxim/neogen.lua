local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	return
end

neogen.setup({
	enabled = true,
	languages = {
		python = {
			template = {
				annotation_convention = "reST",
			},
		},
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set(
	"n",
	"<Leader>nc",
	":lua require('neogen').generate({ type = 'class' })<CR>",
	opts
)

vim.g.doge_mapping = "<Leader>nf"

vim.keymap.set(
	"n",
	"<Leader>nn",
	":lua require('neogen').generate({ type = 'file' })<CR>",
	opts
)

vim.keymap.set(
	"n",
	"<Leader>nt",
	":lua require('neogen').generate({ type = 'type' })<CR>",
	opts
)
