if not pcall(require, "luasnip") then return end

local ls = require("luasnip")
local snip_path = { os.getenv("DOTFILES_HOME") .. "nvim/lua/anwalsh/snippets" }
local types = require("luasnip.util.types")

ls.config.setup({
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
})

-- <C-k> jump forward snip
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, { silent = true })

-- <C-j> jump backward snip
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

-- <C-l> list snip choices
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

require("luasnip.loaders.from_lua").load({ paths = snip_path })
