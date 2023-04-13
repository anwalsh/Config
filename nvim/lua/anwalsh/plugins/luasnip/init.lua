return {
    -- FIXME: https://github.com/L3MON4D3/LuaSnip/issues/129
    -- causes formatting bugs on save when update events are TextChanged{I}
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            local types = require("luasnip.util.types")
            local extras = require("luasnip.extras")
            local parser = require("luasnip.util.parser").parse_snippet
            local fmt = require("luasnip.extras.fmt").fmt
            local fmta = require("luasnip.extras.fmt").fmta
            local snip_path = { os.getenv("DOTFILES_HOME") .. "nvim/lua/anwalsh/snippets/" }

            ls.config.set_config({
                history = true,
                loaders_store_source = true,
                update_events = "TextChanged,TextChangedI",
                region_check_events = "CursorMoved,CursorHold,InsertEnter",
                delete_check_events = "TextChanged",
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            hl_mode = "combine",
                            virt_text = { { "●", "Operator" } },
                        },
                    },
                    [types.insertNode] = {
                        active = {
                            hl_mode = "combine",
                            virt_text = { { "●", "Type" } },
                        },
                    },
                },
                enable_autosnippets = true,
                snip_env = {
                    -- https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/config.lua#L22
                    fmt = fmt,
                    fmta = fmta,
                    m = extras.match,
                    t = ls.text_node,
                    f = ls.function_node,
                    c = ls.choice_node,
                    d = ls.dynamic_node,
                    i = ls.insert_node,
                    l = extras.lamda,
                    snippet = ls.snippet,
                    parse = parser,
                },
            })

            Command("LuaSnipEdit", function() require("luasnip.loaders.from_lua").edit_snippet_files() end)

            vim.keymap.set({ "i", "s" }, "<C-l>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-l>", true, true, true), "n", true)
                end
            end)

            vim.keymap.set({ "i", "s" }, "<C-h>", function()
                if ls.choice_active() then
                    ls.change_choice(-1)
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, true, true), "n", true)
                end
            end)

            -- Load the snippets
            require("luasnip").filetype_extend("go", { "go" })
            require("luasnip").filetype_extend("python", { "python" })
            require("luasnip").filetype_extend("rust", { "rust" })
            require("luasnip.loaders.from_lua").load({ paths = snip_path })
        end,
    },
    {
        "benfowler/telescope-luasnip.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function() require("telescope").load_extension("luasnip") end,
    },
}
