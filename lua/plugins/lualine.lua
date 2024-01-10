return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require("lualine").setup({
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = "ayu_mirage",
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filetype','filename'},
        lualine_x = {'diagnostics'},
        lualine_y = {'diff', 'lsp'},
        lualine_z = {'fileformat'}
      },
    })
  end
}
