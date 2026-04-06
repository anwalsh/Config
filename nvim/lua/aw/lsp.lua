-------------------------------------------------------------------------------
-- LSP Configuration (Neovim 0.12 native API)
--
-- Uses vim.lsp.config() and vim.lsp.enable() instead of mason-lspconfig.
-- Mason is still used for installing servers.
-------------------------------------------------------------------------------
local settings = require("aw.settings")

-- Mason setup (server installer only, no auto-config)
require("mason").setup({
    max_concurrent_installers = PU_COUNT,
})

-------------------------------------------------------------------------------
-- Diagnostics
-------------------------------------------------------------------------------
vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = settings.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = settings.icons.diagnostics.Warn,
            [vim.diagnostic.severity.INFO] = settings.icons.diagnostics.Info,
            [vim.diagnostic.severity.HINT] = settings.icons.diagnostics.Hint,
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
    },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-------------------------------------------------------------------------------
-- on_attach
-------------------------------------------------------------------------------
local function toggle_inlay_hints(buf, value)
    local ih = vim.lsp.inlay_hint
    if type(ih) == "table" and ih.enable then
        if value == nil then value = not ih.is_enabled({ bufnr = buf }) end
        ih.enable(value, { bufnr = buf })
    end
end

local function on_attach(client, buffer)
    if client:supports_method("textDocument/inlayHint") then toggle_inlay_hints(buffer, true) end
    if client:supports_method("textDocument/documentSymbol") then
        pcall(require, "nvim-navic")
    end

    local function keymap(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
    end

    keymap("<localleader>cl", "<cmd>LspInfo<cr>", "LSP Info")
    keymap("gd", "<cmd>Telescope lsp_definitions<cr>", "Go to Definitions")
    keymap("gr", "<cmd>Telescope lsp_references<cr>", "Go to References")
    keymap("gt", "<cmd>Telescope lsp_type_definitions<cr>", "Go to Type Definition")
    keymap("K", vim.lsp.buf.hover, "Hover")
    keymap("gs", vim.lsp.buf.document_symbol, "Document Symbols")
    keymap("gw", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
    keymap("g0", "<cmd>Aerial toggle<cr>", "Aerial Outline")
    keymap("gI", vim.lsp.buf.implementation, "Go to Implementation")
    keymap("gD", vim.lsp.buf.declaration, "Go to Declarations")
    keymap("gR", vim.lsp.buf.references, "Go to References")
    keymap(",.", vim.diagnostic.open_float, "Line diagnostics")
    keymap("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
    keymap("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
    keymap("[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, "Previous Error")
    keymap("]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, "Next Error")
    keymap("[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end, "Previous Warning")
    keymap("]w", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end, "Next Warning")

    if client:supports_method("textDocument/codeAction") then
        keymap("ca", vim.lsp.buf.code_action, "Code Actions", { "n", "v" })
    end
    if client:supports_method("textDocument/rename") then
        keymap("<leader>cr", vim.lsp.buf.rename, "Rename")
    end
    if client:supports_method("textDocument/signatureHelp") then
        keymap("<C-k>", vim.lsp.buf.signature_help, "Signature help", "i")
    end
end

-- Attach keymaps on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        on_attach(client, args.buf)
    end,
})

-- Update mappings when registering dynamic capabilities
local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then return end
    on_attach(client, vim.api.nvim_get_current_buf())
    return register_capability(err, res, ctx)
end

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
-- Python path helper
-------------------------------------------------------------------------------
local function get_python_path()
    if vim.env.POETRY_ACTIVE == "1" then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
        return venv .. "/bin/python"
    elseif vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV .. "/bin/python"
    else
        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
    end
end

-------------------------------------------------------------------------------
-- Server configurations via vim.lsp.config()
-------------------------------------------------------------------------------

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git" },
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            completion = { workspaceWord = true, callSnippet = "Both" },
            hover = { expandAlias = false },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
            doc = { privateName = { "^_" } },
            type = { castNumberToInteger = true },
            diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                groupSeverity = { strong = "Warning", strict = "Warning" },
                groupFileStatus = {
                    ["ambiguity"] = "Opened",
                    ["await"] = "Opened",
                    ["codestyle"] = "None",
                    ["duplicate"] = "Opened",
                    ["global"] = "Opened",
                    ["luadoc"] = "Opened",
                    ["redefined"] = "Opened",
                    ["strict"] = "Opened",
                    ["strong"] = "Opened",
                    ["type-check"] = "Opened",
                    ["unbalanced"] = "Opened",
                    ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
            },
            format = {
                enable = true,
                defaultConfig = { indent_style = "space", indent_size = "2", continuation_indent_size = "2" },
            },
        },
    },
})

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            analyses = { unusedparams = true },
            staticcheck = true,
            experimentalPostfixCompletions = true,
            hints = {
                parameterNames = true,
                assignVariableTypes = true,
                constantValues = true,
                rangeVariableTypes = true,
                compositeLiteralTypes = true,
                compositeLiteralFields = true,
                functionTypeParameters = true,
            },
        },
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "compile_commands.json", ".clangd", ".git" },
    flags = { debounce_text_changes = 200 },
})

vim.lsp.config("jsonls", {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { ".git" },
    settings = {
        json = {
            validate = { enable = true },
            format = { enable = true },
        },
    },
    on_new_config = function(config)
        config.settings.json.schemas = config.settings.json.schemas or {}
        vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
    end,
})

vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
    on_init = function(client) client.config.settings.python = { pythonPath = get_python_path() } end,
    settings = { typeCheckingMode = "basic" },
})

vim.lsp.config("ltex", {
    cmd = { "ltex-ls" },
    filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "text" },
    root_markers = { ".git" },
})

vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown" },
    root_markers = { ".marksman.toml", ".git" },
})

vim.lsp.config("yamlls", {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    root_markers = { ".git" },
    flags = { debounce_text_changes = 200 },
})

vim.lsp.config("bashls", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_markers = { ".git" },
})

vim.lsp.config("dockerls", {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_markers = { "Dockerfile", ".git" },
})

vim.lsp.config("vtsls", {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    settings = {
        complete_function_calls = true,
        vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = { completion = { enableServerSideFuzzyMatch = true } },
        },
        typescript = {
            updateImportsOnFileMove = "always",
            suggest = { completeFunctionCalls = true },
            inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
            },
        },
    },
})

vim.lsp.config("eslint", {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", "package.json", ".git" },
    settings = { format = false },
})

vim.lsp.config("terraformls", {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "terraform-vars" },
    root_markers = { ".terraform", ".git" },
})

vim.lsp.config("zls", {
    cmd = { "zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig", ".git" },
    settings = {
        zls = {
            enable_inlay_hints = true,
            inlay_hints_show_builtin = true,
            include_at_in_builtins = true,
            warn_style = true,
        },
    },
})

vim.lsp.config("golangci_lint_ls", {
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
    root_markers = { "go.mod", ".golangci.yml", ".golangci.yaml", ".git" },
})

-- rust_analyzer is handled by rustaceanvim, not configured here.
-- rustaceanvim sets vim.g.rustaceanvim in plugins/misc.lua.

-------------------------------------------------------------------------------
-- Enable all configured servers
-------------------------------------------------------------------------------
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "clangd",
    "jsonls",
    "ty",
    "ltex",
    "marksman",
    "yamlls",
    "bashls",
    "dockerls",
    "vtsls",
    "eslint",
    "terraformls",
    "zls",
    "golangci_lint_ls",
})

-------------------------------------------------------------------------------
-- Navic setup
-------------------------------------------------------------------------------
require("nvim-navic").setup({
    icons = settings.icons.kinds,
    highlight = false,
    separator = " > ",
    depth_limit = 3,
    depth_limit_indicator = "..",
    safe_output = true,
    lsp = { auto_attach = true },
})
