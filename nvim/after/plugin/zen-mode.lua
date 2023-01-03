if not pcall(require, "zen-mode") then
  return
end

require("zen-mode").setup {
    window = {
        width = 200,
        options = {
            number = true,
            relativenumber = true,
        }
    },
    config = {
        plugins = {
            gitsigns = true,
        },
    },
}
