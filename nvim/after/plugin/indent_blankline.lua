local global = vim.api.nvim_set_var
local nvim_cmd = vim.api.nvim_command

global("indent_blankline_use_treesitter", true)
global("indent_blankline_show_first_indent_level", false)
global("indent_blankline_filetype_exclude", {"dashboard", "help", "packer", "coc-explorer"})

nvim_cmd([[hi IndentBlanklineChar guifg=#6272a4 gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
