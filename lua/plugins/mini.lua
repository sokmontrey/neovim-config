return { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
	  require('mini.move').setup({
		mappings = {
			left  = 'H',
			right = 'L',
			down  = 'J',
			up    = 'K',
		}
	  })

      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      statusline.section_location = function() return '%2l:%-2v' end
    end,
  }
