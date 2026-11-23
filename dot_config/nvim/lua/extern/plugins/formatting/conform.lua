local gh = require("utils.gh").gh
local formatters_by_ft = require("extern.plugins.formatting.formatters")

vim.pack.add({ gh("stevearc/conform.nvim") })

require("conform").setup({
	notify_on_error = false,
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = formatters_by_ft,
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
