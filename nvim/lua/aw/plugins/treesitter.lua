-------------------------------------------------------------------------------
-- Treesitter
-------------------------------------------------------------------------------
require("nvim-treesitter").setup({
    ensure_installed = require("aw.settings").treesitter_ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
})
