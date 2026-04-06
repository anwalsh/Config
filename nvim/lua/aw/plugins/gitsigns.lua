-------------------------------------------------------------------------------
-- Gitsigns
-------------------------------------------------------------------------------
require("gitsigns").setup({
    current_line_blame = true,
    attach_to_untracked = true,
    current_line_blame_formatter = function(name, blame_info)
        if blame_info.author == name then blame_info.author = "You" end

        local text
        if blame_info.author == "Not Committed Yet" then
            text = blame_info.author
        else
            text = string.format(
                "%s, %s - %s",
                blame_info.author,
                os.date("%Y-%m-%d", tonumber(blame_info["author_time"])),
                blame_info.summary
            )
        end

        return { { "   " .. text, "GitSignsCurrentLineBlame" } }
    end,
    signs = {
        add = { text = "▍" },
        change = { text = "▍" },
        delete = { text = "▸" },
        topdelete = { text = "▾" },
        changedelete = { text = "▍" },
        untracked = { text = "▍" },
    },
})
