local status_ok, react_refactor = pcall(require, "react-extract")
if not status_ok then
	return
end

react_refactor.setup()

vim.keymap.set(
	{ "v" },
	"<Leader>re",
	require("react-extract").extract_to_new_file
)

vim.keymap.set(
	{ "v" },
	"<Leader>rc",
	require("react-extract").extract_to_current_file
)
