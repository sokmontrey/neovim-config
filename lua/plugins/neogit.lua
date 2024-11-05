return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"ibhagwan/fzf-lua",
	},
	config = function()
		require('neogit').setup({
			signs = {
				-- { CLOSED, OPENED }
				hunk = { "", "" },
				item = { ".", "+" },
				section = { ".", "+" },
			},
			-- function()
			--   require('gitgraph').draw({}, { all = true, max_count = 5000 })
			-- end,
		})
	end
}
