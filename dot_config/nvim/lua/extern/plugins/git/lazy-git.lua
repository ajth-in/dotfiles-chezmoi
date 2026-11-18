local Snacks = require("extern.plugins.snacks")

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Open Lazygit" })
