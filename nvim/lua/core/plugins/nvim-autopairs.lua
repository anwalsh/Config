local M = {
    "windwp/nvim-autopairs",
    {
        "eraserhd/parinfer-rust",
        build = "cargo build --release",
        lazy = false,
    },
    lazy = false,
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        local autopairs = require("nvim-autopairs")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        autopairs.setup({
            close_triple_quotes = true,
            check_ts = true,
            fast_wrap = { map = "<c-e>" },
            ts_config = {
                lua = { "string" },
                dart = { "string" },
                javascript = { "template_string" },
            },
        })
        require("parinfer-rust").setup()
    end,
}

return M
