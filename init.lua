local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

vim.filetype.add({
	extension = {
		mdx = 'mdx'
	}
})

require("vim-setup")
require("lazy").setup("plugins")
require("mappings")

vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme kanagawa-wave")
-- vim.cmd("colorscheme nightfly")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme poimandres")
