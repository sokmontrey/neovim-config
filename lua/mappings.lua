local all_mappings = {
  ['preventing fingers injury'] = {
    { 'k',                'gk',             'move up (including newline)' },
    { 'j',                'gj',             'move down (including newline)' },
    { '<leader><BS><BS>', ':wqa<CR>',       'save and close all buffers' },
    { '<ESC>',            ':noh<CR>',       'clear search highlight' },
    { 'J',                ':m \'>+1<CR>gv', 'move block down',                  {}, 'v' },
    { 'K',                ':m \'<-2<CR>gv', 'move block up',                    {}, 'v' },
    { '<leader>ww',       ':wa<CR>',        'save all' },
    { '<leader>wq',       ':wq<CR>',        'save and close window' },
    { '<leader>qq',       ':q<CR>',         'close window' },
    { '<leader>y',        '"+y',            'copy to clipboard',                {}, 'v' },
    { '<leader>P',        '"+p',            'paste from clipboard' },
    { '<leader>P',        'ygv"+p',         'yank before paste from clipboard', {}, 'v' },
  },

  ['note'] = {
    { '<leader>nn', function()
      require('global-note').toggle_note()
    end, 'open global notes' },
  },

  ['good navigation practices'] = {
    { '{',     '<C-u>zz', 'alias for C-u ' },
    { '}',     '<C-d>zz', 'alias for C-d ' },
    { '<C-u>', '<C-u>zz', 'centered scroll up' },
    { '<C-d>', '<C-d>zz', 'centered scroll down' },
    { 'n',     'nzz',     'centered next' },
    { 'N',     'Nzz',     'centered previous' },
  },

  ['window navigation'] = {
    { '<C-h>', '<C-w>h', 'move to left window' },
    { '<C-j>', '<C-w>j', 'move to below window' },
    { '<C-k>', '<C-w>k', 'move to above window' },
    { '<C-l>', '<C-w>l', 'move to right window' },
  },

  ['tab navigation'] = {
    { '<Tab>',     ':bn<CR>',       'go to next buffer' },
    { '<S-Tab>',   ':bp<CR>',       'go to previous buffer' },
    { '<leader>x', ':bp | bd#<CR>', 'close buffer' },
  },

  ['none-ls'] = {
    { '<leader>fm', vim.lsp.buf.format, 'format current buffer' },
  },

  ['telescope (searcher)'] = {
    { '<leader>ff', ':Telescope find_files<CR>', 'find file' },
    { '<A-f>',      ':Telescope find_files<CR>', 'find file' },
    { '<leader>fg', ':Telescope live_grep<CR>',  'live grep (searching for text)' },
    { '<leader>fb', ':Telescope buffers<CR>',    'find buffer' },
    { '<A-b>',      ':Telescope buffers<CR>',    'find buffer' },
  },

  ['file-explorer'] = {
    { '<leader>e', ':NvimTreeToggle<CR>', 'find file in file explorer' },
  },

  ['lsp'] = {
    { 'K',          vim.lsp.buf.hover,          'hover definition' },
    { '<leader>sd', vim.lsp.buf.definition,     'go to definition' },
    { '<leader>si', vim.lsp.buf.implementation, 'go to implementation' },
    { '<leader>sa', vim.lsp.buf.code_action,    'code action',         {}, { 'n', 'v' } },
    { '<leader>sr', vim.lsp.buf.rename,         'rename',              {}, { 'n', 'v' } },
    { '<leader>se', vim.diagnostic.open_float,  'open diagnostics' },
  },

  ['comment'] = {
    { '<leader>/', require('Comment.api').toggle.linewise.current,
      'toggle line comment' },

    { '<leader>/',
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'toggle line comment', {}, 'v' },
  },

  ['terminal'] = {
    { '<C-Space>',  ':ToggleTerm size=75 direction=vertical<CR>', 'toggle terminal',                       {}, 'n' },
    { '<C-Space>',  '<C-\\><C-n>:q<CR>',                          'close terminal (during terminal mode)', {}, 't' },
    { '<ESC>',      '<C-\\><C-n>',                                'escape terminal mode',                  {}, 't' },
    { '<leader>ts', ':TermSelect<CR>',                            'select terminal' },
  },

  ['projects'] = {
    { '<leader>pp', ':Telescope neovim-project discover<CR>', 'search for projects' },
    { '<leader>ph', ':Telescope neovim-project history<CR>',  'project history' },
    { '<leader>pl', ':NeovimProjectLoadRecent<CR>',           'load recent project' },
  },

  ['git'] = {
    { '<leader>gi', ':Git<CR>',                'open vim figitive (for git)' },
    { '<leader>gp', ':Git push origin master', 'alias for git push' },
  },

  ['harpoon'] = {
    { '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'open harpoon menu' },
    { '<A-h>',      ':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'open harpoon menu' },
    { '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',        'add current file' },
    -- check the bottom of the file for Alt + n harpoon mappings
    { '<A-Tab>',    ':lua require("harpoon.ui").nav_next()<CR>',          'go to next file' },
    { '<A-S-Tab>',  ':lua require("harpoon.ui").nav_prev()<CR>',          'go to previous file' },
  },
}

-- Alt + n harpoon mappings
-- Alt + 1 to Alt + 9
for i = 1, 9 do
  table.insert(all_mappings['harpoon'], {
    '<A-' .. i .. '>',
    ':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>',
    'go to file ' .. i
  })
end

for _, group_maps in pairs(all_mappings) do
  for _, map in pairs(group_maps) do
    local opts = {}
    if (map[4] ~= nil) then opts = map[4] end

    if (map[5] == nil) then
      vim.keymap.set('n', map[1], map[2], opts)
    else
      vim.keymap.set(map[5], map[1], map[2], opts)
    end
  end
end

return all_mappings
