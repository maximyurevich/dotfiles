local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
  return
end

local bundles = {
  vim.fn.glob(
    os.getenv("HOME")
    .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.42.0.jar"
    ,
    1
  ),
}

vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(
      os.getenv("HOME")
      .. "/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.test.plugin-0.37.1.jar",
      1
    ),
    "\n"
  )
)

local config = {
  cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(
    vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]
  ),
  init_options = {
    bundles = bundles,
  },
  on_attach = function(_, _)
    require("jdtls").setup_dap()
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
  end,
}

jdtls.start_or_attach(config)

-- JDTLS mappings

vim.keymap.set("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
vim.keymap.set("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
vim.keymap.set(
  "v",
  "crv",
  "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>"
)
vim.keymap.set("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
vim.keymap.set(
  "v",
  "crc",
  "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>"
)
vim.keymap.set(
  "v",
  "crm",
  "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>"
)

vim.keymap.set("n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
vim.keymap.set(
  "n",
  "<leader>dn",
  "<Cmd>lua require'jdtls'.test_nearest_method()<CR>"
)
