if not pcall(require, "todo-comments") then
  return
end

require("todo-comments").setup {
    {
        keywords = {
            TODO = {
                alt = {
                    "WIP"
                }
            }
        }
    }
}

