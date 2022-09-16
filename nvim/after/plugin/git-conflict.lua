if not pcall(require, "git-conflict") then
  return
end

require("git-conflict").setup({})
