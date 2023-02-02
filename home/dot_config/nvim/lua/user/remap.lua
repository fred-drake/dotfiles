-- Leader key
vim.g.mapleader = " "

-- For conciseness
local km = vim.keymap

km.set("n", "<leader>pv", vim.cmd.Ex)

-- jk is much faster than stretching up to hit Esc
km.set("i", "jk", "<ESC>")
km.set("v", "jk", "<ESC>")

-- Don't save the single character I deleted into the register
km.set("n", "x", '"_x')


-- Toggle NVIM Tree
km.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- Clear highlights
km.set("n", "<leader>h", vim.cmd.nohl)

-- Window splits
km.set("n", "<leader>|", "<C-w>v") -- split vertically
km.set("n", "<leader>-", "<C-w>s") -- split horizontally
km.set("n", "<leader>x", ":close<CR>") -- close split window

-- tab manipulation
km.set("n", "<leader>to", ":tabnew<CR>") -- create new tab
km.set("n", "<leader>c", ":tabclose<CR>") -- close tab
km.set("n", "<Tab>", ":tabn<CR>") -- next tab
km.set("n", "<S-Tab>", ":tabp<CR>") -- previoustab

-- toggle maximizer
km.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- telescope
km.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
km.set("n", "<leader>st", "<cmd>Telescope live_grep<CR>")
