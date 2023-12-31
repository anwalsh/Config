local null_ls = require("null-ls")
local actions = null_ls.builtins.code_actions
local diag = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local cmp = null_ls.builtins.completion

null_ls.setup({
    sources = {
        -- Diagnostics
        diag.commitlint,
        diag.dotenv_linter,
        diag.eslint,
        diag.fish,
        diag.hadolint,
        diag.luacheck,
        diag.markdownlint,
        diag.pylint,
        diag.mypy,
        diag.ruff,
        diag.shellcheck,
        diag.stylelint,
        diag.vint,
        diag.vulture,
        diag.yamllint,
        diag.pydocstyle,

        -- Hovers
        hover.dictionary,
        hover.printenv,

        -- Actions
        actions.gitsigns,
        actions.refactoring,
        actions.shellcheck,

        -- Completions
        cmp.spell,
    },
})
