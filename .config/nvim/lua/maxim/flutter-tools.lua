local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	return
end

flutter_tools.setup({
	ui = {
		border = "rounded",
	},
	decorations = {
		statusline = {
			app_version = true,
			device = true,
			project_config = true,
		},
	},
	debugger = {
		enabled = true,
		run_via_dap = true,
		exception_breakpoints = {},
		register_configurations = function(_)
			require("dap").configurations.dart = {}
			require("dap.ext.vscode").load_launchjs()
		end,
	},
	fvm = false,
	widget_guides = {
		enabled = false,
	},
	closing_tags = {
		highlight = "ErrorMsg",
		prefix = ">",
		enabled = true,
	},
	dev_log = {
		enabled = true,
		notify_errors = false,
		open_cmd = "tabedit",
	},
	dev_tools = {
		autostart = false,
		auto_open_browser = false,
	},
	outline = {
		open_cmd = "30vnew",
		auto_open = false,
	},
	lsp = {
		color = {
			enabled = true,
			background = false,
			foreground = false,
			virtual_text = true,
			virtual_text_str = "■",
		},
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			renameFilesWithClasses = "prompt",
			enableSnippets = true,
			updateImportsOnRename = true,
		},
	},
})
