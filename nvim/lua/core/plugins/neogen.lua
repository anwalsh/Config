local M = {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
            enabled = true,
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings",
                    },
                },
                rust = {
                    template = {
                        annotation_convention = "rustdoc",
                    },
                },
                go = {
                    template = {
                        annotation_convention = "godoc",
                    },
                },
            },
        })
    end,
}

return M
