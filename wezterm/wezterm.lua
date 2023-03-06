local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on("update-right-status", function(window)
    window:set_right_status(wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Text = wezterm.strftime(" %a, %d %b %y %H:%M ") },
    }))
end)

local function get_current_working_dir(tab)
    local current_dir = tab.active_pane.current_working_dir
    local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

    return current_dir == HOME_DIR and "  ~"
        or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
    return wezterm.format({
        { Attribute = { Intensity = "Half" } },
        { Text = string.format(" %s  ", tab.tab_index + 1) },
        "ResetAttributes",
        { Text = " " },
        { Text = get_current_working_dir(tab) },
        { Text = "  ▕" },
    })
end)

return {
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'FiraCode Nerd Font Mono'
    },
    font_size = 14.0,
    color_scheme = "carbonfox",
    max_fps = 120,
    pane_focus_follows_mouse = false,
    warn_about_missing_glyphs = false,
    show_update_window = false,
    check_for_updates = false,
    line_height = 1.20,
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
    tab_bar_at_bottom = false,
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
    leader = { key = 'a', mods = 'CTRL' },
    keys = {
        {
            key = '=',
            mods = 'LEADER',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = '/',
            mods = 'LEADER',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'LeftArrow',
            mods = 'ALT',
            action = act.AdjustPaneSize { 'Left', 5 },
        },
        {
            key = 'DownArrow',
            mods = 'ALT',
            action = act.AdjustPaneSize { 'Down', 5 },
        },
        { key = 'UpArrow', mods = 'ALT', action = act.AdjustPaneSize { 'Up', 5 } },
        {
            key = 'RightArrow',
            mods = 'ALT',
            action = act.AdjustPaneSize { 'Right', 5 },
        },
        {
            key = 'h',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Right',
        },
        {
            key = 'k',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Up',
        },
        {
            key = 'j',
            mods = 'LEADER',
            action = act.ActivatePaneDirection 'Down',
        },
        { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
        { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
        { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
        {
            key = 'x',
            mods = 'CMD',
            action = wezterm.action.CloseCurrentPane { confirm = true },
        },
        { key = 'a', mods = 'LEADER', action = act.ActivatePaneByIndex(0) },
        { key = 'b', mods = 'LEADER', action = act.ActivatePaneByIndex(1) },
        { key = 'c', mods = 'LEADER', action = act.ActivatePaneByIndex(2) },
        { key = 'd', mods = 'LEADER', action = act.ActivatePaneByIndex(3) },
        { key = 'e', mods = 'LEADER', action = act.ActivatePaneByIndex(4) },
        { key = 's', mods = 'LEADER', action = act.PaneSelect },
    },
}
