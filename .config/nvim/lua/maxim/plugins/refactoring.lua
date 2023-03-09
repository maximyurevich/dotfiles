return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
      },
    },
    config = function()
      require("telescope").load_extension("refactoring")
    end,
  },
}
