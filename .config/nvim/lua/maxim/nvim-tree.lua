local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("Up"))

	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
end

nvim_tree.setup({
	on_attach = on_attach,
})

vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>")
