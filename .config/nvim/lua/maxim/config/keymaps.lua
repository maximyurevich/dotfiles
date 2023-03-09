local map = vim.keymap.set

-- telescope

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { silent = true })
map("n", "<leader>fg", builtin.live_grep, { silent = true })
map("n", "<leader>fb", builtin.buffers, { silent = true })
map("n", "<leader>fh", builtin.help_tags, { silent = true })

-- oil

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- bufferline

map("n", "<space>h", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<space>l", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })

map("n", "<space><left>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<space><right>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })

map("n", "<space>dh", "<Cmd>BufferLineCloseLeft<CR>", { noremap = true, silent = true })
map("n", "<space>dl", "<Cmd>BufferLineCloseRight<CR>", { noremap = true, silent = true })

map("n", "<space><", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
map("n", "<space>>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })

map("n", "<space>p", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
map("n", "<space>pc", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })

map("n", "<space>dc", "<cmd>bd<CR>", { noremap = true, silent = true })
map("n", "<space>do", "<cmd>BufferLineCloseOthers<CR>", { noremap = true, silent = true })

map("n", "<space>tp", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })

map("n", "<space>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
map("n", "<space>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
map("n", "<space>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
map("n", "<space>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
map("n", "<space>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
map("n", "<space>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
map("n", "<space>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
map("n", "<space>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
map("n", "<space>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
map("n", "<space>0", "<Cmd>BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true })

map("n", "<space>bb", "<Cmd>BufferLineSortByTabs<CR>", { noremap = true, silent = true })
map("n", "<space>bd", "<Cmd>BufferLineSortByDirectory<CR>", { noremap = true, silent = true })
map("n", "<space>bl", "<Cmd>BufferLineSortByExtension<CR>", { noremap = true, silent = true })

-- harpoon

local harpoon = require("harpoon")

map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<leader>a", function()
  harpoon:list():add()
end)

map("n", "<leader>1", function()
  harpoon:list():select(1)
end)

map("n", "<leader>2", function()
  harpoon:list():select(2)
end)

map("n", "<leader>3", function()
  harpoon:list():select(3)
end)

map("n", "<leader>4", function()
  harpoon:list():select(4)
end)

map("n", "<leader>5", function()
  harpoon:list():select(5)
end)

map("n", "<leader>6", function()
  harpoon:list():select(6)
end)

map("n", "<leader>7", function()
  harpoon:list():select(7)
end)

map("n", "<leader>8", function()
  harpoon:list():select(8)
end)

map("n", "<leader>9", function()
  harpoon:list():select(9)
end)

map("n", "<leader>0", function()
  harpoon:list():select(10)
end)

map("n", "<space><up>", function()
  harpoon:list():prev()
end)

map("n", "<space><down>", function()
  harpoon:list():next()
end)

-- trouble

map("n", "<leader>xx", function()
  require("trouble").toggle()
end)

map("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)

map("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end)

map("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)

map("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)

map("n", "gR", function()
  require("trouble").toggle("lsp_references")
end)

-- refactoring

map("x", "<leader>re", function()
  require("refactoring").refactor("Extract Function")
end)

map("x", "<leader>rf", function()
  require("refactoring").refactor("Extract Function To File")
end)

map("x", "<leader>rv", function()
  require("refactoring").refactor("Extract Variable")
end)

map("n", "<leader>rI", function()
  require("refactoring").refactor("Inline Function")
end)

map({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor("Inline Variable")
end)

map("n", "<leader>rb", function()
  require("refactoring").refactor("Extract Block")
end)

map("n", "<leader>rbf", function()
  require("refactoring").refactor("Extract Block To File")
end)

map({ "n", "x" }, "<leader>rr", function()
  require("telescope").extensions.refactoring.refactors()
end)

-- dap

map("n", "<F5>", function()
  require("dap").continue()
end, { silent = true })

map("n", "<F10>", function()
  require("dap").step_over()
end)

map("n", "<F11>", function()
  require("dap").step_into()
end)

map("n", "<F12>", function()
  require("dap").step_out()
end)

map("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)

map("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end)

map("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

map("n", "<Leader>dr", function()
  require("dap").repl.open()
end)

map("n", "<Leader>dl", function()
  require("dap").run_last()
end)

map({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)

map({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)

map("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)

map("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

-- Neotest

map("n", "<leader>t", "require('neotest').run.run()")

map("n", "<leader>T", ":lua require('neotest').run.run(vim.fn.expand(' % '))<CR>")

map("n", "<leader>td", ":lua require('neotest').run.run({ strategy = 'dap' })<CR>")

map("n", "<leader>ts", ":lua require('neotest').run.stop()<CR>")

map("n", "<leader>ta", ":lua require('neotest').run.attach()<CR>")

-- vitest

map(
  "n",
  "<leader>twr",
  "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
  { desc = "Run Watch" }
)

map(
  "n",
  "<leader>twf",
  "<cmd>lua require('neotest').run.run({ vim.fn.expand('% '), vitestCommand = 'vitest --watch' })<cr>",
  { desc = "Run Watch File" }
)

-- sniprun

map("v", "<leader>e", "<Plug>SnipRun", { silent = true })
map("n", "<space>f", "<Plug>SnipRunOperator", { silent = true })
map("n", "<space>ff", "<Plug>SnipRun", { silent = true })
map(
  "n",
  "<space>fe",
  ":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>",
  {}
)

-- code runner

map("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
map("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
map("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
map("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- overseer

map("n", "<leader>or", "<cmd>OverseerRun<cr>")
map("n", "<leader>ob", "<cmd>OverseerBuild<cr>")
map("n", "<leader>oi", "<cmd>OverseerInfo<cr>")
map("n", "<leader>oo", "<cmd>OverseerOpen<cr>")
map("n", "<leader>ot", "<cmd>OverseerToggle<cr>")
map("n", "<leader>oa", "<cmd>OverseerQuickAction<cr>")
map("n", "<leader>oc", "<cmd>OverseerClearCache<cr>")
map("n", "<leader>at", "<cmd>OverseerTaskAction<cr>")
map("n", "<leader>os", "<cmd>OverseerSaveBundle<cr>")
map("n", "<leader>od", "<cmd>OverseerDeleteBundle<cr>")
map("n", "<leader>ol", "<cmd>OverseerLoadBundle<cr>")
map("n", "<space>rc", "<cmd>OverseerRunCmd<cr>")
map("n", "<space>c", "<cmd>OverseerClose<cr>")

-- textobjects

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
