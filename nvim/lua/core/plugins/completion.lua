local M = {
    { "f3fora/cmp-spell", ft = { "gitcommit", "NeogitCommitMessage", "markdown", "norg", "org" } },
    { "rcarriga/cmp-dap" },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "onsails/lspkind.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-emoji" },
            { "hrsh7th/cmp-cmdline" },
            { "octaltree/cmp-look" },
            { "saecki/crates.nvim" },
            { "ray-x/cmp-treesitter" },
            { "tamago324/cmp-zsh" },
            { "mtoohey31/cmp-fish",                  ft = "fish" },
            { "saadparwaiz1/cmp_luasnip" },
            { "lukas-reineke/cmp-under-comparator" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-nvim-lsp-document-symbol" },
            { "lukas-reineke/cmp-rg" },
            { "petertriho/cmp-git",                  opts = { filetypes = { "gitcommit", "NeogitCommitMessage" } } },
            { "abecodes/tabout.nvim",                opts = { ignore_beginning = false, completion = false } },
            {
                "saadparwaiz1/cmp_luasnip",
                dependencies = "L3MON4D3/LuaSnip",
                lazy = false,
            },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            local has_words_before = function()
                if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
            end
            -- local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end
            -- local check_back_space = function()
            --     local col = vim.fn.col(".") - 1
            --     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
            -- end

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp",  max_item_count = 10 },
                    { name = "nvim_lua",  max_item_count = 10 },
                    { name = "luasnip" },
                    { name = "buffer",    max_item_count = 5, keyword_length = 3 },
                    { name = "path",      max_item_count = 5 },
                    { name = "treesitter" },
                    { name = "crates" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        with_text = true,
                        menu = {
                            buffer = "[Buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            path = "[Path]",
                            lusasnip = "[Snip]",
                            treesitter = "[TS]",
                            crates = "[C]",
                        },
                        mode = "symbol_text",
                        maxwidth = 50,
                    }),
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = function(_)
                        if cmp.visible() then
                            cmp.abort()
                            cmp.close()
                        else
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, true, true), "i", true)
                        end
                    end,
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                },
                experimental = { ghost_text = true },
            })
            cmp.setup.filetype({ "markdown", "txt" }, {
                sources = {
                    {
                        name = "look",
                        keyword_length = 2,
                        option = {
                            convert_case = true,
                            loud = true,
                        },
                    },
                    { name = "emoji", insert = true },
                },
            })
        end,
    },
}
return M
