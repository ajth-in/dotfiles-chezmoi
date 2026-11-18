local gh = require("utils.gh").gh

vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
require("guess-indent").setup({})
