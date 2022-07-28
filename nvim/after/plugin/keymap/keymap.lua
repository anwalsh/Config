local Remap = require("anwalsh.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nvim_set_keymap = vim.api.nvim_set_keymap

local silent = { silent = true }

vim.api.nvim_set_keymap(
    "n",
    "<leader>pp",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)

-- inoremaps
inoremap("jj", "<Esc>")
-- nnoremaps
nnoremap("<esc><esc>", ":nohl<CR>", silent)
nnoremap("<leader>q", ":b#<bar>bd#<CR>", silent)
nnoremap("<leader>Q", ":q")
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>ut", ":UndotreeToggle<CR>")
nnoremap("<leader>bn", ":bn<CR>")
nnoremap("<leader>bp", ":bp<CR>")
nnoremap("<tab><tab>", "<C-^>") -- Move between previous/current buffer
-- Window Nav
nnoremap("<leader>wj", "<C-w>j")
nnoremap("<leader>wk", "<C-w>k")
nnoremap("<leader>wl", "<C-w>l")
nnoremap("<leader>wh", "<C-w>h")
-- Make this buffer (current) the only split
nnoremap("<leader>wo", ":only<CR>")
-- Better Visual mode Indention
vnoremap(">", ">gv")
vnoremap(">", "<gv")

