return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function()
    local fb_actions = require "telescope._extensions.file_browser.actions"

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
      extensions = {
        file_browser = {
          theme = "ivy",
          mapping = {
            ["n"] = {
              ["a"] = fb_actions.create,
              ["c"] = fb_actions.copy,
              ["o"] = function() end,
            },
          },
        },
      },
    })

    require('telescope').load_extension('file_browser')
  end
}
