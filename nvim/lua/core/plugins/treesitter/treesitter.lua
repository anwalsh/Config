local M = {
    config = function()
        local settings = require("core.settings")
        require("nvim-treesitter.configs").setup({
            sync_install = true,
            auto_install = true,
            parser_install_dir = "$HOME/.local/share/treesitter",
            ensure_installed = settings.treesitter_ensure_installed,
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            ignore_install = { "phpdoc" },
            indent = { enable = true },
            matchup = { enable = true },
            autopairs = { enable = true },
            navigation = {
                enable = false,
                keymaps = {
                    list_definitions = "ld", -- mapping to list all definitions in current file
                },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end,
}

return M
