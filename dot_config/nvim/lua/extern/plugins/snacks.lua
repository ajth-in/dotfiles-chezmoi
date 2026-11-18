local gh = require("utils.gh").gh

vim.pack.add({
	gh("folke/snacks.nvim"),
})

local Snacks = require("snacks")

Snacks.setup({
	lazygit = {
		configure = true,
	},
	terminal = {
		win = {
			style = "float",
		},
	},
})

return Snacks
