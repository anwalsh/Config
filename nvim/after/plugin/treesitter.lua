require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ignore_install = { "phpdoc" },
    indent = { enable = true },
    matchup = { enable = true },
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
}
