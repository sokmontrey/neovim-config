local plugins = {
  {
    "nvim-tree/nvim-tree.lua"
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "nvim-treesitter/nvim-treesitter"
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "miyakogi/conoline.vim"
  },
}

return plugins
