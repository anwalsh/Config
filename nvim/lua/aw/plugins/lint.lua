-------------------------------------------------------------------------------
-- Lint: nvim-lint
-------------------------------------------------------------------------------
require("lint").linters_by_ft = {
    bash = { "shellcheck" },
    dockerfile = { "hadolint" },
    fish = { "fish" },
    javascript = { "eslint" },
    markdown = { "markdownlint" },
    go = { "golangcilint" },
    commit = { "commitlint" },
    dotenv = { "dotenv_linter" },
    gitcommit = { "commitlint" },
    python = { "ruff" },
    sh = { "shellcheck" },
    lua = { "luacheck" },
    terraform = { "terraform_validate" },
    yaml = { "yamllint" },
    zsh = { "shellcheck" },
    ["*"] = { "spell" },
}

vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufReadPost", "InsertLeave" }, {
    callback = function() require("lint").try_lint() end,
})
