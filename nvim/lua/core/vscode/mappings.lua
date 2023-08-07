local Remap = require("core.utils.remapper")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local noremap = Remap.noremap

vim.g.mapleader = " "

nnoremap("<esc><esc>", ":nohl<CR>", silent)

nnoremap(" ", ":call VSCodeNotify('vspacecode.space')<CR>")
xnoremap(" ", ":call VSCodeNotify('vspacecode.space')<CR>")

-- Center the lines yo
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("G", "Gzz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- j/k moves visually up and down lines, until you want to jump lines.
-- This is more intuitive than the default behavior.
noremap("j", "( v:count? 'j': 'gj')", { expr = true, noremap = true })
noremap("k", "( v:count? 'k': 'gk')", { expr = true, noremap = true })
