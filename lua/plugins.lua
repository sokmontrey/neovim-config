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
    'preservim/vim-markdown',
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
    'folke/zen-mode.nvim',
    opts={
      window = {
        width = .7,
        height = 1,
        backdrop = 1,
        options = {
          number = false,
          relativenumber = false,
          cursorline = false,
        },
      },
    },
  },
}

return plugins
