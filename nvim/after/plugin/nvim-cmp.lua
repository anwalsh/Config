local lspkind = require("lspkind")
local cmp = require("cmp")

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then return end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert,noselect",
    },
    sources = {
        { name = "nvim_lsp",  max_item_count = 10 },
        { name = "nvim_lua",  max_item_count = 10 },
        { name = "luasnip" },
        { name = "buffer",    max_item_count = 5, keyword_length = 5 },
        { name = "path",      max_item_count = 5 },
        { name = "treesitter" },
    },
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
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
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item()
            elseif luasnip.choice_active() then
                luasnip.change_choice(1)
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
            elseif luasnip.choice_active() then
                luasnip.change_choice(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    experimental = {
        ghost_text = true,
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
