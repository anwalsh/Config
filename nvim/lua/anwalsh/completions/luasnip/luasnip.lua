if not pcall(require, "luasnip") then return end

local snip_path = { os.getenv("DOTFILES_HOME") .. "nvim/lua/anwalsh/snippets/" }
local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_lua").load({ paths = snip_path })

ls.config.set_config({
    --{{{
    history = true, --keep around last snippet local to jump back
    -- store_selection_keys = "<c-s>",
    store_selection_keys = "<A-p>",
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
    ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " ", "TSTextReference" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { " ", "TSEmphasis" } },
            },
        },
    },
}) --}}}

-- Key Mapping --{{{
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        vim.cmd([[exe "normal \<Esc>O"]])
    end
end, { silent = true, desc = "luasnip jump" })

vim.keymap.set({ "i", "s" }, "<c-s>", "<Esc>:w<cr>")
vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

vim.keymap.set({ "i", "s" }, "<A-p>", function()
    if ls.expand_or_jumpable() then ls.expand() end
end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
-- 	if ls.expand_or_jumpable() then
-- 		ls.expand_or_jump()
-- 	end
-- end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
-- 	if ls.jumpable() then
-- 		ls.jump(-1)
-- 	end
-- end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-y>", "<Esc>o", { silent = true })

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.jumpable(1) then ls.jump(1) end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    else
        -- print current time
        local t = os.date("*t")
        local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
        print(time)
    end
end)
vim.keymap.set({ "i", "s" }, "<A-h>", function()
    if ls.choice_active() then ls.change_choice(-1) end
end) --}}}

-- More Settings --

vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })

ls.config.set_config({
    --{{{
    store_selection_keys = "<c-s>",
    updateevents = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " ", "TSTextReference" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { " ", "TSEmphasis" } },
            },
        },
    },
}) --}}}

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

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])
