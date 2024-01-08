vim.g.mapleader = ' '

local all_mappings = {
  ['n'] = {
    -- preveting fingers injury
    {'j', 'gj'},
    {'k', 'gk'},
    {';', ':'},

    -- window navigation
    {'<C-h>', '<C-w>h'},
    {'<C-j>', '<C-w>'},
    {'<C-k>', '<C-w>k'},
    {'<C-l>', '<C-w>l'},

    -- save all and exit
    {'<leader><BS><BS>', ':wqa<CR>'},
  }
}

for mode, maps in pairs(all_mappings) do
  for _, map in pairs(maps) do
    vim.keymap.set(mode, map[1], map[2], {})
  end
end
