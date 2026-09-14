local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local is_dark = wezterm.gui.get_appearance():find("Dark")

config.color_scheme = "Catppuccin " .. (is_dark and "Macchiato" or "Latte")
config.font = wezterm.font({
	family = "FiraCode Nerd Font Propo",
	weight = "DemiBold",
})
config.font_size = 13.0
config.background = {
	{
		source = {
			Color = is_dark and "#24273A" or "#D9DBDE",
		},
		width = "100%",
		height = "100%",
	},
	{
		source = {
			File = wezterm.config_dir .. "/background.png",
		},
		vertical_align = "Middle",
		horizontal_align = "Center",
		opacity = 0.05,
	},
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.native_macos_fullscreen_mode = true

-- config.window_decorations = "NONE"
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"fish",
	"sh",
	"zsh",
}
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.initial_rows = 24
config.initial_cols = 80

config.keys = {
	-- Splitting
	{
		key = "Return",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Backslash",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Select tab by number
	-- { key = "1", mods = "ALT", action = act.ActivateTab(0) },
	-- { key = "2", mods = "ALT", action = act.ActivateTab(1) },
	-- { key = "3", mods = "ALT", action = act.ActivateTab(2) },
	-- { key = "4", mods = "ALT", action = act.ActivateTab(3) },
	-- { key = "5", mods = "ALT", action = act.ActivateTab(4) },
	-- { key = "6", mods = "ALT", action = act.ActivateTab(5) },
	-- { key = "7", mods = "ALT", action = act.ActivateTab(6) },
	-- { key = "8", mods = "ALT", action = act.ActivateTab(7) },
	-- { key = "9", mods = "ALT", action = act.ActivateTab(8) },
	-- { key = "0", mods = "ALT", action = act.ActivateTab(9) },

	-- Use Alt-arrow keys to switch between panes
	-- { key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	-- { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	-- { key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	-- { key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },

	-- Use Ctrl+Shift+space to show pane selector
	{ key = "Return", mods = "CTRL|SHIFT", action = act.PaneSelect },

	-- Use Shift+arrow keys to swap (move) tabs
	{ key = "LeftArrow", mods = "SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "SHIFT", action = act.MoveTabRelative(1) },

	-- Use Alt+h/l to move between tabs (similar to vim-tmux-navigator)
	{ key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },

	-- And Alt+Shift+h/l to swap (move) tabs left/right
	{ key = "H", mods = "ALT", action = act.MoveTabRelative(-1) },
	{ key = "L", mods = "ALT", action = act.MoveTabRelative(1) },

	{ key = "LeftArrow", mods = "ALT", action = act({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "ALT", action = act({ SendString = "\x1bf" }) },

	-- Launcher menu
	{ key = "T", mods = "CMD", action = act.ShowLauncher },
}

return config
