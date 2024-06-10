return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "golines" },
        yaml = { "yamlfix" },
        sh = { "shfmt" },
        toml = { "taplo" },
        python = { "ruff_format", "ruff_organize_import" },
      },
    },
  },
}
