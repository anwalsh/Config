vim.opt.background = "dark"

equire("github-theme").setup({
    options = {
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = true, -- Non focused panes set to alternative background
        styles = {
            -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            functions = "NONE",
            keywords = "italic",
            variables = "NONE",
            conditionals = "NONE",
            constants = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
        },
        inverse = {
            -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        darken = {
            -- Darken floating windows and sidebar-like windows
            floats = false,
            sidebars = {
                enable = true,
                list = {}, -- Apply dark background to specific windows
            },
        },
    },
    palettes = {},
    specs = {},
    groups = {},
})

vim.cmd("colorscheme github_dark")
