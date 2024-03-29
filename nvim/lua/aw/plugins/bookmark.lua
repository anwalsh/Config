local M = {
    "MattesGroeger/vim-bookmarks",
    lazy = false,
    config = function()
        vim.g.bookmark_no_default_key_mappings = 1
        vim.g.bookmark_auto_save = 0
        vim.g.bookmark_auto_close = 0
        vim.g.bookmark_manage_per_buffer = 0
        vim.g.bookmark_save_per_working_dir = 0
        vim.g.bookmark_show_warning = 0
        vim.g.bookmark_center = 1
        vim.g.bookmark_location_list = 0
        vim.g.bookmark_disable_ctrlp = 1
        vim.g.bookmark_display_annotation = 0
    end,
}

return M
