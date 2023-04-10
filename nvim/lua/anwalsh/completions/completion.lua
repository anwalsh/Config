if not pcall(require, "cmp") then return end
if not pcall(require, "luasnip") then return end
if not pcall(require, "lspkind") then return end

local config = {}

function config.nvim_cmp()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end
    -- local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end
    -- local check_back_space = function()
    --     local col = vim.fn.col(".") - 1
    --     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    -- end
    local sources = {
        { name = "nvim_lsp",  max_item_count = 10 },
        { name = "nvim_lua",  max_item_count = 10 },
        { name = "luasnip" },
        { name = "buffer",    max_item_count = 5, keyword_length = 3 },
        { name = "path",      max_item_count = 5 },
        { name = "treesitter" },
    }
    if vim.o.ft == "norg" then
        table.insert(sources, { name = "neorg" })
        table.insert(sources, { name = "spell" })
    end
    if vim.o.ft == "markdown" or vim.o.ft == "txt" or vim.o.ft == "html" or vim.o.ft == "gitcommit" then
        table.insert({ name = "spell" }, sources)
    end
    if vim.o.ft == "zsh" or vim.o.ft == "sh" or vim.o.ft == "fish" or vim.o.ft == "proto" then
        table.insert({ name = "buffer", keyword_length = 3 }, sources)
        table.insert(sources, { name = "calc" })
    end

    cmp.setup({
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        completion = {
            autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
            completeopt = "menu,menuone,noselect",
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
            ["<C-e>"] = function(_)
                if cmp.visible() then
                    cmp.abort()
                    cmp.close()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, true, true), "i", true)
                end
            end,
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
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
        sources = sources,
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
end

return config
