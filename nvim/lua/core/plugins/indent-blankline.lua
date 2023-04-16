local M = {
    "lukas-reineke/indent-blankline.nvim", 
    lazy = false,
    config = function()
        local global = vim.api.nvim_set_var
        local nvim_cmd = vim.api.nvim_command

        nvim_cmd([[hi IndentBlanklineChar guifg=#6272a4 gui=nocombine]])

        require("indent_blankline").setup({
            show_end_of_line = true,
            use_treesitter = true,
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
            show_first_indent_level = true,
            filetype_exclude = {
                'dbout', 'neo-tree-popup', 'log', 'gitcommit',
                'txt', 'help', 'NvimTree', 'git', 'flutterToolsOutline',
                'undotree', 'markdown', 'norg', 'org', 'orgagenda',
                '', -- for all buffers without a file type
            },
        })
    end,
}

return M
