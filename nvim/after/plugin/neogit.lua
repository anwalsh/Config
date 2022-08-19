if not pcall(require, "neogit") then
  return
end

require("neogit").setup {
    signs = {
        section = {"", ""},
        item = {"﬒", ""},
    },
    commit_popup = {
        kind = "split",
    },
    popup = {
      kind = "split",
    },
    integrations = {
        diffview = true
    },
}
