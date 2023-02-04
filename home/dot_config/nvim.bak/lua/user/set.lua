-- For conciseness
local opt = vim.opt

-- Block cursor always
opt.guicursor = ""

-- line numbers and relative numbers
opt.nu = true
opt.relativenumber = true

-- 4 spaces to tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

-- No wrap
opt.wrap = false

-- Let undo manager handle this
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Searching
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Default to dark themes where supported
opt.background = "dark"

-- Make backspace work properly
opt.backspace = "indent,eol,start"

-- Send yanks to system clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- consider dashes part of a word when performing actions
opt.iskeyword:append("-")

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

opt.colorcolumn = "100"

vim.g.leader = " "

opt.ttimeoutlen = 5
