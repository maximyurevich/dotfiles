vim.opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h14"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.background = "dark"
vim.g.scrollview_excluded_filetypes = { "NvimTree" }
vim.opt.conceallevel = 2
vim.opt.showmode = false
vim.opt.concealcursor = "nc"
vim.opt.shellslash = true
vim.opt.foldenable = false
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.o.sessionoptions =
	"blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.cmd("au BufNewFile,BufRead PKGBUILD set filetype=PKGBUILD")
