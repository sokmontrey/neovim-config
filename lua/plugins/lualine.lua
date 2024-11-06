return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup({
			options = {
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = { 'filename', 'diagnostics' },
				lualine_x = { },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
		})
	end
}
