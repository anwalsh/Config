-------------------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------------------
local g = vim.g
local actions = require("telescope.actions")
local telescope = require("telescope")
local settings = require("aw.settings")

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg", "--no-heading", "--with-filename", "--line-number",
            "--column", "--smart-case", "--hidden", "--follow", "--trim",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = settings.telescope_file_ignore_patterns,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        set_env = { ["COLORTERM"] = "truecolor" },
        sorting_strategy = "ascending",
        use_less = false,
        winblend = 0,
        prompt_prefix = "  ",
        selection_caret = " ",
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-n>"] = false,
                ["<C-p>"] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
            },
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    pickers = {
        aerial = { theme = "ivy" },
        colorscheme = { theme = "ivy" },
        lsp_references = { theme = "ivy" },
        lsp_definitions = { theme = "ivy" },
        current_buffer_fuzzy_find = { theme = "ivy" },
        file_browser = { theme = "ivy" },
        find_files = {
            theme = "ivy",
            find_command = { "rg", "--files", "--no-ignore", "--hidden" },
        },
        oldfiles = { prompt_title = "History" },
        buffers = {
            theme = "dropdown",
            mappings = { i = { ["<C-x>"] = "delete_buffer" } },
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
        base_dirs = { g.dotfiles, g.vim_dir, g.projects_dir, g.work_dir },
        hidden_files = true,
        theme = "dropdown",
    },
})

-- Extension Loading
telescope.load_extension("fzf")
telescope.load_extension("bookmarks")
telescope.load_extension("heading")
telescope.load_extension("project")
telescope.load_extension("aerial")
telescope.load_extension("zoxide")
telescope.load_extension("advanced_git_search")
telescope.load_extension("git_worktree")
telescope.load_extension("vim_bookmarks")
telescope.load_extension("undo")

if vim.fn.executable("gh") == 1 then
    pcall(telescope.load_extension, "gh")
    pcall(telescope.load_extension, "octo")
end

-------------------------------------------------------------------------------
-- Telescope helper functions (used by which-key)
-------------------------------------------------------------------------------
local M = {}

M.project_search = function(opts)
    opts = opts or {}
    opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        local clients = vim.lsp.get_clients()
        if #clients > 0 then
            opts.cwd = clients[1].config.root_dir
        else
            opts.cwd = vim.fn.getcwd()
        end
    end
    require("telescope.builtin").find_files(opts)
end

M.find_hidden_files = function()
    require("telescope.builtin").find_files({
        cwd = vim.fn.getcwd(),
        shorten_path = false,
        hidden = true,
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.55 },
    })
end

M.search_all_files = function()
    require("telescope.builtin").find_files({
        find_command = { "rg", "--no-ignore", "--files" },
    })
end

M.search_only_certain_files = function()
    require("telescope.builtin").find_files({
        find_command = { "rg", "--files", "--type", vim.fn.input("Type: ") },
    })
end

M.edit_nvim = function()
    require("telescope.builtin").find_files({
        shorten_path = false,
        cwd = g.vim_dir,
        prompt_title = "Nvim Config",
        hidden = true,
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.55 },
    })
end

M.edit_config = function()
    require("telescope.builtin").find_files({
        shorten_path = false,
        cwd = g.dotfiles,
        prompt_title = "Dotfiles",
        hidden = true,
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.55 },
        file_ignore_patterns = { "^.git/", "^git/submodules/" },
    })
end

M.lsp_document_methods = function()
    require("telescope.builtin").lsp_document_symbols({
        prompt_title = "LSP Document Methods",
        symbols = { "method" },
        symbol_width = 80,
    })
end

-- Export for use by which-key
_G.aw_telescope = M
