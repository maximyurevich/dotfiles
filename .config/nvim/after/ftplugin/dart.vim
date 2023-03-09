nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>

nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>

xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
