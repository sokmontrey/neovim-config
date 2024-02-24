return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = '🔍 ',
        selection_caret = '❯ ',
        file_ignore_patterns = { 'node_modules', 'dist', 'build' },
        layout_strategy = 'center',
        layout_config = {
          height = 0.5,
          width = 0.6,
          prompt_position = 'bottom',
        },
        preview = false,
        border = false,
        winblend = 10,
        padding = true,
      },
    })

  end
}
