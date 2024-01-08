  return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    init = function()
      vim.schedule(function()
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})
        vim.keymap.set('n', '<C-n>', ':NvimTreeClose<CR>', {})
      end)
    end,
    config = true
  }
