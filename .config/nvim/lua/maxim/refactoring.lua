local status_ok, refactoring = pcall(require, "refactoring")
if not status_ok then
	return
end

refactoring.setup()

-- Remaps for the refactoring operations currently offered by the plugin

vim.keymap.set("v", "<leader>re", function()
	pcall(refactoring.refactor, "Extract Function")
end, { noremap = true, silent = true, expr = false })

vim.keymap.set("v", "<leader>rf", function()
	pcall(refactoring.refactor, "Extract Function To File")
end, { noremap = true, silent = true, expr = false })

vim.keymap.set("v", "<leader>rv", function()
	pcall(refactoring.refactor, "Extract Variable")
end, { noremap = true, silent = true, expr = false })

vim.keymap.set("v", "<leader>ri", function()
	pcall(refactoring.refactor, "Inline Variable")
end, { noremap = true, silent = true, expr = false })

-- Extract block doesn't need visual mode

vim.keymap.set("n", "<leader>rb", function()
	pcall(refactoring.refactor, "Extract Block")
end, { noremap = true, silent = true, expr = false })

vim.keymap.set("n", "<leader>rbf", function()
	pcall(refactoring.refactor, "Extract Block To File")
end, { noremap = true, silent = true, expr = false })

-- Inline variable can also pick up the identifier currently under the cursor without visual mode

vim.keymap.set("n", "<leader>ri", function()
	pcall(refactoring.refactor, "Inline Variable")
end, { noremap = true, silent = true, expr = false })

-- Prompt for a refactor to apply when the remap is triggered

vim.keymap.set("v", "<leader>rr", function()
	pcall(refactoring.select_refactor, {})
end, { noremap = true, silent = true, expr = false })
