--******************************************** 
-- Master Keymap 
--******************************************** 
vim.g.mapleader = " "

-- :Exp and :Rex
vim.keymap.set('n', '<leader>r', vim.cmd.Rex)
vim.keymap.set('n', '<leader>x', vim.cmd.Ex)

-- Split window vertically
vim.keymap.set('n', '<leader>s', vim.cmd.vsplit)
-- quit out of split windows
vim.keymap.set('n', '<leader>q', vim.cmd.quit)
-- unload current buffer and then close current window.
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete) 
-- close all other windows but leave all buffers open
vim.keymap.set('n', '<leader>on', vim.cmd.only) 
-- move to left-hand split
vim.keymap.set('n', '<leader>h', '<C-w>h') 
-- move to right-hand split
vim.keymap.set('n', '<leader>l', '<C-w>l') 

-- Move whole lines up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- Collapse lines, keep cursor in same place.
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle while scrolling.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- when highlighting and pasting over word. Keep pasted text in register.
vim.keymap.set("x", "<leader>v", "\"_dP")

-- No more accidental recording.
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

