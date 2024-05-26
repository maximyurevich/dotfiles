return {
  {
    "folke/neodev.nvim",
  },
  {
    "folke/neoconf.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "RubixDev/mason-update-all",
    config = true,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require("neoconf").setup({})
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
      require("mason").setup({})

      local lspconfig = require("lspconfig")

      lspconfig.nginx_language_server.setup({ capabilities = capabilities })

      lspconfig.dartls.setup({ capabilities = capabilities, single_file_support = true })

      lspconfig.css_variables.setup({ capabilities = capabilities })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "biome",
          "lua_ls",
          "ansiblels",
          "jsonls",
          "tsserver",
          "svelte",
          "pyright",
          "ruff",
          "bashls",
          "yamlls",
          "taplo",
          "rust_analyzer",
          "tailwindcss",
          "emmet_language_server",
          "cssls",
          "cssmodules_ls",
          "prismals",
        },
        handlers = {
          ["ansiblels"] = function()
            lspconfig.ansiblels.setup({
              capabilities = capabilities,
            })
          end,
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = capabilities,
            })
          end,
          ["jsonls"] = function()
            lspconfig.jsonls.setup({
              capabilities = capabilities,
              settings = {
                json = {
                  schemas = require("schemastore").json.schemas(),
                  validate = { enable = true },
                  format = {
                    enable = true,
                  },
                },
              },
            })
          end,
          ["yamlls"] = function()
            lspconfig.yamlls.setup({
              capabilities = capabilities,
              settings = {
                yaml = {
                  schemaStore = {
                    enable = false,
                    url = "",
                  },
                  schemas = require("schemastore").yaml.schemas(),
                },
              },
            })
          end,
          ["eslint"] = function()
            lspconfig.eslint.setup({
              root_dir = lspconfig.util.root_pattern(
                "eslint.config.js",
                "eslint.config.mjs",
                "eslint.config.cjs"
              ),
              on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  command = "EslintFixAll",
                })
              end,
            })
          end,
          ["biome"] = function()
            lspconfig.biome.setup({
              root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
              on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = false })
                  end,
                })
              end,
            })
          end,
          ["tsserver"] = function()
            lspconfig.tsserver.setup({
              capabilities = capabilities,
            })
          end,
          ["svelte"] = function()
            lspconfig.svelte.setup({
              capabilities = capabilities,
            })
          end,
          ["prismals"] = function()
            lspconfig.prismals.setup({
              capabilities = capabilities,
            })
          end,
          ["stylelint_lsp"] = function()
            require("lspconfig").stylelint_lsp.setup({
              settings = {
                stylelintplus = {
                  autoFixOnFormat = true,
                  autoFixOnSave = true,
                },
              },
              filetypes = { "svelte", "html", "css" },
            })
          end,
          ["bashls"] = function()
            lspconfig.bashls.setup({
              capabilities = capabilities,
              settings = {
                {
                  bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.command)",
                  },
                },
              },
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  codeLens = {
                    enable = true,
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                  diagnostics = {
                    globals = { "vim" },
                  },
                },
              },
            })
          end,
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              pyright = {
                disableOrganizeImports = true,
              },
              python = {
                analysis = {
                  typeCheckingMode = "off",
                  ignore = { "*" },
                },
              },
            })
          end,
          ["ruff"] = function()
            lspconfig.ruff.setup({})
          end,
          ["html"] = function()
            lspconfig.html.setup({
              capabilities = capabilities,
            })
          end,
          ["marksman"] = function()
            lspconfig.marksman.setup({ capabilities = capabilities })
          end,
          ["emmet_language_server"] = function()
            lspconfig.emmet_language_server.setup({ capabilities = capabilities })
          end,
          ["dockerls"] = function()
            lspconfig.dockerls.setup({ capabilities = capabilities })
          end,
          ["docker_compose_language_service"] = function()
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
          end,
          ["cssmodules_ls"] = function()
            lspconfig.cssmodules_ls.setup({
              capabilities = capabilities,
              filetypes = { "typescriptreact", "javascriptreact" },
            })
          end,
          ["cssls"] = function()
            lspconfig.cssls.setup({ capabilities = capabilities })
          end,
          ["tailwindcss"] = function()
            lspconfig.tailwindcss.setup({
              capabilities = capabilities,
              filetypes = { "typescriptreact", "javascriptreact", "svelte", "html", "css" },
            })
          end,
          ["taplo"] = function()
            lspconfig.taplo.setup({ capabilities = capabilities })
          end,
          ["rust_analyzer"] = function()
            lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
            })
          end,
        },
      })

      local luasnip = require("luasnip")

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            show_labelDetails = true,
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
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
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })

      require("dap.ext.vscode").load_launchjs()

      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "js", "bash", "codelldb", "delve" },
        automatic_installation = true,
        handlers = {
          delve = function(config)
            config.adapters = {
              type = "server",
              port = "${port}",
              executable = {
                command = "dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
              },
              require("mason-nvim-dap").default_setup(config),
            }
          end,
          bash = function(config)
            config.adapters = {
              type = "executable",
              command = vim.fn.stdpath("data")
                .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
            }
            require("mason-nvim-dap").default_setup(config)
          end,
          codelldb = function(config)
            config.adapters = {
              type = "server",
              port = "${port}",
              executable = {
                command = "codelldb",
                args = { "--port", "${port}" },
              },
            }
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })
    end,
  },
}
