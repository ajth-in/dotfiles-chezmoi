local gh = require("utils.gh").gh

-- Highlight todo, notes, etc in comments
vim.pack.add({ gh("folke/todo-comments.nvim") })
require("todo-comments").setup({ signs = false })
