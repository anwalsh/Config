if vim.g.vscode then
    require("core.vscode.options")
    require("core.vscode.mappings")
    require("core.lazy")
else
    require("core.globals")
    require("core.lazy")
    require("core.mappings")
    require("core.options")
    require("core.utils.qf")
    require("core.autocmd")
end
