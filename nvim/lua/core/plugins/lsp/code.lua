local wk = require("which-key")
local M = {}

function M.setup(client, buffer)
    local cap = client.server_capabilities

    local keymap = {
        buffer = buffer,
        ["<leader>"] = {
            ["c"] = {
                name = "+code",
                s = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
                r = {
                    function() return string.format(":IncRename %s", vim.fn.expand("<cword>")) end,
                    "Rename",
                    cond = cap.renameProvider,
                    expr = true,
                    silent = false,
                },
                a = {
                    { vim.lsp.buf.code_action, "Code Action" },
                    { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
                },
                A = { "<cmd>lua require('neogen').generate()<cr>", "Create Annotation", mode = "n" },
                f = {
                    {
                        require("core.plugins.lsp.formatting").format,
                        "Format Document",
                        cond = cap.documentFormatting,
                    },
                    {
                        require("core.plugins.lsp.formatting").format,
                        "Format Range",
                        cond = cap.documentRangeFormatting,
                        mode = "v",
                    },
                },
                D = {
                    function()
                        require("telescope.builtin").lsp_document_symbols({
                            symbols = {
                                "Class",
                                "Function",
                                "Method",
                                "Constructor",
                                "Interface",
                                "Module",
                                "Struct",
                                "Trait",
                            },
                        })
                    end,
                    "Goto Symbol",
                },
                S = {
                    function()
                        require("telescope.builtin").lsp_dynamic_workspace_symbols({
                            symbols = {
                                "Class",
                                "Function",
                                "Method",
                                "Constructor",
                                "Interface",
                                "Module",
                                "Struct",
                                "Trait",
                            },
                        })
                    end,
                    "Goto Workspace Symbol",
                },
                d = { vim.diagnostic.open_float, "Line Diagnostics" },
                l = {
                    name = "+lsp",
                    i = { "<cmd>LspInfo<cr>", "Lsp Info" },
                    a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
                    r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
                    l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
                },
            },
            x = {
                d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
            },
        },
        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
        ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
        ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev Error" },
        ["[w"] = {
            "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
            "Next Warning",
        },
        ["]w"] = {
            "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
            "Prev Warning",
        },
    }

    wk.register(keymap)
end

return M
