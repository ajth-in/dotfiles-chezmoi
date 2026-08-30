return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<C-\\>",
        function()
          Snacks.terminal.toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle Terminal",
      },
    },
  },
}
