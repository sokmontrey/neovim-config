local tele = require('telescope.builtin')
local dap = require('dap')

local all_mappings = {
	-- preventing fingers injuries
	{ "k",          "gk",                                 "move up (including newline)" },
	{ "j",          "gj",                                 "move down (including newline)" },
	{ "<ESC>",      vim.cmd.noh,                          "clearing search" },
	{ "<leader>wq", "<cmd>NvimTreeClose<CR><cmd>waq<CR>", "close nvimtree before save exit" },
	{ "<leader>ww", "<cmd>wa<CR>",                        "close nvimtree before save all exit" },
	{ "<leader>y",  '"+y',                                "copy to clipboard",                  "v" },
	{ "<leader>P",  '"+p',                                "paste from clipboard" },
	{ "<leader>P",  'ygv"+p',                             "yank before paste from clipboard",   "v" },
	{ "<C-u>",      "<C-u>zz",                            "centered scroll up" },
	{ "<C-d>",      "<C-d>zz",                            "centered scroll down" },
	{ "n",          "nzz",                                "centered next" },
	{ "N",          "Nzz",                                "centered previous" },
	{ "<leader>x",  "<cmd>bd<CR>",                        "close current buffer" },

	-- debugging
	{ "<leader>db", dap.toggle_breakpoint,                "toggle debugging breakpoint" },
	{ "<A-d>",      dap.continue,                         "start/resume debugger" },
	{ "<leader>ds", dap.step_over,                        "step debugger" },
	{ "<leader>dt", dap.terminate,                        "step debugger" },

	-- <leader>db toggle breakpoint
	-- <A-d> start/continue debugger (check plugins/debugger.lua)

	-- explorer
	{ "<leader>e",  vim.cmd.NvimTreeToggle,               "file explorer" },

	-- window navigation
	{ "<C-h>",      "<C-w>h",                             "move to left window" },
	{ "<C-j>",      "<C-w>j",                             "move to below window" },
	{ "<C-k>",      "<C-w>k",                             "move to above window" },
	{ "<C-l>",      "<C-w>l",                             "move to right window" },

	-- comment
	-- <leader>/ (check plugins/comment.lua)

	-- telescope
	-- { "<A-f>",            tele.find_files,                                                    "find file using telescope" },
	-- fzf
	-- { "<A-f>",            require('fzf-lua').files,                                           "find file using telescope" },
	{ "<A-f>", "<cmd>FZF " ..
	"--walker-skip .git,node_modules,target " ..
	"--layout=reverse " ..
	"--padding=1 " ..
	"--no-multi " ..
	"--bind=tab:down,shift-tab:up " ..
	"--prompt Projects> <CR>", "find file using telescope" },

	-- git
	-- { '<leader>gi',       ':20TermExec direction=float cmd="lazygit"<CR>',                    { noremap = true, silent = true } },
	-- { "<leader>gi",       "<cmd>vertical Git<CR>",                                            "open vim figitive (for git)" },
	{ "<A-g>",            "<cmd>Neogit<CR>",                                                  "open neogit" },
	-- { "<leader>gp",       "<cmd>Git push origin master<CR>",                                  "alias for git push" },

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
	{ '<leader><leader>', '<Cmd>exe v:count1 .. "ToggleTerm size=65 direction=vertical"<CR>', { noremap = true, silent = true }, { 'n', 't' } },
	-- { '<leader>x',        '<Esc><Cmd>exe "ToggleTermToggleAll"<CR>',                          { noremap = true, silent = true },    { 'n', 't' } },

	-- project build
	{ '<A-c>',            require('utils.build').compile,                                     "compile current code" },
	{ '<A-r>',            require('utils.build').compile_and_run,                             "run current code" },

	-- c++ competitive programming
	{ '<leader>cip', function()
		local filename = "./inputs/" .. vim.fn.expand('%:t:r') .. ".txt"
		local f = io.open(filename, 'r')
		if f == nil then f = io.open(filename, "w") end
		vim.cmd("e " .. filename)
		io.close(f)
	end, 'create {filename.cpp}.txt in ./inputs/' },

	{ '<leader>gip', function()
		local filename = vim.fn.expand('%:t:r') .. ".txt"
		local pos = vim.api.nvim_win_get_cursor(0)[2]
		local line = vim.api.nvim_get_current_line()
		local nline = line:sub(0, pos) .. filename .. line:sub(pos + 1)
		vim.api.nvim_set_current_line(nline)
	end, 'get input.txt filename and paste it at the cursor' },

	-- color picker
	{ "<leader>cp", "<cmd>CccPick<CR>", "turn on color picker" },

	-- header comment 
	{ "<leader>cc", "i//================================ ================================<ESC>bhi ", "header comment"},
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
