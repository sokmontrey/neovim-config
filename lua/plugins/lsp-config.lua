return {
  {
    "williamboman/mason.nvim",
    config = function()
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
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ast_grep",
          "lua_ls",
          "tsserver",
          "clangd",
          "svelte",
          "sqls",
        },
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require 'lsp_signature'.setup(opts)
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = { "sqls", "clangd", "ast_grep", "lua_ls", "tsserver", "astro", "svelte", "csharp_ls" }

      function on_attach(client, bufnr)
        require "lsp_signature".on_attach({
          bind = true,
          handler_opts = {
            border = "rounded"
          }
        }, bufnr)
      end

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = true,
          signs = false,
          update_in_insert = false,
        }
      )
    end
  },
}
