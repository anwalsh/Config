if not pcall(require, "nvim-tree") then return end

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        side = "right",
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
