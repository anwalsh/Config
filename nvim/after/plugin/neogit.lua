require("neogit").setup {
    signs = {
        section = {"", ""},
        item = {"﬒", ""},
    },
    commit_popup = {
        kind = "tab",
    },
    integrations = {
        diffview = true
    }
}



local buffers = {}
function buffers.close_current_buffer(buffer, force)
  buffer = tonumber(buffer) -- Can be passed as string from command
  if buffer == 0 or not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  if vim.endswith(vim.fn.bufname(), 'NEOGIT_COMMIT_EDITMSG') then
    vim.cmd('close') -- To avoid conflicts with stickybuf.nvim, read more here: https://github.com/stevearc/stickybuf.nvim/issues/1#issuecomment-880107698
    return
  end

  if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
    -- Only one window left, create a new empty window
    vim.cmd('enew')
    vim.bo.bufhidden = 'wipe'
  elseif vim.api.nvim_win_get_buf(0) == buffer then
    -- Preserve layout only if this is a current buffer
    vim.cmd('bprevious')
  end

  vim.cmd('bdelete ' .. (force and '! ' or ' ') .. buffer)
end

return buffers
