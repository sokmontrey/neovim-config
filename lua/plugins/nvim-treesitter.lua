return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "markdown", "markdown_inline", "svelte", "astro" },
      highlight = {
        enable = true,
      },
    })
  end
}
