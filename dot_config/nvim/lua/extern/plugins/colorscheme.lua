vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
})

require("catppuccin").setup({
	flavour = "mocha",
})

vim.cmd.colorscheme("catppuccin")
