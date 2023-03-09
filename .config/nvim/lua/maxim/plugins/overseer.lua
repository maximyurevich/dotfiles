return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("dap.ext.vscode").json_decode = require("overseer.json").decode
      require("overseer").setup({
        dap = false,
      })
      require("overseer").patch_dap(true)
    end,
  },
}
