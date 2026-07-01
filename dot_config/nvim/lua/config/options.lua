local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.wrap = false
opt.cursorline = true
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Scrolling
opt.scrolloff = 8

-- Update time
opt.updatetime = 250

-- True color support
opt.termguicolors = true

-- Mouse
opt.mouse = "a"
-- Better completion menu behavior
vim.opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}

-- Persistent undo
vim.opt.undofile = true

-- Faster redraw
vim.opt.lazyredraw = true

-- Reduce command line noise
vim.opt.shortmess:append("c")
