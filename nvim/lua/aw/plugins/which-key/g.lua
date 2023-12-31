local wk = require("which-key")

wk.register({
    w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol" },
    s = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol" },
    d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
    D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
    I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
}, { prefix = "g" })
