local Remap = require("util.remapper")
local nmap = Remap.nmap
local noremap = Remap.noremap
local nnoremap = Remap.nnoremap
local onoremap = Remap.onoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local silent = { silent = true }

-- inoremaps
inoremap("jj", "<Esc>")

-- nnoremaps
nnoremap("<esc><esc>", ":nohl<CR>", silent)
nnoremap("<leader>pv", ":Ex<CR>")
-- nnoremap("<tab><tab>", "<C-^>") -- Move between previous/current buffer

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap("n", "'Nn'[v:searchforward]", { expr = true })
xnoremap("n", "'Nn'[v:searchforward]", { expr = true })
onoremap("n", "'Nn'[v:searchforward]", { expr = true })
nnoremap("N", "'nN'[v:searchforward]", { expr = true })
xnoremap("N", "'nN'[v:searchforward]", { expr = true })
onoremap("N", "'nN'[v:searchforward]", { expr = true })

-- Better indenting
nmap("<", "V<gv")
nmap(">", "V>gv")
xnoremap("<", "<gv")
xnoremap(">", ">gv")

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

nnoremap("J", ":MoveLine(1)<CR>", silent)
nnoremap("K", ":MoveLine(-1)<CR>", silent)

vnoremap("J", ":MoveBlock(1)<CR>", silent)
vnoremap("K", ":MoveBlock(-1)<CR>", silent)
vnoremap("H", ":MoveHBlock(-1)<CR>", silent)
vnoremap("L", ":MoveHBlock(1)<CR>", silent)

-- "SHIFT+ENTER" will continue comments, but regular "ENTER" won't
inoremap("<S-Enter>", "<C-\\><C-O>:setl fo+=r<CR><CR><C-\\><C-O>:setl fo-=r<CR>")

-- Format the JSON
if vim.fn.executable("jq") == 1 then nnoremap("<leader>fj", ":%!jq .<CR>", silent) end
