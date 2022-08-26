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
    },
    highlight = {
        keyword = "bg",
        pattern = [[.*<(KEYWORDS)>]],
        comments_only = true,
    },
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--ignore-case",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
}

