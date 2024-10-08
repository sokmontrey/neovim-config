local tele = require('telescope.builtin')
local dap = require('dap')

local all_mappings = {
	-- preventing fingers injuries
	{ "k",                "gk",                                                               "move up (including newline)" },
	{ "j",                "gj",                                                               "move down (including newline)" },
	{ "<ESC>",            vim.cmd.noh,                                                        "clear search highlight" },
	{ "<leader>wq",       "<cmd>NvimTreeClose<CR><cmd>waq<CR>",                               "close nvimtree before save exit" },
	{ "<leader>ww",       "<cmd>wa<CR>",                                                      "close nvimtree before save all exit" },
	{ "<leader>y",        '"+y',                                                              "copy to clipboard",                  "v" },
	{ "<leader>P",        '"+p',                                                              "paste from clipboard" },
	{ "<leader>P",        'ygv"+p',                                                           "yank before paste from clipboard",   "v" },
	{ "<C-u>",            "<C-u>zz",                                                          "centered scroll up" },
	{ "<C-d>",            "<C-d>zz",                                                          "centered scroll down" },
	{ "n",                "nzz",                                                              "centered next" },
	{ "N",                "Nzz",                                                              "centered previous" },

	-- debugging
	{ "<A-b>",            dap.toggle_breakpoint,                                              "toggle debugging breakpoint" },
	{ "<A-d>",            dap.continue,                                                       "start/resume debugger" },
	{ "<A-s>",            dap.step_over,                                                      "step debugger" },

	-- <leader>db toggle breakpoint
	-- <A-d> start/continue debugger (check plugins/debugger.lua)

	-- competitive programming
	{ "<leader>ss",       "/solve<CR>",                                                       "skip headers" },

	-- explorer
	{ "<leader>e",        vim.cmd.NvimTreeToggle,                                             "file explorer" },

	-- window navigation
	{ "<C-h>",            "<C-w>h",                                                           "move to left window" },
	{ "<C-j>",            "<C-w>j",                                                           "move to below window" },
	{ "<C-k>",            "<C-w>k",                                                           "move to above window" },
	{ "<C-l>",            "<C-w>l",                                                           "move to right window" },

	-- comment
	-- <leader>/ (check plugins/comment.lua)

	-- telescope
	{ "<A-f>",            tele.find_files,                                                    "find file using telescope" },
	{ "<leader>fg",       tele.grep_string,                                                   "string grep with telescope" },

	-- git
	{ "<leader>gi",       "<cmd>Git<CR>",                                                     "open vim figitive (for git)" },
	{ "<leader>gp",       "<cmd>Git push origin master<CR>",                                  "alias for git push" },

	-- lsp (check plugins/lsp-zero.lua for updated version)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- vim.keymap.set("n", "<A-k>", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "<leader>sa", vim.lsp.buf.code_action, opts)
	-- vim.keymap.set("n", "<leader>sr", vim.lsp.buf.rename, opts)

	-- terminal
	-- { "<leader><leader>", "<cmd>ToggleTerm size=65 direction=vertical<CR>", "toggle terminal",                    "n" },
	-- { "<leader><leader>", "<cmd>ToggleTerm<CR>",                            "close terminal",                    "t" },
	{ '<leader><leader>', '<Cmd>exe v:count1 .. "ToggleTerm size=65 direction=vertical"<CR>', { noremap = true, silent = true } },
	{ '<leader><leader>', '<Esc><Cmd>exe "ToggleTermToggleAll"<CR>',                          { noremap = true, silent = true },    { 'n', 't' } },

	-- project build
	{ '<leader>pp',       require('utils.build').compile_and_run,                             "compile current code and run" },
	{ '<leader>pc',       require('utils.build').compile,                                     "compile current code" },
	{ '<leader>pr',       require('utils.build').run,                                         "run current code" },

	-- color picker
	{ "<leader>cp",       "<cmd>CccPick<CR>",                                                 "turn on color picker" },
}

for _, map in pairs(all_mappings) do
	local opt = {}
	if type(map[3]) == "string" then
		opt = { desc = map[3] }
	elseif type(map[3]) == "table" then
		opt = map[3]
	end

	if map[4] == nil then
		vim.keymap.set("n", map[1], map[2], opt)
	else
		vim.keymap.set(map[4], map[1], map[2], opt)
	end
end
