local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp = require("cmp")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert,noselect",
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "treesitter" },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[lua]",
                path = "[path]",
                lusasnip = "[snip]",
                look = "[Look]",
                treesitter = "[ts]",
            },
            -- defines how annotations are shown
            -- default: symbol
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = 'symbol_text',
            -- prevent the popup from showing more than 50 chars
            maxwidth = 50,
        })
    },
    mapping = {
        -- Enable "super tab" option for luasnip
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ['<C-n>'] = {
            i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        },
        ['<C-p>'] = {
            i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        },
        ['<C-b>'] = {
            i = cmp.mapping.scroll_docs(-4),
        },
        ['<C-f>'] = {
            i = cmp.mapping.scroll_docs(4),
        },
        ['<C-Enter>'] = {
            i = cmp.mapping.complete(),
        },
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
        }),
        ['<C-y>'] = {
            i = cmp.mapping.confirm({ select = true }),
        },
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
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})

-- Overrides for specific filetypes
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
