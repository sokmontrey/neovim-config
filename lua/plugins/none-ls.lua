return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.csharpier,
				-- null_ls.builtins.formatting.ast_grep,
				-- null_ls.builtins.diagnostics.eslint_d,
			}
		})
	end
}
