require("stickybuf").setup({
  -- 'bufnr' will pin the exact buffer (PinBuffer)
  -- 'buftype' will pin the buffer type (PinBuftype)
  -- 'filetype' will pin the filetype (PinFiletype)
  bufname = {
    ["Neogit.*Popup"] = "bufnr",
  },
  -- Some autocmds for plugins that need a bit more logic
  -- Set to `false` to disable the autocmd
})
