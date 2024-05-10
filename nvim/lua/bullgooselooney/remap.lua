vim.g.mapleader=" "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>re", vim.cmd.Rex)

-- Keep cursor in middle, less disorienting
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search term in the middle
vim.keymap.set("v", "n", "nzzzv")
vim.keymap.set("v", "N", "Nzzzv")

-- Same as <Alt + up_arrow> on vscode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Takes line below and appends it to current line (withwout moving cursor)
vim.keymap.set("n", "J", "mzJ`z")

-- Paste without putting deleted text into register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Capital Q sucks
vim.keymap.set("n", "Q", "<nop>")

-- Quick fix navigation
vim.keymap.set("n", "<C-.>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>.", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>,", "<cmd>lprev<CR>zz")

-- with word highlighted, replace all occurences



