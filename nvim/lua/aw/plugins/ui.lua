local lualine = require("lualine")
local navic = require("nvim-navic")

-- stylua: ignore
Colors = {
    bg       = '#242330',
    fg       = '#f8f8f3',
    yellow   = '#effa7c',
    cyan     = '#68ecff',
    darkblue = '#5f73a8',
    green    = '#00fe69',
    orange   = '#ffb45c',
    violet   = '#c591ff',
    magenta  = '#ff6eca',
    blue     = '#66ecff',
    red      = '#ff414c',
}

local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = Colors.fg, bg = Colors.bg } },
            inactive = { c = { fg = Colors.fg, bg = Colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component) table.insert(config.sections.lualine_c, component) end

-- Inserts a component in lualine_x ot right section
local function ins_right(component) table.insert(config.sections.lualine_x, component) end

ins_left({
    function() return "▊" end,
    color = { fg = Colors.blue },      -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
    -- mode component
    function() return "" end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = Colors.red,
            i = Colors.green,
            v = Colors.blue,
            [""] = Colors.blue,
            V = Colors.blue,
            c = Colors.magenta,
            no = Colors.red,
            s = Colors.orange,
            S = Colors.orange,
            ic = Colors.yellow,
            R = Colors.violet,
            Rv = Colors.violet,
            cv = Colors.red,
            ce = Colors.red,
            r = Colors.cyan,
            rm = Colors.cyan,
            ["r?"] = Colors.cyan,
            ["!"] = Colors.red,
            t = Colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
})

ins_left({
    -- filesize component
    "filesize",
    cond = conditions.buffer_not_empty,
})

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = Colors.magenta, gui = "bold" },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = Colors.fg, gui = "bold" } })

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = Colors.red },
        color_warn = { fg = Colors.yellow },
        color_info = { fg = Colors.cyan },
    },
})

ins_right({
    function() return navic.get_location() end,
    cond = navic.is_available,
    color = { fg = Colors.green, gui = "bold" },
})

ins_right({
    "branch",
    icon = "",
    color = { fg = Colors.violet, gui = "bold" },
})

ins_right({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
        added = { fg = Colors.green },
        modified = { fg = Colors.orange },
        removed = { fg = Colors.red },
    },
    cond = conditions.hide_in_width,
})

ins_right({
    function() return "▊" end,
    color = { fg = Colors.blue },
    padding = { left = 1 },
})

-- Now don't forget to initialize lualine
return {
    lualine.setup(config),
}
