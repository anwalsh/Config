local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local cmd = vim.cmd

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- Remap space as leader key
-- Must be before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = ","

if not vim.g.vscode then
    require("lazy").setup("core.plugins", {
        concurrency = 50,
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
else
    local vscode = require("core.plugins.vs-code")

    local options = {
        root = vim.fn.stdpath("data") .. "/lazy-vscode",
        lockfile = vim.fn.stdpath("config") .. "/lazy-vscode-lock.json",
        install = { missing = true },
        checker = { enabled = true, notify = false, concurrency = 50, frequency = 3600 },
        missing = true,
    }

    require("lazy").setup(vscode, options)
end
