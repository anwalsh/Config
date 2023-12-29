local settings = require("core.settings")
local opt = vim.opt

-- Ignore compiled files
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**,*.o,*~,*.pyc,*pycache*"
]]

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.showmode = false
opt.showcmd = true
opt.timeoutlen = 250                          -- important for which-key
opt.cmdheight = 1                             -- Height of the command bar
opt.incsearch = true                          -- Makes search act like search in modern browsers
opt.showmatch = true                          -- show matching brackets when text indicator is over them
opt.relativenumber = settings.relative_number -- Show line numbers
opt.number = settings.number                  -- But show the actual number for the line we're on
opt.ignorecase = true                         -- Ignore case when searching...
opt.smartcase = true                          -- ... unless there is a capital letter in the query
opt.hidden = true                             -- I like having buffers stay around
opt.equalalways = false                       -- I don't like my windows changing all the time
opt.splitright = true                         -- Prefer windows splitting to the right
opt.splitbelow = true                         -- Prefer windows splitting to the bottom
opt.splitkeep = "screen"
opt.updatetime = 1000                         -- Make updates happen faster
opt.hlsearch = true                           -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10                            -- Make it so there are always ten lines below my cursor
if vim.fn.has("nvim-0.10") == 1 then opt.smoothscroll = true end

-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function() vim.opt_local.cursorline = value end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Tabs
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off
opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = settings.mouse

opt.signcolumn = "yes"
opt.colorcolumn = "100"

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
-- Mkdnflow Configuration for Markdown
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
-- Use the following if your buffer is set to become hidden
-- vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})
