local g, fn, env = vim.g, vim.fn, vim.env

require("aw.globals")
require("aw.mappings")
require("aw.options")
require("aw.util.qf")
require("aw.autocmd")

-- Get the OS
g.os = vim.uv.os_uname().sysname

-- CPU Count for concurrency
PU_COUNT = #vim.uv.cpu_info()

-- Environment variables
g.dotfiles = env.DOTFILES_HOME or fn.expand("$DOTFILES_HOME")
g.vim_dir = g.dotfiles .. "/nvim"
g.projects_dir = env.GITLOCAL_HOME or fn.expand("GITLOCAL_HOME")
g.work_dir = g.projects_dir .. "/github.com/10gen"

-- Remap space as leader key (must be before plugin loading)
g.mapleader = " "
g.maplocalleader = ","

-- Disable builtin plugins
local disabled_built_ins = {
    "gzip",
    "netrwPlugin",
    "rplugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
}
for _, plugin in ipairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Plugin installation via vim.pack (Neovim 0.12)
require("aw.plugins")

-- Plugin configurations (after all plugins are on runtimepath)
require("aw.plugins.theme")
require("aw.plugins.treesitter")
require("aw.plugins.blink")
require("aw.plugins.telescope")
require("aw.plugins.gitsigns")
require("aw.plugins.neogit")
require("aw.plugins.diffview")
require("aw.plugins.git")
require("aw.plugins.lualine")
require("aw.plugins.neo-tree")
require("aw.plugins.noice")
require("aw.plugins.format")
require("aw.plugins.lint")
require("aw.plugins.luasnip")
require("aw.plugins.dap")
require("aw.plugins.neotest")
require("aw.plugins.flash")
require("aw.plugins.oil")
require("aw.plugins.term")
require("aw.plugins.which-key")
require("aw.plugins.misc")

-- LSP configuration (native Neovim 0.12 API)
require("aw.lsp")
