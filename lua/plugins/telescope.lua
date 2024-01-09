return {
  "nvim-telescope/telescope.nvim", tag = '0.1.5',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'center',
        layout_config = {
          height = 0.5,
          width = 0.6,
          prompt_position = 'bottom',
        },
        preview = false,
      },
    })
  end
}
