if not pcall(require, "luasnip") then return end

local ls = require("luasnip")

ls.config.setup({
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = "<C-Tab>",
    -- resolve current filetype from cursor in e.g. markdown code blocks or `vim.cmd()`
    ft_func = require("luasnip.extras.filetype_functions").from_cursor,
})

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

require("luasnip.loaders.from_lua").load({ paths = { os.getenv("DOTFILES_HOME") .. "nvim/lua/anwalsh/snippets" } })
