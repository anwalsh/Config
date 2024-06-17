local function toggle_inlay_hints(buf, value)
    local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
    if type(ih) == "function" then
        ih(buf, value)
    elseif type(ih) == "table" and ih.enable then
        if value == nil then value = not ih.is_enabled(buf) end
        ih.enable(value, { bufnr = buf })
    end
end

local M = {}

--- Returns the editor's capabilities
---@return lsp.ClientCapabilities
M.client_capabilities = function()
    return vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers.
        require("cmp_nvim_lsp").default_capabilities(),
        {
            workspace = {
                -- PERF: didChangeWatchedFiles is too slow.
                -- TODO: Remove this when https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265 is fixed.
                didChangeWatchedFiles = { dynamicRegistration = false },
            },
        }
    )
end

local function on_attach(client, buffer)
    -- InlayHint toggle
    if client.supports_method("textDocument/inlayHint") then toggle_inlay_hints(buffer, true) end

    -- Navic instantiation
    if client.supports_method("textDocument/symbolProvider") then require("nvim-navic") end

    ---@param lhs string
    ---@param rhs string|function
    ---@param desc string
    ---@param mode? string|string[]
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
    keymap("g0", "<cmd>SymbolsOutline<cr>", "Symbols Outline")
    keymap("gI", "<cmd>Telescope lsp_implementations<cr>", "Go to Implemenatation")
    keymap("gD", "<cmd>Telescope lsp_declarations<cr>", "Go to Declarations")
    keymap("gR", "<cmd>Trouble lsp_references<cr>", "Trouble References")
    keymap("<localleader>cd", vim.diagnostic.open_float, "Line diagnostics")
    keymap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    keymap("]d", vim.diagnostic.goto_next, "Next diagnostic")
    keymap(
        "[e",
        function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
        "Previous Error"
    )
    keymap("]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, "Next Error")
    keymap(
        "[w",
        function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING }) end,
        "Previous Warning"
    )
    keymap(
        "]w",
        function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING }) end,
        "Next Warning"
    )

    if client.supports_method("textDocument/codeAction") then
        keymap("ca", vim.lsp.buf.code_action, "Code Actions", { "n", "v" })
    end

    if client.supports_method("textDocument/rename") then keymap("<leader>cr", vim.lsp.buf.rename, "Rename") end

    if client.supports_method("textDocument/signatureHelp") then
        keymap("<C-k>", vim.lsp.buf.signature_help, "Signature help", "i")
    end
end

-- Diagnostics
for name, icon in pairs(require("aw.settings").icons.diagnostics) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name })
end

vim.diagnostic.config({
    virtual_text = {
        source = "if_many", -- was previously "always"
        prefix = "▎",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Update mappings when registering dynamic capabilities.
local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then return end

    on_attach(client, vim.api.nvim_get_current_buf())

    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- I don't think this can happen but it's a wild world out there.
        if not client then return end

        on_attach(client, args.buf)
    end,
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

return M
