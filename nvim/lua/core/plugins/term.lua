local M = {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            size = 10,
            open_mapping = "<F4>",
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true,
            persist_size = true,
            direction = "horizontal",
            autochdir = true,
            close_on_exit = true,
            float_opts = {
                border = "curved",
                width = 70,
                height = 20,
                winblend = 0,
                highlights = {
                    border = "Special",
                    background = "Normal",
                },
            },
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        local float_handler = function(term)
            if not as.falsy(fn.mapcheck("jk", "t")) then
                vim.keymap.del("t", "jk", { buffer = term.bufnr })
                vim.keymap.del("t", "<esc>", { buffer = term.bufnr })
            end
        end

        local Terminal = require("toggleterm.terminal").Terminal

        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            hidden = true,
            direction = "float",
            on_open = float_handler,
        })

        function lazygit_toggle() lazygit:toggle() end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
}
return M
