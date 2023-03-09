local mason_lspconfig_status_ok, mason_lspconfig =
	pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

require("vim.lsp._watchfiles")._watchfunc = function()
	return function() end
end

mason_lspconfig.setup({
	automatic_installation = false,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local lsp_signature_status_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_status_ok then
	return
end

local clients =
	{ "taplo", "stylelint_lsp", "gopls", "lemminx", "standardrb", "jsonls" }

local on_attach = function(client, bufnr)
	for _, c in ipairs(clients) do
		if client.name == c then
			require("maxim.lsp.formatting").formatting(client, bufnr)
		end
	end
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	lsp_signature.on_attach({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local pyright_capabilities = vim.lsp.protocol.make_client_capabilities()
pyright_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = pyright_capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

lspconfig.docker_compose_language_service.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(
		"docker-compose.yml",
		"docker-compose.yaml"
	),
	filetypes = { "yaml.docker-compose" },
	single_file_support = false,
})

lspconfig.denols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = false,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = false,
	root_dir = lspconfig.util.root_pattern("yarn.lock", "package-lock.json"),
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.cjs",
		"tailwind.config.js",
		"tailwind.config.ts"
	),
})

lspconfig.eslint.setup({
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json"
	),
	single_file_support = false,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.solargraph.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		solargraph = {
			diagnostics = false,
		},
	},
	init_options = {
		formatting = false,
	},
	single_file_support = true,
})

lspconfig.cssmodules_ls.setup({
	capabilities = capabilities,
	filetypes = { "javascriptreact", "typescriptreact" },
	root_dir = lspconfig.util.root_pattern("package.json"),
})

lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	filetypes = { "eruby", "html" },
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		{
			css = {
				validate = false,
			},
			less = {
				validate = false,
			},
			scss = {
				validate = false,
			},
		},
	},
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			validate = false,
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
	filetypes = { "yaml" },
})

lspconfig.ruff_lsp.setup({
	capabilities = capabilities,
	init_options = {
		settings = {
			args = {},
		},
	},
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
})

lspconfig.stylelint_lsp.setup({
	on_attach = function() end,
	capabilities = capabilities,
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
			autoFixOnSave = true,
		},
	},
	filetypes = { "css", "scss", "sass" },
})

lspconfig.taplo.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lemminx.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		provideFormatter = false,
	},
})

lspconfig.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern({
		"vue.config.js",
		"vue.config.ts",
		"nuxt.config.js",
		"nuxt.config.ts",
	}),
	init_options = {
		typescript = {
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
		},
	},
})

local servers = {
	"astro",
	"ansiblels",
	"awk_ls",
	"bashls",
	"dockerls",
	"esbonio",
	"graphql",
	"golangci_lint_ls",
	"marksman",
	"sqlls",
	"svelte",
	"unocss",
	"vimls",
	"standardrb",
}

local configs = require("lspconfig.configs")

configs.bunls = {
	default_config = {
		cmd = { "bunx", "--bun", "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "typescript", "javascript", "typescriptreact" },
		root_dir = function(fname)
			return lspconfig.util.root_pattern("bun.lockb")(fname)
		end,
		settings = {},
	},
}

lspconfig.bunls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = ".env",
	group = group,
	callback = function(args)
		vim.diagnostic.disable(args.buf)
	end,
})

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

require("luasnip/loaders/from_vscode").load()

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	return
end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.recently_used,
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp", trigger_characters = { "-" } },
		{ name = "luasnip" },
	},
})
