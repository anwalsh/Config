local M = {
    "saecki/crates.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function() require("crates").setup() end,
}

return M
