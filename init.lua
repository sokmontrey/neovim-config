require("config.setup")
require("config.lazy")
require("config.mapping")

vim.cmd.colorscheme("ayu-dark")
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#142b38', bold=false })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#142b38', bold=false })
