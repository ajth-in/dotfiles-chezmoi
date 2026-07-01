return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 300,
          virt_text_pos = "eol",
        },
      })
      local gs = require("gitsigns")
      vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Git Hunk" })
      vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous Git Hunk" })
      vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
      vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame Line" })
      vim.keymap.set("n", "<leader>hB", gs.toggle_current_line_blame, { desc = "Toggle Inline Blame" })
    end,
  },
}
