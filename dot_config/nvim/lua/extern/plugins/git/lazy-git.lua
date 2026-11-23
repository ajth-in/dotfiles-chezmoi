local Snacks = require("extern.plugins.snacks")

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit({
		win = {
			keys = {
				q = "hide",
			},
		},
	})
end, { desc = "Open Lazygit" })
