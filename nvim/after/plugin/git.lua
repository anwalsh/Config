if not pcall(require, "neogit") then
  return
end

local Remap = require("anwalsh.keymap")
local nmap = Remap.nmap

require("neogit").setup {
  integrations = {
    diffview = true,
  },
  disable_context_highlighting = true
}
