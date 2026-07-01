vim.api.nvim_create_user_command("BLCO", "BufferLineCloseOthers", {})
vim.api.nvim_create_user_command("BLC", "bd", {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "graphql" },
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      source = "if_many",
      scope = "cursor",
    })
  end,
})
