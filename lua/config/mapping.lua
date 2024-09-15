local tele = require('telescope.builtin')

local all_mappings = {
	-- explorer
	{ "<leader>e", vim.cmd.NvimTreeToggle, "file explorer" },

	-- window navigation
	{ "<C-h>", "<C-w>h", "move to left window" },
	{ "<C-j>", "<C-w>j", "move to below window" },
	{ "<C-k>", "<C-w>k", "move to above window" },
	{ "<C-l>", "<C-w>l", "move to right window" },

	-- comment 
	-- <leader>/ (check plugins/comment.lua)
	
	-- telescope
	{ "<A-f>", tele.find_files, "find file using telescope" },
	{ "<leader>fg", tele.grep_string, "string grep with telescope" },

	-- git
	{ "<leader>gi", "<cmd>Git<CR>", "open vim figitive (for git)" },
	{ "<leader>gp", "<cmd>Git push origin master<CR>", "alias for git push" },
}

for _, map in pairs(all_mappings) do
	if map[4] == nil then
		vim.keymap.set("n", map[1], map[2], { desc = map[3] })
	else
		vim.keymap.set(map[4], map[1], map[2], { desc = map[3] })
	end
end
