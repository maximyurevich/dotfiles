local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
			},
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.export"] = {},
		["core.export.markdown"] = {},
		["core.summary"] = {},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
	},
})
