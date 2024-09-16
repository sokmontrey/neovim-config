return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	config = function()
		require("toggleterm").setup({})
		vim.cmd([[
			augroup terminal_insert
			autocmd!
			autocmd BufWinEnter,WinEnter term://* startinsert
			augroup END
		]])
	end,
}

