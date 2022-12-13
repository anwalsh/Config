local Remap = require("anwalsh.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nvim_set_keymap = vim.api.nvim_set_keymap

local silent = { silent = true }

-- inoremaps
inoremap("jj", "<Esc>")

-- nnoremaps
nnoremap("<esc><esc>", ":nohl<CR>", silent)
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<tab><tab>", "<C-^>") -- Move between previous/current buffer

-- Better Visual mode Indention
vnoremap(">", ">gv")
vnoremap("<", "<gv")

-- Center the lines yo
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
