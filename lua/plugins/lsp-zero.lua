local servers = {
	'lua_ls',
	'svelte',
	'ts_ls',
	'astro',
	'pyright',
	'clangd',
	'csharp_ls', -- MUST Run dotnet tool install -g csharp-ls --version 0.5.0 for .NET 6.0
	'tailwindcss',
	'cssls',
	'prettier',
	'jdtls',
}

local dont_install = {
	'csharp_ls',
	'tailwindcss',
}

local function filter(t, filterIter)
	local out = {}

	for index, value in pairs(t) do
		if filterIter(value, index, t) then out[index] = value end
	end

	return out
end

local function has (t, val)
    for _, value in ipairs(t) do
        if value == val then
            return true
        end
    end

    return false
end

return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'neovim/nvim-lspconfig' },
	},

	config = function()
		local lsp_zero = require('lsp-zero')
		local lspconf = require('lspconfig')

		local lsp_attach = lsp_zero.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<A-k>", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
			vim.keymap.set({ "n", "v" }, "<leader>sa", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>sf", "<cmd>LspZeroFormat<CR>", opts)
		end)

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
		})

		---------------------------------------------------
		----------------------- LSP -----------------------
		---------------------------------------------------

		local ensure_installed = filter(servers, function(server)
			return not has(dont_install, server)
		end)

		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = ensure_installed,
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
