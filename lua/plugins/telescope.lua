return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-ui-select.nvim' },
	},
	config = function ()
		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				prompt_prefix = '🔍 ',
				selection_caret = '❯ ',
				file_ignore_patterns = { 'node_modules', 'obj', 'bin', '.git' },
				layout_strategy = 'center',
				layout_config = {
				  height = 0.6,
				  width = 0.6,
				  prompt_position = 'bottom',
				},
				preview = false,
				border = false,
				winblend = 0,
				padding = true,
			},
		})

		telescope.load_extension('ui-select')
	end
}
