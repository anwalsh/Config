local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "tom-anders/telescope-vim-bookmarks.nvim",
        "nvim-telescope/telescope-github.nvim",
        "nvim-telescope/telescope-project.nvim",
        "crispgm/telescope-heading.nvim",
        "dhruvmanila/telescope-bookmarks.nvim",
        "jvgrootveld/telescope-zoxide",
        "nvim-telescope/telescope-dap.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")
        local settings = require("core.settings")
        local jit = require("jit")
        if jit.os == "popos" then
            local os_find = {
                "fd",
                "-L",
                "-i",
                "-H",
                "-E",
                ".git",
                "-c=never",
                "--strip-cwd-prefix",
            }
        else
            local os_find = {
                "fdfind",
                "-L",
                "-i",
                "-H",
                "-E",
                ".git",
                "-c=never",
                "--strip-cwd-prefix",
            }
        end
        telescope.setup({
            defaults = {
                -- General Config
                vimgrep_arguments = {
                    "rg",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--follow",
                    "--trim",
                },
                initial_mode = "insert",
                selection_strategy = "reset",
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                file_ignore_patterns = settings.telescope_file_ignore_patterns,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                -- Appearance
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                sorting_strategy = "ascending",
                use_less = false,
                winblend = 0,
                prompt_prefix = "  ",
                selection_caret = " ",
                -- Mappings
                mappings = {
                    i = {
                        ["<C-n>"] = false,
                        ["<C-p>"] = false,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<Tab>"] = actions.move_selection_next,
                        ["<S-Tab>"] = actions.move_selection_previous,
                        ["K"] = actions.toggle_selection + actions.move_selection_worse,
                        ["J"] = actions.toggle_selection + actions.move_selection_better,
                    },
                },
                -- Previewers
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                -- Developer configurations: Not meant for general override
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            },
            pickers = {
                aerial = { theme = "ivy" },
                buffers = { theme = "dropdown" },
                colorscheme = { theme = "ivy" },
                lsp_references = { theme = "ivy" },
                lsp_definitions = { theme = "ivy" },
                current_buffer_fuzzy_find = { theme = "ivy" },
                file_browser = { theme = "ivy" },
                find_files = {
                    theme = "ivy",
                    find_command = os_find,
                },
                git_bcommits = { theme = "ivy" },
                git_commits = { theme = "ivy" },
                grep_string = { theme = "ivy" },
                heading = { theme = "dropdown" },
                help_tags = { theme = "ivy" },
                highlights = { theme = "ivy" },
                keymaps = { theme = "ivy" },
                live_grep = { theme = "ivy" },
                lsp_document_symbols = { theme = "ivy" },
                lsp_workspace_symbols = { theme = "ivy" },
                man_pages = { theme = "ivy" },
            },
            extensions = {
                bookmarks = {
                    selected_browser = "arc",
                    url_open_command = "open",
                    bookmarks = require("telescope.themes").get_dropdown({
                        width = 0.8,
                        results_height = 0.8,
                        sorting_strategy = "descending",
                        layout_defaults = {
                            horizontal = { mirror = false },
                            vertical = { mirror = false },
                        },
                    }),
                },
                project = {
                    base_dirs = {
                        "~/GitLocal/github.com/",
                        "~/GitLocal/github.com/anwalsh/Config/",
                        "~/GitLocal/github.com/anwalsh/Config/nvim",
                    },
                    hidden_files = true, -- default: false
                    theme = "dropdown",
                },
            },
        })

        -- Extension Loading
        require("telescope").load_extension("bookmarks")
        require("telescope").load_extension("heading")
        require("telescope").load_extension("project")
        require("telescope").load_extension("aerial")
        require("telescope").load_extension("zoxide")
        require("telescope").load_extension("advanced_git_search")
        require("telescope").load_extension("git_worktree")
        require("telescope").load_extension("vim_bookmarks")

        if vim.fn.executable("gh") == 1 then
            pcall(require("telescope").load_extension, "gh")
            pcall(require("telescope").load_extension, "octo")
        end
    end,
    reload_modules = function()
        local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
        for _, dir in ipairs(lua_dirs) do
            dir = string.gsub(dir, "./lua/", "")
            require("plenary.reload").reload_module(dir)
        end
    end,
    git_branches = function()
        require("telescope.builtin").git_branches({
            attach_mappings = function(_, map)
                map("i", "<c-d>", actions.git_delete_branch)
                map("n", "<c-d>", actions.git_delete_branch)
                return true
            end,
        })
    end,
    project_search = function(opts)
        opts = opts or {}
        opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error ~= 0 then
            -- if not git then active lsp client root
            -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
            if pcall(vim.lsp.get_active_clients()) then
                opts.cwd = vim.lsp.get_active_clients()[1].config.root_dir
            else
                -- if the above call falls we enter here and use the current working directorY
                opts.cwd = vim.fn.getcwd()
            end
        end
        require("telescope.builtin").find_files(opts)
    end,
    find_hidden_files = function()
        require("telescope.builtin").find_files({
            cwd = vim.fn.getcwd(),
            shorten_path = false,
            hidden = true,
            layout_strategy = "horizontal",
            layout_config = {
                preview_width = 0.55,
            },
        })
    end,
    search_all_files = function()
        require("telescope.builtin").find_files({
            find_command = { "rg", "--no-ignore", "--files" },
        })
    end,
    search_only_certain_files = function()
        require("telescope.builtin").find_files({
            find_command = {
                "rg",
                "--files",
                "--type",
                vim.fn.input("Type: "),
            },
        })
    end,
    float_terminal = function(cmd)
        local buf = vim.api.nvim_create_buf(false, true)
        local vpad = 4
        local hpad = 10
        local win = vim.api.nvim_open_win(buf, true, {
            relative = "editor",
            width = vim.o.columns - hpad * 2,
            height = vim.o.lines - vpad * 2,
            row = vpad,
            col = hpad,
            style = "minimal",
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        })
        vim.fn.termopen(cmd)
        local autocmd = {
            "autocmd! TermClose <buffer> lua",
            string.format("vim.api.nvim_win_close(%d, {force = true});", win),
            string.format("vim.api.nvim_buf_delete(%d, {force = true});", buf),
        }
        vim.cmd(table.concat(autocmd, " "))
        vim.cmd([[startinsert]])
    end,
    edit_nvim = function()
        require("telescope.builtin").find_files({
            shorten_path = false,
            cwd = "~/Config/nvim/",
            prompt = "~ NVIM ~",
            hidden = true,
            layout_strategy = "horizontal",
            layout_config = {
                preview_width = 0.55,
            },
        })
    end,
    edit_config = function()
        require("telescope.builtin").find_files({
            shorten_path = false,
            cwd = "~/Config/",
            prompt = "~ Dots ~",
            hidden = true,
            layout_strategy = "horizontal",
            layout_config = {
                preview_width = 0.55,
            },
        })
    end,
}

return M
