vim.g.ale_use_neovim_diagnostics_api = 1

vim.g.ale_fix_on_save = 1

vim.g.ale_linters_explicit = 1

vim.g.ale_disable_lsp = 1

vim.g.ale_fixers = {
	["*"] = { "remove_trailing_lines", "trim_whitespace" },
	java = { "google_java_format" },
	sh = { "shfmt" },
	fish = { "fish_indent" },
	go = { "golines" },
	python = { "black", "ruff", "isort" },
	javascriptreact = { "rustywind" },
	typescriptreact = { "rustywind" },
	lua = { "stylua" },
	yaml = { "yamlfix" },
	html = { "rustywind" },
	sql = { "sqlfluff" },
	svelte = { "prettier", "rustywind" },
	vue = { "prettier", "rustywind" },
}

vim.g.ale_linters = {
	vim = { "vint" },
	go = { "golangci-lint" },
	fish = { "fish" },
	sh = { "shellcheck" },
	python = { "ruff", "mypy", "flake8" },
	sql = { "sqlfluff" },
	yaml = { "yamllint" },
}

vim.g.ale_virtualtext_cursor = "current"

vim.g.ale_echo_msg_error_str = "E"
vim.g.ale_echo_msg_warning_str = "W"
vim.g.ale_echo_msg_format = "{%linter%} %s [%severity%]"

vim.g.ale_warn_about_trailing_whitespace = 0
