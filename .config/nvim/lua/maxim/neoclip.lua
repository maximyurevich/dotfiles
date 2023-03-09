local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
	history = 10,
	enable_persistent_history = false,
	length_limit = 1048576,
	continuous_sync = false,
	preview = true,
	prompt = nil,
	default_register = '"',
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = false,
	on_select = {
		move_to_front = false,
		close_telescope = true,
	},
	on_paste = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_replay = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_custom_action = {
		close_telescope = true,
	},
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>",
				delete = "<c-d>",
				edit = "<c-e>",
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d",
				edit = "e",
				custom = {},
			},
		},
	},
})
