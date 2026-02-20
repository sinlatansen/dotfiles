local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

--------------------------------------------------
-- Launch
--------------------------------------------------

config.default_prog = { "nu" }
config.default_cwd = "F:/OneDrive/08.Workspace"
config.default_workspace = "home"

--------------------------------------------------
-- Rendering / Performance
--------------------------------------------------

config.front_end = "WebGpu"
config.animation_fps = 120
config.max_fps = 120
config.webgpu_power_preference = "HighPerformance"

--------------------------------------------------
-- Appearance / Colors
--------------------------------------------------

config.color_scheme = "Tokyo Night Storm"

config.window_padding = {
	left = 16,
	right = 16,
	top = 14,
	bottom = 10,
}

config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

config.window_background_opacity = 0.96
config.win32_system_backdrop = "Acrylic"

config.background = {
	{
		source = {
			File = "F:/OneDrive/图片/my/鸣潮美图/IMG_0261.PNG",
		},
		width = "Cover",
		height = "Cover",
	},
	{
		source = {
			Color = "#1d2021",
		},
		width = "100%",
		height = "100%",
		opacity = 0.85,
	},
}

--------------------------------------------------
-- Fonts
--------------------------------------------------

config.font = wezterm.font_with_fallback({
	{
		family = "0xProto Nerd Font",
	},
	{
		family = "Maple Mono NF CN",
	},
})

config.font_size = 12
config.line_height = 1.08

--------------------------------------------------
-- Window
--------------------------------------------------

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

config.initial_cols = 90
config.initial_rows = 30

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

--------------------------------------------------
-- Scrollback
--------------------------------------------------

config.scrollback_lines = 3000
config.scrollback_lines = 5000
config.enable_scroll_bar = false
config.enable_scroll_bar = true

--------------------------------------------------
-- Cursor
--------------------------------------------------

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

--------------------------------------------------
-- Mouse
--------------------------------------------------

config.disable_default_mouse_bindings = false

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("Clipboard"),
	},
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

--------------------------------------------------
-- Leader Key
--------------------------------------------------

config.leader = {
	key = "k",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

--------------------------------------------------
-- Keybindings
--------------------------------------------------

config.keys = {

	-- send ctrl-k
	{ key = "k", mods = "LEADER",       action = act.SendKey({ key = "k", mods = "CTRL" }) },

	-- panes
	{ key = "-", mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER",       action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER",       action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "z", mods = "LEADER",       action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER",       action = act.RotatePanes("Clockwise") },
	{ key = "r", mods = "LEADER",       action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- tabs
	{ key = "c", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER",       action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER",       action = act.ShowTabNavigator },

	-- workspace
	{ key = "w", mods = "LEADER",       action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	-- scroll
	{ key = "u", mods = "CTRL",         action = wezterm.action.ScrollByPage(-1) },
	{ key = "d", mods = "CTRL",         action = wezterm.action.ScrollByPage(1) },
}

--------------------------------------------------
-- Tab Index Shortcuts
--------------------------------------------------

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

--------------------------------------------------
-- Key Tables
--------------------------------------------------

config.key_tables = {

	resize_pane = {
		{ key = "h",      action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j",      action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k",      action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l",      action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},

	move_tab = {
		{ key = "h",      action = act.MoveTabRelative(-1) },
		{ key = "j",      action = act.MoveTabRelative(-1) },
		{ key = "k",      action = act.MoveTabRelative(1) },
		{ key = "l",      action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},
}

--------------------------------------------------

return config
