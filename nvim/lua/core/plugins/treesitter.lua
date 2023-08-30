local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-endwise",
        "mfussenegger/nvim-ts-hint-textobject",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/playground",
        { "windwp/nvim-ts-autotag", opts = {} },
        { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
        {
            "nvim-treesitter/nvim-treesitter-context",
            event = "BufReadPre",
            enabled = true,
            opts = { mode = "cursor" },
        },
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = require("core.settings").treesitter_ensure_installed,
            auto_install = true,
            sync_install = true,
            ignore_install = {},
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {}, -- list of language that will be disabled
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    scope_incremental = "<CR>",
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            endwise = {
                enable = true,
            },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
            indent = { enable = true },
            autopairs = { enable = true },
            matchup = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ib"] = "@block.inner",
                        ["ab"] = "@block.outer",
                        ["ir"] = "@parameter.inner",
                        ["ar"] = "@parameter.outer",
                    },
                },
            },
        })
        require("nvim-ts-autotag").setup()
    end,
}

return M
