return {
  {
    "RRethy/nvim-treesitter-endwise",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "regex",
          "cpp",
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
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
      })
    end,
  },
}
