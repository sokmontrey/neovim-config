return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'letieu/harpoon-lualine',
  },
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = "ayu",
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'diff', 'lsp' },
        lualine_z = { {
          'harpoon2',
          icon = '',
          indicators = { "1", "2", "3", "4" },
          active_indicators = { "[1]", "[2]", "[3]", "[4]" },
        }, 'fileformat' },
      },
    })
  end
}
