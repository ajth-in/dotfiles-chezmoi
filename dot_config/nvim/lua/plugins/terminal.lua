return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<C-\\>",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Toggle Terminal",
      },
    },
  },
}
