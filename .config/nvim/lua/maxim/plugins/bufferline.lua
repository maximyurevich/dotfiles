return {
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        numbers = "both",
        always_show_bufferline = false,
      },
    },
  },
}
