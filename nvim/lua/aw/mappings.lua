local Remap = require("aw.util.remapper")
local nmap = Remap.nmap
local noremap = Remap.noremap
local nnoremap = Remap.nnoremap
local onoremap = Remap.onoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local silent = { silent = true }
local map = vim.keymap.set

-- inoremaps
inoremap("jj", "<Esc>")
inoremap("jk", "<Esc>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap("n", "'Nn'[v:searchforward]", { expr = true })
xnoremap("n", "'Nn'[v:searchforward]", { expr = true })
onoremap("n", "'Nn'[v:searchforward]", { expr = true })
nnoremap("N", "'nN'[v:searchforward]", { expr = true })
xnoremap("N", "'nN'[v:searchforward]", { expr = true })
onoremap("N", "'nN'[v:searchforward]", { expr = true })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

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

-- Move Lines
nnoremap("<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
nnoremap("<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
inoremap("<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
inoremap("<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vnoremap("<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vnoremap("<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- "SHIFT+ENTER" will continue comments, but regular "ENTER" won't
inoremap("<S-Enter>", "<C-\\><C-O>:setl fo+=r<CR><CR><C-\\><C-O>:setl fo-=r<CR>")

-- Format the JSON
if vim.fn.executable("jq") == 1 then nnoremap("<leader>fj", ":%!jq .<CR>", silent) end
