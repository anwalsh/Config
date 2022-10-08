if not pcall(require, "telescope") then
  return
end

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        -- General Config
        vimgrep_arguments = {
            "rg",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "*.git", ".vim/undo", "node_modules", "venv" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        find_command = {
            "rg",
            "--ignore",
            "--hidden",
            "--files",
            "--smartcase",
        },

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
        lsp_references = { theme = "cursor" },
        lsp_definitions = { theme = "cursor" },
        current_buffer_fuzzy_find = { theme = "ivy" },
        file_browser = { theme = "ivy" },
        find_files = { theme = "ivy" },
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
            '~/GitLocal/github.com/',
          },
          hidden_files = true, -- default: false
          theme = "dropdown"
        },
    },
})

-- Extension Loading
require("telescope").load_extension("gh")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("heading")
require("telescope").load_extension("project")
require("telescope").load_extension("aerial")
require('telescope').load_extension('octo')
require('telescope').load_extension('zoxide')
-- require("telescope").load_extension("git_worktree")

local M = {}

function M.reload_modules()
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

M.project_search = function(opts)
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
  require'telescope.builtin'.find_files(opts)
end

function M.find_hidden_files()
  require("telescope.builtin").find_files {
    cwd = vim.fn.getcwd(),
    shorten_path = false,
    hidden = true,

    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.55,
    },
  }
end

function M.float_terminal(cmd)
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
end

return M
