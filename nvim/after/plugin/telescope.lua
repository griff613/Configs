local builtin = require('telescope.builtin')

-- General find files (pf = project files)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Search for files included in git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- This is a custom primeagen function. (ps = procect search)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
