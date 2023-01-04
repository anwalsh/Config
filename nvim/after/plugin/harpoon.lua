if not pcall(require, "harpoon") then
  return
end

local Remap = require("util.remapper")
local nmap = Remap.nmap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


require("harpoon").setup {}

nmap("<leader>H-m", mark.add_file)
nmap("<leader>H-g", ui.toggle_quick_menu)
nmap("<leader>1", function() ui.nav_file(1) end)
nmap("<leader>2", function() ui.nav_file(2) end)
nmap("<leader>3", function() ui.nav_file(3) end)
nmap("<leader>4", function() ui.nav_file(4) end)
nmap("<leader>5", function() ui.nav_file(5) end)
