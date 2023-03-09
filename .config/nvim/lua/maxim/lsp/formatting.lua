local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.formatting(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				local v = vim.fn.winsaveview()
				vim.lsp.buf.format()
				vim.fn.winrestview(v)
			end,
		})
	end
end

return M
