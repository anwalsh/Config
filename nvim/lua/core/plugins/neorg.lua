local M = {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },                             -- Adds completion to Norg files
                ["core.export"] = {},          -- Support export to other support filetypes
                ["core.export.markdown"] = {}, -- Interface for export to export to Mardkown
                ["core.dirman"] = {            -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            kb = "~/Gitlocal/github.com/anwalsh/kb",
                        },
                    },
                },
            },
        })
    end,
}

return M
