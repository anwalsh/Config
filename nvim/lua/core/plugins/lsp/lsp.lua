local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local navic = require("nvim-navic")
local path = util.path
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(binding, cmd)
        local opts = { noremap = true, silent = true }
        require("core.plugins.lsp.code").setup(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", binding, cmd, opts)
    end

    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    if filetype == "rust" then
        buf_set_keymap("gle", "<cmd>lua vim.lsp.codelens.refresh()<CR>")
        buf_set_keymap("glr", "<cmd>lua vim.lsp.codelens.run()<CR>")
    elseif filetype == "go" then
        -- gopls requires a require to list workspace arguments.
        buf_set_keymap("fs", "lua require('telescope.builtin').lsp_workspace_symbols { query = vim.fn.input('Query: ')")
    end

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
        })

        if client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end
    end
end

-- organize imports
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function OrganizeImports(timeoutms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = "▎",
        spacing = 6,
    },
    float = {
        source = "always",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
-------------------------------------------------------------------------------
-- gopls
-------------------------------------------------------------------------------
lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            gofumpt = true,
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                -- fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            -- usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-node_modules" },
            semanticTokens = true,
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
})

-------------------------------------------------------------------------------
-- golangci-lint-langserver
-------------------------------------------------------------------------------
require("lspconfig").golangci_lint_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 200 },
})

-------------------------------------------------------------------------------
-- rust-analyzer
-------------------------------------------------------------------------------
require("rust-tools").setup({
    tools = {
        autoSetHints = true,
        runnables = { use_telescope = true },
        inlay_hints = {
            show_parameter_hints = true,
            highlight = "Whitespace",
        },
        hover_actions = { auto_focus = true },
        executor = {
            execute_command = function(command, args)
                vim.cmd("T " .. require("rust-tools.utils.utils").make_command_from_args(command, args))
            end,
        },
    },
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 200,
        },
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
                completion = {
                    autoimport = {
                        enable = true,
                    },
                },
            },
        },
    },
})

-------------------------------------------------------------------------------
-- lua
-------------------------------------------------------------------------------
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
})

-------------------------------------------------------------------------------
-- ccls
-------------------------------------------------------------------------------
lspconfig.ccls.setup({
    capabilites = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
})

-------------------------------------------------------------------------------
-- Python Poetry/Venv
-------------------------------------------------------------------------------
local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then return path.join(vim.env.VIRTUAL_ENV, "bin", "python") end

    -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
        return path.join(venv, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

-------------------------------------------------------------------------------
-- pyright
-------------------------------------------------------------------------------
lspconfig.pyright.setup({
    capabilites = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
    on_init = function(client) client.config.settings.python.pythonPath = get_python_path(client.config.root_dir) end,
    settings = {
        typeCheckingMode = "basic",
    },
})

-------------------------------------------------------------------------------
-- pylsp
-------------------------------------------------------------------------------
-- require'lspconfig'.pylsp.setup{
--     capabilities = capabilities,
--     flags = { debounce_text_changes = 200 },
--     on_attach = on_attach,
--     on_init = function(client)
--         client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
--     end,
--     settings = {
--         pylsp = {
--             plugins = {
--                 -- pyflakes = { enabled = false },
--                 pylint = { enabled = true },
--                 pycodestyle = {
--                       ignore = {'W391'},
--                       maxLineLength = 100
--                 },
--                 black = {
--                     enabled = true,
--                     maxLineLength = 100
--                 },
--                 yapf = {
--                     enabled = false,
--                 },
--                 flake8 = {
--                     enabled = false,
--                 },
--             }
--         }
--     }
-- }

-------------------------------------------------------------------------------
-- Latex/Markdown
-------------------------------------------------------------------------------
lspconfig.ltex.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ltex = {
            cmd = { "ltex-ls" },
            single_file_support = true,
            filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "text" },
        },
    },
})

require("lspconfig").marksman.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-------------------------------------------------------------------------------
-- yamlls
-------------------------------------------------------------------------------
lspconfig.yamlls.setup({
    capabilities = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
})

-------------------------------------------------------------------------------
-- misc
-------------------------------------------------------------------------------
-- lsp-trouble.nvim
require("trouble").setup({
    auto_preview = false,
    auto_close = true,
    action_keys = {
        -- default binding is <esc> for this and it confuses me endlessly that I
        -- can't just escape in that window.
        cancel = {},
    },
})

vim.api.nvim_set_keymap(
    "n",
    "<leader>xx",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)

-- Icons
local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌶 ",
    Info = " ",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({ virtual_text = true, signs = true, update_in_insert = true, severity_sort = true })

-- vim.notify = function(msg, log_level, _opts)
--     if msg:match("exit code") then return end
--     if log_level == vim.log.levels.ERROR then
--         vim.api.nvim_err_writeln(msg)
--     else
--         vim.api.nvim_echo({ { msg } }, true, {})
--     end
-- end

-- Organize Go Imports and autoimport missing Imports
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end,
})

-------------------------------------------------------------------------------
-- Semantic Highlighting
-------------------------------------------------------------------------------
local links = {
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.struct"] = "@structure",
    ["@lsp.type.parameter"] = "Normal",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.method"] = "@method",
    ["@lsp.type.macro"] = "@macro",
    ["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
    vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
-------------------------------------------------------------------------------
-- Helpers
-------------------------------------------------------------------------------

function _G.workspace_diagnostics_status()
    if #vim.lsp.buf_get_clients() == 0 then return "" end

    local status = {}
    local errors = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR } }
    )
    if errors > 0 then table.insert(status, "E: " .. errors) end

    local warnings = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.WARNING, max = vim.diagnostic.severity.WARNING } }
    )
    if warnings > 0 then table.insert(status, "W: " .. warnings) end

    local hints = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.HINT, max = vim.diagnostic.severity.HINT } }
    )
    if hints > 0 then table.insert(status, "H: " .. hints) end

    local infos = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.INFO, max = vim.diagnostic.severity.INFO } }
    )
    if infos > 0 then table.insert(status, "I: " .. infos) end

    return table.concat(status, " | ")
end
