-------------------------------------------------------------------------------
-- Neo-tree
-------------------------------------------------------------------------------
local lsp_util = require("aw.util.lsp")
local root = require("aw.util.root")

-- Open neo-tree if started with a directory
if vim.fn.argc(-1) == 1 then
    local stat = vim.uv.fs_stat(vim.fn.argv(0))
    if stat and stat.type == "directory" then require("neo-tree") end
end

local opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
    },
    window = {
        mappings = { ["<space>"] = "none" },
    },
    default_component_configs = {
        indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
    },
}

local function on_move(data) lsp_util.on_rename(data.source, data.destination) end

local events = require("neo-tree.events")
opts.event_handlers = opts.event_handlers or {}
vim.list_extend(opts.event_handlers, {
    { event = events.FILE_MOVED, handler = on_move },
    { event = events.FILE_RENAMED, handler = on_move },
})

require("neo-tree").setup(opts)

-- Refresh git status after lazygit
vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*lazygit",
    callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
        end
    end,
})

-- Keymaps
vim.keymap.set("n", "<leader>ft", function()
    require("neo-tree.command").execute({ toggle = true, dir = root.set_root() })
end, { desc = "Explorer NeoTree (root dir)" })
vim.keymap.set("n", "<leader>fT", function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end, { desc = "Explorer NeoTree (cwd)" })
vim.keymap.set("n", "<leader>ge", function()
    require("neo-tree.command").execute({ source = "git_status", toggle = true })
end, { desc = "Git explorer" })
vim.keymap.set("n", "<leader>be", function()
    require("neo-tree.command").execute({ source = "buffers", toggle = true })
end, { desc = "Buffer explorer" })
