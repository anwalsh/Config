local wezterm = require("wezterm")
local scheme = wezterm.color.get_builtin_schemes()["carbonfox"]
local act = wezterm.action
local process_icons = {
	["podman"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["docker"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["docker-compose"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["kuberlr"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["kubectl"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["nvim"] = {
		{ Text = "" },
	},
	["vim"] = {
		{ Text = wezterm.nerdfonts.dev_vim },
	},
	["node"] = {
		{ Text = wezterm.nerdfonts.mdi_hexagon },
	},
	["zsh"] = {
		{ Text = wezterm.nerdfonts.cod_terminal },
	},
	["bash"] = {
		{ Text = wezterm.nerdfonts.cod_terminal_bash },
	},
	["btm"] = {
		{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
	},
	["htop"] = {
		{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
	},
	["cargo"] = {
		{ Text = wezterm.nerdfonts.dev_rust },
	},
	["go"] = {
		{ Text = wezterm.nerdfonts.mdi_language_go },
	},
	["lazydocker"] = {
		{ Text = wezterm.nerdfonts.linux_docker },
	},
	["git"] = {
		{ Text = wezterm.nerdfonts.dev_git },
	},
	["lua"] = {
		{ Text = wezterm.nerdfonts.seti_lua },
	},
	["wget"] = {
		{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
	},
	["curl"] = {
		{ Text = wezterm.nerdfonts.mdi_flattr },
	},
	["gh"] = {
		{ Text = wezterm.nerdfonts.dev_github_badge },
	},
	["python"] = {
		{ Text = wezterm.nerdfonts.dev_python },
	},
	["python3"] = {
		{ Text = wezterm.nerdfonts.dev_python },
	},
	["ruby"] = {
		{ Text = wezterm.nerdfonts.dev_ruby },
	},
}

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.strftime(" %a, %d %b %y %H:%M ") },
	}))
end)

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir.file_path

	if current_dir == os.getenv("HOME") then
		return "~"
	end

	return string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

local function get_process(tab)
	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	process_name = string.lower(process_name)
	if string.find(process_name, "kubectl") then
		process_name = "kubectl"
	end

	return wezterm.format(process_icons[process_name] or { { Text = string.format("%s:", process_name) } })
end

wezterm.on("format-tab-title", function(tab)
	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s  ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = get_process(tab) },
		{ Text = " " },
		{ Text = get_current_working_dir(tab) },
		{ Text = "  ▕" },
	})
end)

local is_macos = wezterm.target_triple:match("darwin") ~= nil
local line_height
local font_size
if is_macos then
	line_height = 1.25
	font_size = 15.0
else
	line_height = 1.00
	font_size = 14.0
end

return {
	scrollback_lines = 36000,
	color_scheme = "carbonfox",
	font = wezterm.font_with_fallback({
		"Berkeley Mono",
		"FiraCode Nerd Font Mono",
	}),
	font_size = font_size,
	max_fps = 120,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = line_height,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	audible_bell = "Disabled",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 110,
	initial_rows = 25,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.85,
	},
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 1.0,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = false,
	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b[tT](\d+)\b]],
			format = "https://example.com/tasks/?t=$1",
		},
	},
	leader = { key = "a", mods = "CTRL" },
	keys = {
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "/",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "DownArrow",
			mods = "ALT",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{ key = "UpArrow", mods = "ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
		{
			key = "RightArrow",
			mods = "ALT",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "h",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Down"),
		},
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
		{
			key = "x",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{ key = "a", mods = "LEADER", action = act.ActivatePaneByIndex(0) },
		{ key = "b", mods = "LEADER", action = act.ActivatePaneByIndex(1) },
		{ key = "c", mods = "LEADER", action = act.ActivatePaneByIndex(2) },
		{ key = "d", mods = "LEADER", action = act.ActivatePaneByIndex(3) },
		{ key = "e", mods = "LEADER", action = act.ActivatePaneByIndex(4) },
		{ key = "s", mods = "LEADER", action = act.PaneSelect },
		{
			key = "#",
			mods = "LEADER",
			action = act.PaneSelect({
				alphabet = "1234567890",
			}),
		},
		{
			key = "c",
			mods = "LEADER",
			action = act.PaneSelect({
				mode = "SwapWithActive",
			}),
		},
		{ key = "n", mods = "LEADER", action = wezterm.action.SpawnWindow },
		{
			key = "q",
			mods = "CMD",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
}
