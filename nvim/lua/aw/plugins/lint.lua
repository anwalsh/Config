return {
    "mfussenegger/nvim-lint",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    init = function()
        vim.api.nvim_create_autocmd({ "TextChanged" }, {
            callback = function() require("lint").try_lint() end,
        })
    end,
    config = function()
        require("lint").linters_by_ft = {
            bash = { "shellcheck" },
            dockerfile = { "hadolint" },
            fish = { "fish" },
            javascript = { "eslint" },
            markdown = { "markdownlint" },
            go = { "golangcilint" },
            commit = { "commitlint " },
            dotenv = { "dotenv_linter" },
            gitcommit = { "commitlint" },
            python = { "ruff", "mypy", "pylint" },
            sh = { "shellcheck" },
            lua = { "luacheck" },
            terraform = { "terraform_validate" },
            yaml = { "yamllint" },
            zsh = { "shellcheck" },
            ["*"] = { "spell" },
        }
    end,
}
