-- WezTerm 必要模块
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- 如果可能，使用 config_builder 对象
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- 基本设置
config.default_prog = { "pwsh.exe", "-NoLogo" } -- 默认启动 PowerShell
config.color_scheme = "Tokyo Night" -- 配色方案设为 Tokyo Night
config.font = wezterm.font_with_fallback({
	{ family = "Hack Nerd Font", scale = 1.2 }, -- 字体设为 Hack Nerd Font，并放大 1.2 倍
})
config.window_background_opacity = 0.9 -- 窗口背景透明度设为 0.9
config.window_decorations = "RESIZE" -- 窗口装饰允许调整大小
config.window_close_confirmation = "AlwaysPrompt" -- 关闭窗口时始终提示确认
config.scrollback_lines = 3000 -- 滚动缓冲区的行数设为 3000
config.default_workspace = "home" -- 默认工作空间设为 "home"

-- 调暗非活动窗格
config.inactive_pane_hsb = {
	saturation = 0.24, -- 饱和度调低到 0.24
	brightness = 0.5, -- 亮度调低到 0.5
}

-- 键绑定
config.leader = { key = "k", mods = "CTRL", timeout_milliseconds = 1000 } -- 设置 Leader 键为 Ctrl + k，并且超时为 1000 毫秒
config.keys = {
	-- 当按两次 Ctrl + k 时发送 C-k
	{ key = "k", mods = "LEADER", action = act.SendKey({ key = "k", mods = "CTRL" }) }, -- Leader 键 + k 发送 Ctrl + k
	-- { key = "c", mods = "LEADER",       action = act.ActivateCopyMode }, -- Leader 键 + c 进入复制模式

	-- 窗格键绑定
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- Leader 键 + - 垂直分割当前窗格
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- Leader 键 + | 水平分割当前窗格
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") }, -- Leader 键 + h 激活左侧窗格
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") }, -- Leader 键 + j 激活下方窗格
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") }, -- Leader 键 + k 激活上方窗格
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") }, -- Leader 键 + l 激活右侧窗格
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) }, -- Leader 键 + x 关闭当前窗格，无需确认
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState }, -- Leader 键 + z 切换窗格缩放状态
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") }, -- Leader 键 + s 顺时针旋转窗格
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) }, -- Leader 键 + r 激活窗格调整模式

	-- 标签页键绑定
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") }, -- Leader 键 + n 新建标签页
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) }, -- Leader 键 + [ 切换到前一个标签页
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) }, -- Leader 键 + ] 切换到下一个标签页
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator }, -- Leader 键 + t 显示标签页导航器
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) }, -- Leader 键 + m 激活标签页移动模式

	-- 最后，工作空间
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) }, -- Leader 键 + w 显示工作空间启动器
}

-- 快速切换到指定索引的标签页
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1), -- Leader 键 + 数字 1-9 切换到相应的标签页（索引从 0 开始）
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) }, -- h 键调整窗格大小（左）
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) }, -- j 键调整窗格大小（下）
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) }, -- k 键调整窗格大小（上）
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) }, -- l 键调整窗格大小（右）
		{ key = "Escape", action = "PopKeyTable" }, -- Escape 键退出当前键表
		{ key = "Enter", action = "PopKeyTable" }, -- Enter 键退出当前键表
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) }, -- h 键向左移动标签页
		{ key = "j", action = act.MoveTabRelative(-1) }, -- j 键向左移动标签页
		{ key = "k", action = act.MoveTabRelative(1) }, -- k 键向右移动标签页
		{ key = "l", action = act.MoveTabRelative(1) }, -- l 键向右移动标签页
		{ key = "Escape", action = "PopKeyTable" }, -- Escape 键退出当前键表
		{ key = "Enter", action = "PopKeyTable" }, -- Enter 键退出当前键表
	},
}

-- 标签栏
config.use_fancy_tab_bar = false -- 禁用 Fancy Tab Bar
config.status_update_interval = 1000 -- 状态更新间隔为 1000 毫秒
wezterm.on("update-right-status", function(window, pane)
	-- 显示工作空间名称
	local stat = window:active_workspace()
	-- 如果有活动的键表，显示键表名称
	if window:active_key_table() then
		stat = window:active_key_table()
	end
	-- 如果 Leader 键激活，显示 "LDR"
	if window:leader_is_active() then
		stat = "LDR"
	end

	-- 当前工作目录
	local basename = function(s)
		-- 提取最后一个文件夹或文件名
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	local cwd = basename(pane:get_current_working_dir())
	-- 当前命令
	local cmd = basename(pane:get_foreground_process_name())

	-- 时间
	local time = wezterm.strftime("%H:%M")

	-- 更新右侧状态栏
	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat }, -- 显示工作空间或键表名称
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd }, -- 显示当前工作目录
		{ Text = " | " },
		{ Foreground = { Color = "FFB86C" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd }, -- 显示当前命令
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time }, -- 显示时间
		{ Text = " |" },
	}))
end)

return config -- 返回配置对象
