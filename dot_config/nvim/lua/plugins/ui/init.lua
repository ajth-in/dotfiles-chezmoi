return {
  {
    "goolord/alpha-nvim",
    priority = 999,
    lazy = false,
    config = function()
      local alpha = require("alpha")
      local theta = require("alpha.themes.theta")

      theta.header.val = {
        "",
        ".---.                           ",
        "|   |                           ",
        "'---'.--.           .           ",
        ".---.|__|         .'|           ",
        "|   |.--.     .| <  |           ",
        "__        |   ||  |   .' |_ | | ",
        ".:--.'.      |   ||  | .'     || | .'''-.   ",
        "/ |   \\ |     |   ||  |'--.  .-'| |/.'''. \\   ",
        "`\" __ | |     |   ||  |   |  |  |  /    | |   ",
        ".'.''| |     |   ||__|   |  |  | |     | |   ",
        "/ /   | |_ __.'   '       |  '.'| |     | |   ",
        "\\ \\._,\\ '/|      '        |   / | '.    | '.  ",
        "`--'  `\" |____.'         `'-'  '---'   '---'  ",
      }

      local function button(sc, txt, keybind)
        return {
          type = "button",
          val = txt,
          on_press = function()
            local keys = vim.api.nvim_replace_termcodes(keybind, true, false, true)
            vim.api.nvim_feedkeys(keys, "t", false)
          end,
          opts = {
            position = "center",
            shortcut = sc,
            cursor = 3,
            width = 38,
            align_shortcut = "right",
            hl = "AlphaButtons",
            hl_shortcut = "AlphaShortcut",
          },
        }
      end

      theta.buttons.val = {
        button("f", "  Find File", "<leader>ff"),
        button("r", "  Recent Files", "<leader>fr"),
        button("g", "  Live Grep", "<leader>fg"),
        button("e", "  File Explorer", "<leader>e"),
        button("q", "  Quit", "<cmd>qa<cr>"),
      }

      alpha.setup(theta.config)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        numbers = "ordinal",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
      vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
      vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
      vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
      vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
      vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
      vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Close Buffer" })
      vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close Other Buffers" })
      vim.keymap.set("n", "<leader>bD", "<Cmd>BufferLineCloseRight<CR><Cmd>BufferLineCloseLeft<CR>", { desc = "Close All Buffers" })
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
      vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
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
