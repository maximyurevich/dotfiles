return {
  {
    "RRethy/nvim-treesitter-endwise",
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "regex",
          "lua",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "gotmpl",
          "java",
          "python",
          "svelte",
          "html",
          "css",
          "javascript",
          "typescript",
          "gitignore",
        },
        auto_install = true,
        sync_install = false,
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
              ["ir"] = "@return.inner",
              ["ar"] = "@return.outer",
              ["i="] = "@assignment.inner",
              ["a="] = "@assignment.outer",
              ["l="] = "@assignment.lhs",
              ["r="] = "@assignment.rhs",
              ["it"] = "@attribute.inner",
              ["at"] = "@attribute.outer",
              ["im"] = "@comment.inner",
              ["am"] = "@comment.outer",
              ["in"] = "@conditional.inner",
              ["an"] = "@conditional.outer",
              ["il"] = "@call.inner",
              ["al"] = "@call.outer",
              ["ax"] = "@regex.outer",
              ["ix"] = "@regex.inner",
              ["ae"] = "@statement.outer",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
              ["ip"] = "@loop.inner",
              ["ap"] = "@loop.outer",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
            },
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>p"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>P"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              ["]o"] = "@loop.*",
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            goto_next = {
              ["]d"] = "@conditional.outer",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = "none",
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependecies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
