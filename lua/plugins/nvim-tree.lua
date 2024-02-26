return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      git = {
        ignore = false,
      }
    })
  end,
}
