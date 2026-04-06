-------------------------------------------------------------------------------
-- Format: conform.nvim
-------------------------------------------------------------------------------
local prettier = { "prettierd", "prettier" }

require("conform").setup({
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
        shfmt = { prepend_args = { "-i", "2", "-ci" } },
        dprint = {
            condition = function(ctx)
                return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
            end,
        },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

-- Format keymap
vim.keymap.set("", "=", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
