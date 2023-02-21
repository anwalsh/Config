local wezterm = require 'wezterm'
return {
    font = wezterm.font_with_fallback {
        'JetBrains Mono',
        'FiraCode Nerd Font Mono'
    },
    font_size = 14.0,
    color_scheme = "carbonfox",
}
