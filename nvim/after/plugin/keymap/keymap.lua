local Remap = require("anwalsh.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nvim_set_keymap = vim.api.nvim_set_keymap


vim.api.nvim_set_keymap(
    "n",
    "<leader>pp",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)

-- inoremaps
inoremap("jj", "<Esc>")

-- nnoremaps
nnoremap("<leader>q", ":q")
nnoremap("<leader>w", ":w")
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeToggle<CR>")
