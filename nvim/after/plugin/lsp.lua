local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(binding, cmd)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", binding, cmd, opts)
  end
-- keybindings
  buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  buf_set_keymap("gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  buf_set_keymap("gR", "<cmd>lua vim.lsp.buf.references()<CR>")
  buf_set_keymap("gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  buf_set_keymap("gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  buf_set_keymap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_set_keymap("g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_set_keymap("g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  buf_set_keymap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  if filetype == "rust" then
    buf_set_keymap("gle", "<cmd>lua vim.lsp.codelens.refresh()<CR>")
    buf_set_keymap("glr", "<cmd>lua vim.lsp.codelens.run()<CR>")
  elseif filetype == "go" then
    -- gopls requires a require to list workspace arguments.
    buf_set_keymap(
      "fs",
      "lua require('telescope.builtin').lsp_workspace_symbols { query = vim.fn.input('Query: ')"
    )
  end
end

vim.diagnostic.config { float = { source = "always" } }

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-------------------------------------------------------------------------------
-- gopls
-------------------------------------------------------------------------------
lspconfig.gopls.setup {
  capabilities = capabilities,
  flags = { debounce_text_changes = 200 },
  on_attach = on_attach,
  settings = {
    gopls = {
      completeUnimported = true,
      buildFlags = { "-tags=debug" },
      analyses = {
        unusedparams = true,
      },
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
}

-------------------------------------------------------------------------------
-- rust-analyzer
-------------------------------------------------------------------------------
require("rust-tools").setup {
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
}

-------------------------------------------------------------------------------
-- pyright
-------------------------------------------------------------------------------
-- lspconfig.pyright.setup {
--     capabilites = capabilities,
--     flags = { debounce_text_changes = 200 },
--     on_attach = on_asttach,
--     settings = {},
-- }

-- lsp-trouble.nvim
require("trouble").setup {
  auto_preview = false,
  auto_close = true,
  action_keys = {
    -- default binding is <esc> for this and it confuses me endlessly that I
    -- can't just escape in that window.
    cancel = {},
  },
}

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
    Hint = " ",
    Info = " ",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
