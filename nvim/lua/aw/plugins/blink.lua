-------------------------------------------------------------------------------
-- Completion: blink.cmp
-------------------------------------------------------------------------------
require("blink.cmp").setup({
    keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
    },
    snippets = { preset = "luasnip" },
    completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        menu = { border = "rounded" },
        documentation = { auto_show = true, window = { border = "rounded" } },
        ghost_text = { enabled = true },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },
    signature = { enabled = true },
    fuzzy = {
        implementation = "prefer_rust_with_warning",
        prebuilt_binaries = { download = true },
    },
})
