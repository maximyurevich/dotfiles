return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "rcasia/neotest-bash",
      "rouge8/neotest-rust",
      "sidlatau/neotest-dart",
      "alfaix/neotest-gtest",
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup({
        adapters = {
          require("neotest-plenary"),
          require("neotest-python"),
          require("neotest-go"),
          require("neotest-bash"),
          require("neotest-rust"),
          require("neotest-vitest")({
            filter_dir = function(name, _, _)
              return name ~= "node_modules"
            end,
          }),
          require("neotest-dart")({
            command = "flutter",
            use_lsp = true,
            custom_test_method_names = {},
          }),
          require("neotest-playwright").adapter({
            options = {
              preset = "headed",
              persist_project_selection = true,
              enable_dynamic_test_discovery = false,
              filter_dir = function(name, _, _)
                return name ~= "node_modules"
              end,
            },
          }),
          require("neotest-gtest").setup({}),
        },
      })
    end,
  },
}
