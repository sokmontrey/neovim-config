vim.g.mapleader = ' '

vim.keymap.set('n', 'j', 'gj', {})
vim.keymap.set('n', 'k', 'gk', {})
vim.keymap.set('n', ';', ':', {})

vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-j>', '<C-w>', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

vim.keymap.set('n', '<leader><BS><BS>', ':wqa<CR>', {})
