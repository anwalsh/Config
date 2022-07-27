local ok, neogit = pcall(require, "neogit")
if not ok then
  return
end

local Remap = require("anwalsh.keymap")
local nmap = Remap.nmap

neogit.setup {
  integrations = {
    diffview = true,
  },
  disable_context_highlighting = true
}

nmap("<space>vv", ":DiffviewOpen ")

nmap("<leader>gs", neogit.open) 
nmap(
  "<leader>gc",
  function()
    neogit.open { "commit" }
  end)
