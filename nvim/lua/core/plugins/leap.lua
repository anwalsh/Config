local M = {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
        -- The below settings make Leap's highlighting a bit closer to what you've been
        -- used to in Lightspeed.

        vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
        vim.api.nvim_set_hl(0, 'LeapMatch', {
          fg = 'white',  -- for light themes, set to 'black' or similar
          bold = true,
          nocombine = true,
        })
        require("leap").setup({
            opts = {
                highlight_unlabeled_phase_one_targets = true,
            },
        })        
        require("leap").add_default_mappings()
    end,
}

return M
