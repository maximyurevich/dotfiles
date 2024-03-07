local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local function on_attach(client, bufnr)
	require("maxim.lsp.formatting").formatting(client, bufnr)
end

local prettier = require("efmls-configs.formatters.prettier")

local languages = {
	fish = {
		require("efmls-configs.linters.fish"),
		require("efmls-configs.formatters.fish_indent"),
	},
	java = { require("efmls-configs.formatters.google_java_format") },
	sh = {
		require("efmls-configs.formatters.shfmt"),
		require("efmls-configs.linters.shellcheck"),
	},
	go = {
		require("efmls-configs.linters.golangci_lint"),
		require("efmls-configs.formatters.golines"),
	},
	python = {
		require("efmls-configs.linters.mypy"),
	},
	lua = { require("efmls-configs.formatters.stylua") },
	yaml = {
		{
			formatCommand = "yamlfix -",
			formatStdin = true,
		},
		require("efmls-configs.linters.yamllint"),
	},
	svelte = { prettier },
	vue = { prettier },
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
		"fish",
		"java",
		"sh",
		"go",
		"svelte",
		"vue",
		"yaml",
		"lua",
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
