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
    opts = {
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
          workspaceFolders = true,
        },
      },
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

      lspconfig.denols.setup({
        root_dir = lspconfig.util.root_pattern("deno.json"),
        capabilities = capabilities,
      })

      lspconfig.css_variables.setup({ capabilities = capabilities })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "taplo",
          "rust_analyzer",
        },
        handlers = {
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = capabilities,
              single_file_support = true,
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
          ["biome"] = function()
            lspconfig.biome.setup({
              root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
            })
          end,
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              single_file_support = false,
              capabilities = capabilities,
              filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
              root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
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
          ["pylsp"] = function()
            lspconfig.pylsp.setup({
              capabilities = capabilities,
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      enabled = false,
                    },
                    autopep8 = {
                      enabled = false,
                    },
                    mccabe = {
                      enabled = false,
                    },
                    pydocstyle = {
                      enabled = false,
                    },
                    pyflakes = {
                      enabled = false,
                    },
                  },
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
            lspconfig.emmet_language_server.setup({
              capabilities = capabilities,
            })
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
            lspconfig.cssls.setup({
              capabilities = capabilities,
              settings = {
                css = {
                  validate = true,
                  lint = {
                    unknownAtRules = "ignore",
                  },
                },
              },
            })
          end,
          ["tailwindcss"] = function()
            lspconfig.tailwindcss.setup({
              capabilities = capabilities,
              filetypes = { "typescriptreact", "javascriptreact", "svelte", "html", "css", "vue" },
            })
          end,
          ["taplo"] = function()
            lspconfig.taplo.setup({ capabilities = capabilities })
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

      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "chrome", "node2", "bash", "codelldb", "delve" },
        automatic_installation = true,
        handlers = {
          chrome = function(config)
            config.adapters = {
              type = "executable",
              command = vim.fn.exepath("chrome-debug-adapter"),
            }
            require("mason-nvim-dap").default_setup(config)
          end,
          node2 = function(config)
            config.adapters = {
              type = "executable",
              command = vim.fn.exepath("node-debug2-adapter"),
            }
            require("mason-nvim-dap").default_setup(config)
          end,
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
