return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('telescope').setup {
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
			defaults = {
				prompt_prefix = '🔍 ',
				selection_caret = '❯ ',
				file_ignore_patterns = { 'node_modules', },
				layout_strategy = 'center',
				layout_config = {
				  height = 0.6,
				  width = 0.6,
				  prompt_position = 'bottom',
				},
				preview = false,
				border = false,
				winblend = 1,
				padding = true,
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')
	end,
}
