local autocmd = vim.api.nvim_create_autocmd

-- conform

autocmd("BufWritePre", {
  pattern = { "*.lua", "*.go", "*.yaml", "*.sh", "*.py" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf, quiet = true })
  end,
})

-- lsp format

autocmd("BufWritePre", {
  pattern = {
    "*.rs",
    "*.json",
    "*.jsonc",
    "*.svelte",
    "*.toml",
    "*.html",
    "*.css",
    "*.prisma",
    "*.dart",
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- lspattach

vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>")
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prevcr>")
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<CR>", opts)

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.lnst_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- nvim-lint

autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint(nil, { ignore_errors = true })
  end,
})

-- mason-update-all

autocmd("User", {
  pattern = "MasonUpdateAllComplete",
  callback = function()
    print("mason-update-all has finished")
  end,
})
