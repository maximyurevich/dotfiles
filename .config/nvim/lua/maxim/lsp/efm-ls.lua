local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local function on_attach(client, bufnr)
	require("maxim.lsp.formatting").formatting(client, bufnr)
end

local languages = {
	markdown = {
		formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=2 --columns=79",
		formatStdin = true,
	},
	rst = {
		formatCommand = "pandoc -f rst -t rst -s --columns=79",
		formatStdin = true,
	},
	gitcommit = {
		{
			lintCommand = "gitlint --config /home/maxim/.gitlint",
			lintStdin = true,
			lintFormats = {
				'%l: %m: "%r',
				"%l: %m",
			},
		},
	},
}

local efmls_config = {
	filetypes = {
		"markdown",
		"rst",
		"python",
		"gitcommit",
	},
	settings = {
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
	on_attach = on_attach,
}))
