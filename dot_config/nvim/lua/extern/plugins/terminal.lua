local Snacks = require("extern.plugins.snacks")

vim.keymap.set({ "n", "t" }, "<C-/>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })
