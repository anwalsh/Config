local lspconfig = require "lspconfig"
local util = require('lspconfig/util')
local path = util.path

require("mason").setup()
require("mason-lspconfig").setup()

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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "ltex", "marksman", "bashls", },
}

-------------------------------------------------------------------------------
-- gopls
-------------------------------------------------------------------------------
lspconfig.gopls.setup {
  capabilities = capabilities,
  flags = { debounce_text_changes = 200 },
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true,
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
-- golangci-lint-langserver
-------------------------------------------------------------------------------
require'lspconfig'.golangci_lint_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 200 },
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
-- lua
-------------------------------------------------------------------------------
lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach
}

-------------------------------------------------------------------------------
-- ccls
-------------------------------------------------------------------------------
lspconfig.ccls.setup {
    capabilites = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
}

-------------------------------------------------------------------------------
-- Python Poetry/Venv
-------------------------------------------------------------------------------
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

-------------------------------------------------------------------------------
-- pyright
-------------------------------------------------------------------------------
lspconfig.pyright.setup {
    capabilites = capabilities,
    flags = { debounce_text_changes = 200 },
    on_attach = on_attach,
    on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
    end,
    settings = {
        typeCheckingMode = "basic",
    }
}

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
lspconfig.ltex.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ltex = {
            cmd = { "ltex-ls" },
            single_file_support = true,
            filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "text" },
        }
    }
}

require'lspconfig'.marksman.setup{
    capabilities = capabilities,
  on_attach = on_attach,
}

-------------------------------------------------------------------------------
-- misc 
-------------------------------------------------------------------------------
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
