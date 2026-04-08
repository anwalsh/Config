-------------------------------------------------------------------------------
-- Format: conform.nvim
-------------------------------------------------------------------------------
require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        ["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        go = { "goimports", "gofumpt", "golines", stop_after_first = true },
        fish = { "fish_indent" },
        sh = { "shfmt", "shellcheck", "shellharden", stop_after_first = true },
        terraform = { "terraform_fmt" },
        python = { "ruff", "isort", "black", stop_after_first = true },
        rust = { "rustfmt" },
        yaml = { "yamlfmt" },
        zig = { "zigfmt" },
    },
    formatters = {
        shfmt = { prepend_args = { "-i", "2", "-ci" } },
        dprint = {
            condition = function(ctx) return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1] end,
        },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

-- Format keymap
vim.keymap.set(
    "",
    "=",
    function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
    { desc = "Format buffer" }
)
