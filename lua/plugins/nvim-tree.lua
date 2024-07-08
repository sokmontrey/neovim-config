return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup()
	end,
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	},
}
