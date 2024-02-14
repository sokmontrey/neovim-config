local plugins = {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    config = true,
  },
  {
    'jxnblk/vim-mdx-js',
  },
  {
    'evanleck/vim-svelte',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'rstacruz/vim-closer',
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'backdround/global-note.nvim',
    config = function()
      require('global-note').setup()
    end
  }
}

return plugins
