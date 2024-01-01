local prettier = { "prettierd", "prettier" }

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    keys = {
        {
            "=",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            javascript = { prettier },
            typescript = { prettier },
            javascriptreact = { prettier },
            typescriptreact = { prettier },
            css = { prettier },
            html = { prettier },
            json = { prettier },
            jsonc = { prettier },
            markdown = { prettier },
            ["markdown.mdx"] = { prettier },
            graphql = { prettier },
            lua = { "stylua" },
            go = { "goimports", "gofumpt", "golines" },
            fish = { "fish_indent" },
            sh = { "shfmt", "shellcheck", "shellharden" },
            terraform = { "terraform_fmt" },
            python = { "ruff", "isort", "black" },
            rust = { "rustfmt" },
            yaml = { "yamlfmt" },
            zig = { "zigfmt" },
        },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2", "-ci" },
            },
            dprint = {
                condition = function(ctx)
                    return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
                end,
            },
        },
        lsp_fallback = true,
        log_level = vim.log.levels.DEBUG,
        format_on_save = function(buf)
            if vim.g.formatting_disabled or vim.b[buf].formatting_disabled then return end
            return { timeout_ms = 500, lsp_fallback = true }
        end,
    },
}
