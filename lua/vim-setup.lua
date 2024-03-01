vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number")
-- vim.cmd("set numberwidth=1")
vim.cmd("hi! link EndOfBuffer Ignore")
vim.cmd("set cursorline")
-- vim.cmd("set signcolumn=yes")
-- vim.cmd("set colorcolumn=80")
vim.cmd("set linebreak")
vim.opt.termguicolors = true

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"
end

