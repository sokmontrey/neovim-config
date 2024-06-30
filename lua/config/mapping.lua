local tele_builtin = require("telescope.builtin")

local all_mappings = {
	-- preventing figure injuries
	{ "k", "gk", "move up (including newline)" },
	{ "j", "gj", "move down (including newline)" },
	{ "<ESC>", "<cmd>noh<CR>", "clear search highlight" },
	{ "<leader>wq", "<cmd>NvimTreeClose<CR><cmd>wq<CR>", "close nvimtree before save exit" },
	{ "<leader>ww", "<cmd>NvimTreeClose<CR><cmd>wa<CR>", "close nvimtree before save all exit" },
	{ "<leader>y", '"+y', "copy to clipboard", "v" },
	{ "<leader>P", '"+p', "paste from clipboard" },
	{ "<leader>P", 'ygv"+p', "yank before paste from clipboard", "v" },
	{ "<C-u>", "<C-u>zz", "centered scroll up" },
	{ "<C-d>", "<C-d>zz", "centered scroll down" },
	{ "n", "nzz", "centered next" },
	{ "N", "Nzz", "centered previous" },

	-- window navigation
	{ "<C-h>", "<C-w>h", "move to left window" },
	{ "<C-j>", "<C-w>j", "move to below window" },
	{ "<C-k>", "<C-w>k", "move to above window" },
	{ "<C-l>", "<C-w>l", "move to right window" },

	-- buffer
	{ "<leader>x", "<cmd>bp | bd#<CR>", "close buffer" },

	-- explorer
	{ "<leader>e", "<cmd>NvimTreeToggle<CR>", "file explorer" },

	-- lsp
	{ "<leader>se", "<CMD>TroubleToggle<CR>", "show all diagnostic" },
	{ "K", vim.lsp.buf.hover, "hover definition" },
	{ "<leader>sd", vim.lsp.buf.definition, "go to definition" },
	{ "<leader>si", vim.lsp.buf.implementation, "go to implementation" },
	{ "<leader>sa", vim.lsp.buf.code_action, "code action", { "n", "v" } },
	{ "<A-a>", vim.lsp.buf.code_action, "code action", { "n", "i", "v" } },
	{ "<leader>sr", vim.lsp.buf.rename, "rename", { "n", "v" } },
	{ "<A-k>", vim.diagnostic.open_float, "open diagnostics" },

	-- comment
	{ "<leader>/", require("Comment.api").toggle.linewise.current, "toggle line comment", { "n", "v" } },

	{
		"<leader>/",
		"<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		"toggle line comment",
		"v",
	},

	-- terminal
	{ "<leader><leader>", "<cmd>ToggleTerm size=65 direction=vertical<CR>", "toggle terminal", "n" },
	{ "<leader><leader>", "<cmd>ToggleTerm<CR>", "toggle terminal", "t" },

	-- telescope
	{ "<A-f>", tele_builtin.find_files, "telescope find files" },
	{ "<leader>tk", tele_builtin.keymaps, "telescope show keymaps" },

	-- projects
	{ "<leader>pp", "<cmd>Telescope neovim-project discover<CR>", "search for projects" },
	{ "<leader>ph", "<cmd>Telescope neovim-project history<CR>", "project history" },
	{ "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", "load recent project" },

	-- git
	{ "<leader>gi", "<cmd>Git<CR>", "open vim figitive (for git)" },
	{ "<leader>gp", "<cmd>Git push origin master", "alias for git push" },
}

for _, map in pairs(all_mappings) do
	if map[4] == nil then
		vim.keymap.set("n", map[1], map[2], { desc = map[3] })
	else
		vim.keymap.set(map[4], map[1], map[2], { desc = map[3] })
	end
end
