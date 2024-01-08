local g, fn, opt, loop, env, cmd = vim.g, vim.fn, vim.opt, vim.loop, vim.env, vim.cmd

require("aw.globals")
require("aw.lazy")
require("aw.mappings")
require("aw.options")
require("aw.util.qf")
require("aw.autocmd")

-- Get the OS in case I need it into the namespace
g.os = loop.os_uname().sysname

-- Same idea for variables within the system
g.dotfiles = fn.expand("$DOTFILES_HOME") or env.dotfiles
g.vim_dir = g.dotfiles .. "/nvim"
g.projects_dir = env.PROJECTS_DIR or fn.expand("GITLOCAL_HOME")
g.work_dir = g.projects_dir .. "/github.com/10gen"
