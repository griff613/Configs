-- Old: nnoremap <F5> :UndotreeToggle<CR>

-- with this, you can go to undo tree and make changes
-- to old edits which will act like git branches.
-- if you save an old 'branch' it will merge to the
-- current
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
