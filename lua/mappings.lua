local all_mappings = {
  ['preventing fingers injury'] = {
    { 'k',                'gk',       'move up (including newline)' },
    { ';',                ':',        'just a replacement' },
    { '<leader><BS><BS>', ':wqa<CR>', 'save and close all buffers' },
    { '<ESC>',            ':noh<CR>', 'clear search highlight' },
    { 'J', ':m \'>+1<CR>gv=gv', 'move block down', {}, 'v' },
    { 'K', ':m \'<-2<CR>gv=gv', 'move block up',   {}, 'v' },
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
    { '<leader>fg', ':Telescope live_grep<CR>',  'live grep (searching for text)' },
    { '<leader>fb', ':Telescope buffers<CR>',    'find buffer' },
  },

  ['nvim-tree (file explorer)'] = {
    { '<leader>e', ':NvimTreeToggle<CR>', 'toggle file explorer' },
    { '<C-n>',     ':NvimTreeClose<CR>',  'close file explorer' },
  },

  ['lsp'] = {
    { 'K',          vim.lsp.buf.hover,          'hover definition' },
    { '<leader>sd', vim.lsp.buf.definition,     'go to definition' },
    { '<leader>si', vim.lsp.buf.implementation, 'go to implementation' },
    { '<leader>sa', vim.lsp.buf.code_action,    'code action',         {}, { 'n', 'v' } },
  },

  ['comment'] = {
    { '<leader>/', require('Comment.api').toggle.linewise.current,
      'toggle line comment' },

    { '<leader>/',
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'toggle line comment', {}, 'v' },
  },

  ['terminal'] = {
    { '<C-Space>',  ':ToggleTerm<CR>',   'toggle terminal',                       {}, 'n' },
    { '<C-Space>',  '<C-\\><C-n>:q<CR>', 'close terminal (during terminal mode)', {}, 't' },
    { '<ESC>',      '<C-\\><C-n>',       'escape terminal mode',                  {}, 't' },
    { '<leader>ts', ':TermSelect<CR>',   'select terminal' },
  },

  ['projects'] = {
    { '<leader>pp', ':Telescope neovim-project discover<CR>', 'search for projects' },
    { '<leader>ph', ':Telescope neovim-project history<CR>',  'project history' },
    { '<leader>pl', ':NeovimProjectLoadRecent<CR>',           'load recent project' },
  },

  ['git'] = {
    { '<leader>gi', ':Git<CR>',  'open vim figitive (for git)' },
    { '<leader>gp', ':Git push origin master', 'alias for git push' },
  },

  ['note'] = {
    {'<leader>p', function()
      require("nabla").popup({ border = "rounded" })
      -- " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
    end,
    'open nabla popup' },
  },
}

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
