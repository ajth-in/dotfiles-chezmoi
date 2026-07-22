vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")



keymap.set("i", "jk", "<Esc>")

keymap.set("n", "<leader>cc", function()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(0, { lnnum = row })
  if #diags == 0 then
    vim.notify("No diagnostic on this line", vim.log.levels.WARN)
    return
  end
  local msg = diags[1].message
  vim.fn.setreg("+", msg)
  vim.notify("Copied diagnostic to clipboard", vim.log.levels.INFO)
end, { desc = "Copy diagnostic under cursor to clipboard" })
