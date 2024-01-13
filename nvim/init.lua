local g, fn, opt, loop, env, cmd = vim.g, vim.fn, vim.opt, vim.loop, vim.env, vim.cmd

require("aw.globals")
require("aw.mappings")
require("aw.options")
require("aw.util.qf")
require("aw.autocmd")
-- require("aw.winbar") -- FIXME: Enable after 0.10.0 or once I move to nightly

local home = env.HOME
-- Get the OS in case I need it into the namespace
g.os = loop.os_uname().sysname

-- CPU Count for concurrency
PU_COUNT = #loop.cpu_info()

-- Same idea for variables within the system
g.dotfiles = env.DOTFILES_HOME or fn.expand("$DOTFILES_HOME")
g.vim_dir = g.dotfiles .. "/nvim"
g.projects_dir = env.GITLOCAL_HOME or fn.expand("GITLOCAL_HOME")
g.work_dir = g.projects_dir .. "/github.com/10gen"

-- Remap space as leader key
-- Must be before lazy
g.mapleader = " "
g.maplocalleader = ","

-- Ensure lazy.nvim plugin manager is installed
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
    fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
opt.rtp:prepend(lazypath)

require("lazy").setup("aw.plugins", {
    concurrency = PU_COUNT,
    defaults = { lazy = true },
    install = { missing = true },
    checker = { enabled = true, notify = true, concurrency = 50, frequency = 3600 },
    missing = true,
    performance = {
        cache = {
            enabled = true,
            -- disable_events = {},
        },
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrw",
                "netrwFileHandlers",
                "netrwSettings",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "📌",
        },
    },
})
