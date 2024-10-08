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

		vim.api.nvim_create_autocmd("TermEnter", {
			pattern = "term://*toggleterm#*",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, 't', '<C-t>', '<Cmd>exe v:count1 .. "ToggleTerm"<CR>', { noremap = true, silent = true })
			end
		})
	end,
}

