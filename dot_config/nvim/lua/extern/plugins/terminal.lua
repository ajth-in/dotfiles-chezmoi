local Snacks = require("extern.plugins.snacks")

vim.keymap.set({ "n", "t" }, "<C-/>", function()
    Snacks.terminal(vim.o.shell, {
        win = {
            position = "bottom",
            height = 0.3,
        },
    })
end, { desc = "Toggle Horizontal Terminal" })
