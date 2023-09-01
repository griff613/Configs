require("plugins/colorscheme")
require("plugins/lualine") 
require("core/keymaps") 
require("plugins/telescope")

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- Hybrid relative line numbers
vim.wo.relativenumber = true

vim.cmd [[ set number 

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

-- Line number coloring
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='limegreen' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })

