local gh = require("utils.gh").gh
local servers = require("extern.plugins.lsp.servers")

vim.pack.add({
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
})

require("mason").setup({})

require("mason-lspconfig").setup({
	automatic_enable = false,
})

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
