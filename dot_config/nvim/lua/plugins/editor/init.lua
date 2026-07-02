return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
      local ts_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup({
        pre_hook = function(ctx)
          local ok, result = pcall(ts_hook, ctx)
          if ok then
            return result
          end
        end,
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "neo-tree",
          "Trouble",
          "lazy",
          "help",
          "toggleterm",
          "qf",
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>h",  group = "Git Hunk" },
        { "<leader>hp", desc = "Preview Hunk" },
        { "<leader>hr", desc = "Reset Hunk" },
        { "<leader>hb", desc = "Blame Line" },
        { "<leader>e",  desc = "Explorer" },
        { "<leader>f",  group = "Find" },
        { "<leader>ff", desc = "Find Files" },
        { "<leader>fg", desc = "Live Grep" },
        { "<leader>fb", desc = "Buffers" },
        { "<leader>fh", desc = "Help" },
        { "<leader>r",  group = "Refactor" },
        { "<leader>rn", desc = "Rename Symbol" },
        { "<leader>c",  group = "Code" },
        { "<leader>ca", desc = "Code Action" },
        { "<leader>x",  group = "Trouble" },
        { "<leader>xx", desc = "Diagnostics" },
        { "<leader>xw", desc = "Buffer Diagnostics" },
        { "<leader>xr", desc = "References" },
        { "<leader>xq", desc = "Quickfix" },
      })
    end,
  },
}
