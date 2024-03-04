return {
	{
		"nvim-lua/plenary.nvim",
	},
	"metakirby5/codi.vim",
	"tpope/vim-obsession",
	"tmux-plugins/vim-tmux",
	"christoomey/vim-tmux-navigator",
	"mbbill/undotree",
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"olacin/telescope-cc.nvim",
			"nvim-telescope/telescope-project.nvim",
			"kkharji/sqlite.lua",
			"dharmx/telescope-media.nvim",
		},
		config = function()
			require("maxim.telescope-nvim")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "VimEnter" },
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("maxim.bufferline")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("maxim.nvim-tree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("maxim.treesitter")
		end,
		build = ":TSUpdate",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = true,
	},
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"yioneko/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "onsails/lspkind.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "lukas-reineke/cmp-under-comparator" },
		},
		event = "InsertEnter",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("maxim.lsp.lspconfig")
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("maxim.lsp.efm-ls")
		end,
	},
	{ "j-hui/fidget.nvim", config = true },
	{
		"mfussenegger/nvim-jdtls",
	},
	"b0o/schemastore.nvim",
	{
		"simrat39/rust-tools.nvim",
		lazy = false,
		dependencies = { "mattn/webapi-vim" },
		config = function()
			require("maxim.rust-tools")
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.offsetEncoding = { "utf-16" }
			require("clangd_extensions").setup({
				server = {
					capabilities = capabilities,
				},
			})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("maxim.lsp.lspsaga")
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("maxim.nvim-dap")
		end,
		dependencies = {
			"mfussenegger/nvim-dap",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
	{
		"maximyurevich/js-debug",
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			require("maxim.nvim-dap.javascript")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd([[colorscheme gruvbox-material]])
		end,
	},
	{
		"sansyrox/vim-python-virtualenv",
	},
	{
		"michaelb/sniprun",
		build = "bash install.sh",
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("maxim.trouble")
		end,
	},
	{
		"stevearc/overseer.nvim",
		config = function()
			require("maxim.overseer")
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"prochri/telescope-all-recent.nvim",
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"akinsho/git-conflict.nvim",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		config = true,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
			"olimorris/neotest-rspec",
			"sidlatau/neotest-dart",
			"rouge8/neotest-rust",
			"MarkEmmons/neotest-deno",
			"nvim-neotest/neotest-vim-test",
			"vim-test/vim-test",
		},
		config = function()
			require("maxim.neotest")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("maxim.refactoring")
		end,
	},
	{
		"napmn/react-extract.nvim",
		ft = { "javascriptreact", "typescriptreact" },
		config = function()
			require("maxim.react-extract")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"danymat/neogen",
		config = function()
			require("maxim.neogen")
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
	},
	{
		"gbprod/yanky.nvim",
		config = true,
	},
	{
		"gbprod/cutlass.nvim",
		config = function()
			require("cutlass").setup({
				cut_key = "m",
				exclude = { "ns", "nS" },
			})
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("maxim.neoclip")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require(
					"ts_context_commentstring.integrations.comment_nvim"
				).create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		config = true,
	},
	{
		"mickael-menu/zk-nvim",
		config = function()
			require("maxim.zk-nvim")
		end,
	},
	{
		"dstein64/nvim-scrollview",
		config = true,
	},
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	"tpope/vim-rails",
	"tpope/vim-bundler",
	"tpope/vim-rake",
	{
		"ivanesmantovich/xkbswitch.nvim",
		config = true,
	},
	"dstein64/vim-startuptime",
	"pearofducks/ansible-vim",
}
