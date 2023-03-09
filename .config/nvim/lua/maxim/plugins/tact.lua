return {
  {
    "tact-lang/tact.vim",
    init = function()
      vim.g.tact_prefer_completefunc = 1
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tact",
        callback = function()
          vim.lsp.start({
            name = "tact-extracted-ls",
            cmd = { "tact-extracted-ls", "--stdio" },
          })
        end,
      })
    end,
  },
}
