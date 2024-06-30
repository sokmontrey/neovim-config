return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "OmniSharp/omnisharp-vim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local OmniSharpPath = "C:\\Users\\sokmo\\AppData\\Local\\omnisharp-vim\\omnisharp-roslyn\\Omnisharp.exe"

		local servers = {
			clangd = {},
			pyright = {},
			tsserver = {},
			lua_ls = {},
			omnisharp = {
				capabilities = capabilities,
				root_dir = util.root_pattern("*.sln", "*.csproj", "*.cs"),
				cmd = { OmniSharpPath },
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = false,
		})
	end,
}
