local status_ok, overseer = pcall(require, "overseer")
if not status_ok then
	return
end

overseer.setup()

vim.keymap.set(
	"n",
	"<leader>v",
	"<cmd>:OverseerRun<cr>",
	{ noremap = true, silent = false }
)
