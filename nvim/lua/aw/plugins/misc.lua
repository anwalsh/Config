-------------------------------------------------------------------------------
-- Misc plugin configurations
-- Small plugins that don't warrant their own file.
-------------------------------------------------------------------------------

-- mini.bufremove keymaps
vim.keymap.set("n", "<leader>bd", function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 1 then
            vim.cmd.write()
            bd(0)
        elseif choice == 2 then
            bd(0, true)
        end
    else
        bd(0)
    end
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete Buffer (Force)" })

-- Comment.nvim
require("Comment").setup({
    opleader = { line = "gc", block = "gb" },
    mappings = { basic = true, extra = true },
    toggler = { line = "gcc", block = "gbc" },
})
local comment_ft = require("Comment.ft")
comment_ft.set("lua", { "--%s", "--[[%s]]" })

-- Autopairs
require("nvim-autopairs").setup({
    close_triple_quotes = true,
    check_ts = true,
    fast_wrap = { map = "<c-e>" },
    ts_config = {
        lua = { "string" },
        dart = { "string" },
        javascript = { "template_string" },
    },
})

-- Surround
require("nvim-surround").setup({})

-- Treesj (replaces splitjoin)
require("treesj").setup({})

-- Yanky
require("yanky").setup({
    highlight = { timer = 250 },
    ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
})
vim.api.nvim_set_hl(0, "YankyPut", { link = "Substitute" })
vim.api.nvim_set_hl(0, "YankyYanked", { link = "Substitute" })
-- stylua: ignore start
vim.keymap.set("n", "<leader>P", function() require("telescope").extensions.yank_history.yank_history({}) end, { desc = "Open Yank History" })
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yank text" })
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Put yanked text after cursor" })
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Put yanked text before cursor" })
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "Put yanked text after selection" })
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "Put yanked text before selection" })
vim.keymap.set("n", "[y", "<Plug>(YankyCycleForward)", { desc = "Cycle forward through yank history" })
vim.keymap.set("n", "]y", "<Plug>(YankyCycleBackward)", { desc = "Cycle backward through yank history" })
vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)", { desc = "Put indented after cursor (linewise)" })
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)", { desc = "Put indented before cursor (linewise)" })
vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)", { desc = "Put and indent right" })
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", { desc = "Put and indent left" })
vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)", { desc = "Put after applying a filter" })
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)", { desc = "Put before applying a filter" })
-- stylua: ignore end

-- Trim
require("trim").setup({ ft_blocklist = { "gitcommit", "NeogitCommitMessage" } })

-- Inc-rename
require("inc_rename").setup({})

-- Neogen (docstrings)
require("neogen").setup({
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
        python = { template = { annotation_convention = "google_docstrings" } },
        rust = { template = { annotation_convention = "rustdoc" } },
        go = { template = { annotation_convention = "godoc" } },
    },
})

-- indent-blankline
require("ibl").setup()

-- mini.indentscope
require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble", "notify", "toggleterm" },
    callback = function() vim.b.miniindentscope_disable = true end,
})

-- Fidget (LSP progress)
require("fidget").setup({
    notification = { window = { relative = "editor" } },
})

-- Dressing (vim.ui overrides)
require("dressing").setup({})

-- Colorizer
require("colorizer").setup({})

-- Numb (peek line numbers)
require("numb").setup({})

-- Trouble
require("trouble").setup({})

-- Todo-comments
require("todo-comments").setup({})

-- Aerial
require("aerial").setup({
    backends = { "lsp", "treesitter", "markdown" },
    filter_kind = false,
})

-- BQF (better quickfix)
require("bqf").setup({
    auto_enable = true,
    auto_resize_height = true,
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        show_title = false,
        should_preview_cb = function(bufnr)
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then return false end
            if bufname:match("^fugitive://") then return false end
            return true
        end,
    },
    func_map = {
        drop = "o",
        openc = "O",
        split = "<C-s>",
        tabdrop = "<C-t>",
        tabc = "",
        ptogglemode = "z,",
    },
    filter = {
        fzf = {
            action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
    },
})

-- Legendary (command palette)
require("legendary").setup({})

-- Focus (auto-resize windows)
require("focus").setup({
    enable = true,
    excluded_filetypes = { "fterm", "term", "toggleterm" },
    bufnew = false,
})

-- Flatten (nested neovim instances)
require("flatten").setup({})

-- Zen Mode
require("zen-mode").setup({
    window = {
        width = 200,
        options = { number = true, relativenumber = true },
    },
    plugins = { gitsigns = true },
})

-- Spectre (find and replace)
require("spectre").setup({})
vim.keymap.set("n", "<leader>sr", function() require("spectre").open() end, { desc = "Search and Replace (Spectre)" })

-- SSR (structural search/replace)
require("ssr").setup({})
vim.keymap.set({ "n", "x" }, "<leader>sR", function() require("ssr").open() end, { desc = "Structural Search/Replace" })

-- Muren (multiple replace)
require("muren").setup({})

-- Crates (Cargo.toml)
require("crates").setup({})

-- Gopher (Go tooling)
require("gopher").setup({})

-- Venv Selector (Python)
require("venv-selector").setup({})

-- Mkdnflow (Markdown)
require("mkdnflow").setup({})

-- Harpoon
require("harpoon").setup({})

-- Octo (GitHub)
require("octo").setup({})

-- vim-abolish keymaps
vim.keymap.set("n", "<localleader>[", "<Plug>(abolish-coerce-word)", { desc = "Abolish coerce word" })
vim.keymap.set("n", "<localleader>]", "<Plug>(abolish-coerce)", { desc = "Abolish coerce" })

-- Rustaceanvim (configured via global variable, not setup())
vim.g.rustaceanvim = {
    tools = {
        autoSetHints = true,
        runnables = { use_telescope = true },
        inlay_hints = { show_parameter_hints = true, highlight = "Whitespace" },
        hover_actions = { auto_focus = true },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true, loadOutDirsFromCheck = true, runBuildScripts = true },
                checkOnSave = { allFeatures = true, command = "clippy", extraArgs = { "--no-deps" } },
                completion = { autoimport = { enable = true } },
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
            },
        },
    },
}
