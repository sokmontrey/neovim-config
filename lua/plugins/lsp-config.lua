return {
  {
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function ()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ast_grep",
          "lua_ls",
          "tsserver",
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      local lspconfig = require("lspconfig")

      lspconfig.ast_grep.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
    end
  },
}
