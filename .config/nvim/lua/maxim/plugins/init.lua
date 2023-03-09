return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  },
  {
    "tpope/vim-obsession",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  { "mfussenegger/nvim-ansible" },
  { "uarun/vim-protobuf" },
  { "CRAG666/code_runner.nvim", config = true },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  "isobit/vim-caddyfile",
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
}
