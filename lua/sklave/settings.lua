-- Enable search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- vim.opt.showmatch = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true

-- Wild menu
vim.opt.wildmode = "longest,list"

-- Color column
vim.opt.colorcolumn = "80"

-- Mouse support
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Cursor line
vim.opt.cursorline = true

-- Disable swapfile
vim.opt.swapfile = false

-- Filetype plugins & indentation
vim.cmd("filetype plugin indent on")
vim.cmd("filetype plugin on")
