return {
  'zbirenbaum/copilot.lua',
  cmd = "Copilot",
  lazy = false,
  config = function()
    require("copilot").setup {
      panel = {
        auto_refresh = false,
        keymap = {
          accept = "<CR>",
          jump_prev = "[[",
          jump_next = "]]",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          prev = "<M-[>",
          next = "<M-]>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
      },
    }

    vim.cmd("Copilot disable")
  end,
}
