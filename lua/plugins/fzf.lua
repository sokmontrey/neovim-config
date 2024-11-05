return {
	{
		"junegunn/fzf",
		build = "install --bin",
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("fzf-lua").setup({
	-- 			files = {
	-- 				find_opts = [[-type f -not -path '*/\.git/*' -not -path '*/node_modules/*' -printf '%P\n']],
	-- 				previewer = false,
	-- 			},
	-- 		})
	-- 	end
	-- }
}
