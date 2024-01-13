local function get_python_path()
    -- Poetry first given workflows currently:
    if env.POETRY_ACTIVE == 1 then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
        return { venv .. "bin" .. "python" }
    elseif vim.env.VIRTUAL_ENV then
        return { vim.env.VIRTUAL_ENV .. "bin" .. "python" }
    else
        -- Fallback to system Python.
        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
    end
end

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                opts = {
                    ensure_installed = {
                        "codelldb",
                        "shellcheck",
                        "shfmt",
                        "stylua",
                    },
                    max_concurrent_installers = PU_COUNT,
                },
            },
            "onsails/lspkind-nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/lsp-colors.nvim",
            "folke/trouble.nvim",
            "folke/lsp-trouble.nvim",
            "mrcjkb/rustaceanvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("aw.plugins.lsp.lsp").client_capabilities

            require("mason-lspconfig").setup({
                ensure_installed = require("aw.settings").mason_ensure_installed,
                handlers = {
                    function(server) lspconfig[server].setup({ capabilities = capabilities() }) end,
                    eslint = function()
                        lspconfig.eslint.setup({
                            capabilities = capabilities(),
                            settings = { format = false },
                        })
                    end,
                    clangd = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities(),
                            flags = { debounce_text_changes = 200 },
                            settings = {
                                clangd = {},
                            },
                        })
                    end,
                    jsonls = function()
                        lspconfig.jsonls.setup({
                            capabilities = capabilities(),
                            settings = {
                                json = {
                                    validate = { enable = true },
                                    format = { enable = true },
                                },
                            },
                            -- Lazy-load schemas.
                            on_new_config = function(config)
                                config.settings.json.schemas = config.settings.json.schemas or {}
                                vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
                            end,
                        })
                    end,
                    lua_ls = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities(),
                            single_file_support = true,
                            settings = {
                                Lua = {
                                    workspace = {
                                        checkThirdParty = false,
                                    },
                                    completion = {
                                        workspaceWord = true,
                                        callSnippet = "Both",
                                    },
                                    misc = {
                                        parameters = {
                                            -- "--log-level=trace",
                                        },
                                    },
                                    hover = { expandAlias = false },
                                    hint = {
                                        enable = true,
                                        setType = false,
                                        paramType = true,
                                        paramName = "Disable",
                                        semicolon = "Disable",
                                        arrayIndex = "Disable",
                                    },
                                    doc = {
                                        privateName = { "^_" },
                                    },
                                    type = {
                                        castNumberToInteger = true,
                                    },
                                    diagnostics = {
                                        disable = { "incomplete-signature-doc", "trailing-space" },
                                        -- enable = false,
                                        groupSeverity = {
                                            strong = "Warning",
                                            strict = "Warning",
                                        },
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
                                        defaultConfig = {
                                            indent_style = "space",
                                            indent_size = "2",
                                            continuation_indent_size = "2",
                                        },
                                    },
                                },
                            },
                        })
                    end,
                    gopls = function()
                        lspconfig.gopls.setup({
                            capabilities = capabilities(),
                            flags = {
                                debounce_text_changes = 150,
                            },
                            settings = {
                                gopls = {
                                    gofumpt = true,
                                    completeUnimported = true,
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
                        })
                    end,
                    golangci_lint_ls = function()
                        lspconfig.golangci_lint_ls.setup({
                            capabilities = capabilities(),
                        })
                    end,
                    rust_analyzer = function()
                        vim.g.rustaceanvim({
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
                                        vim.cmd(
                                            "T "
                                                .. require("rust-tools.utils.utils").make_command_from_args(
                                                    command,
                                                    args
                                                )
                                        )
                                    end,
                                },
                            },
                            server = {
                                capabilities = capabilities(),
                                settings = {
                                    ["rust-analyzer"] = {
                                        cargo = {
                                            allFeatures = true,
                                            loadOutDirsFromCheck = true,
                                            runBuildScripts = true,
                                        },
                                        checkOnSave = {
                                            allFeatures = true,
                                            command = "clippy",
                                            extraArgs = { "--no-deps" },
                                        },
                                        completion = {
                                            autoimport = {
                                                enable = true,
                                            },
                                        },
                                        procMacro = {
                                            enable = true,
                                            ignored = {
                                                ["async-trait"] = { "async_trait" },
                                                ["napi-derive"] = { "napi" },
                                                ["async-recursion"] = { "async_recursion" },
                                            },
                                        },
                                    },
                                },
                            },
                        })
                    end,
                    pyright = function()
                        lspconfig.pyright.setup({
                            capabilites = capabilities(),
                            flags = { debounce_text_changes = 200 },
                            on_init = function(client) client.config.settings.python.pythonPath = get_python_path() end,
                            settings = {
                                typeCheckingMode = "basic",
                            },
                        })
                    end,
                    ltex = function()
                        lspconfig.ltex.setup({
                            capabilities = capabilities(),
                            settings = {
                                ltex = {
                                    cmd = { "ltex-ls" },
                                    single_file_support = true,
                                    filetypes = {
                                        "bib",
                                        "gitcommit",
                                        "markdown",
                                        "org",
                                        "plaintex",
                                        "rst",
                                        "rnoweb",
                                        "text",
                                    },
                                },
                            },
                        })
                    end,
                    marksman = function()
                        require("lspconfig").marksman.setup({
                            capabilities = capabilities(),
                        })
                    end,
                    yamlls = function()
                        lspconfig.yamlls.setup({
                            capabilities = capabilities(),
                            flags = { debounce_text_changes = 200 },
                        })
                    end,
                    zls = function()
                        lspconfig.zls.setup({
                            capabilities = capabilities(),
                            flags = { debounce_text_changes = 200 },
                            settings = {
                                zls = {
                                    enable_inlay_hints = true,
                                    inlay_hints_show_builtin = true,
                                    include_at_in_builtins = true,
                                    warn_style = true,
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
