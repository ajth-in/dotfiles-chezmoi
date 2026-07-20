return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(vim.fs.root(bufnr, { ".git", "package.json", "pyproject.toml", ".hg" })
            or (fname and fname ~= "" and vim.fn.fnamemodify(fname, ":h"))
            or vim.uv.cwd())
        end,
      })

      vim.lsp.enable("vtsls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("graphql")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("html")
      vim.lsp.enable("basedpyright")

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
      end, { desc = "Find References" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "vtsls",
          "eslint",
          "lua_ls",
          "graphql",
          "cssls",
          "jsonls",
          "html",
          "basedpyright",
          "ruff",
        },
      })
    end,
  },
}
