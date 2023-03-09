return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      if os.getenv("ZELLIJ") then
        vim.opt.laststatus = 0
      else
        require("lualine").setup({
          sections = {
            lualine_x = { "overseer" },
          },
        })
      end
    end,
  },
}
