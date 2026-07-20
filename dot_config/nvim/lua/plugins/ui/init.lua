return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {},
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
      vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", {
        desc = "Close current buffer",
      })
      vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", {
        desc = "Close other buffers",
      })
      vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", {
        desc = "Toggle buffer pin",
      })
      vim.keymap.set("n", "<leader>bg", function()
        local id = vim.fn.input("Buffer ID: ")
        if id ~= "" then
          vim.cmd("BufferLineGoToBuffer " .. id)
        end
      end, {
        desc = "Go to buffer by ID",
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          telescope = { enabled = true },
          neotree = true,
          which_key = true,
          gitsigns = true,
          blink_cmp = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              source = function()
                local gs = vim.b.gitsigns_status_dict
                if gs then
                  return { added = gs.added, modified = gs.changed, removed = gs.removed }
                end
              end,
            },
            "diagnostics",
          },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
        window = {
          mappings = {
            ["Y"] = {
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                vim.fn.setreg("+", path)
                vim.notify("Copied: " .. path)
              end,
              desc = "copy absolute path",
            },
            ["y"] = {
              function(state)
                local node = state.tree:get_node()
                local path = vim.fn.fnamemodify(node:get_id(), ":.")
                vim.fn.setreg("+", path)
                vim.notify("Copied: " .. path)
              end,
              desc = "copy relative path",
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
        desc = "Toggle Explorer",
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        { desc = "Buffer Diagnostics" })
      vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "References" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
}
