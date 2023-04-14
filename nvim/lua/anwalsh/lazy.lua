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

require("lazy").setup("anwalsh.plugins", {
    concurrency = 50,
    defaults = { lazy = true },
    install = { missing = true },
    checker = { enabled = true, notify = true, concurrency = 50, frequency = 3600 },
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

cmd.colorscheme("carbonfox")
