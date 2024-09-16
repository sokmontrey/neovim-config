return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
	},

	config = function ()
		local lsp_zero = require('lsp-zero')
		local lspconf = require('lspconfig')

		local lsp_attach = lsp_zero.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<A-k>", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>sa", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts)
		end)

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
		})

		---------------------------------------------------
		----------------------- LSP -----------------------
		---------------------------------------------------

		local servers = {
			'lua_ls',
			'svelte',
			'ts_ls',
			'astro',
			'pyright',
			'clangd',
		}

		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = servers,
			handlers = {
				function(server_name)
					lspconf[server_name].setup({})
				end,
			},
			-- this is the "custom handler" for `example_server`
			-- example_server = function()
			--   require('lspconfig').example_server.setup({
			-- 	---
			-- 	-- in here you can add your own
			-- 	-- custom configuration
			-- 	---
			--   })
			-- end,
		})
	end,
}
