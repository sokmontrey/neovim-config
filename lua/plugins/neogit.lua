return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
	},
	config = function()
		require('neogit').setup({
			signs = {
				-- { CLOSED, OPENED }
				hunk = { "", "" },
				item = { ".", "+" },
				section = { ".", "+" },
			},
		})
	end
}
