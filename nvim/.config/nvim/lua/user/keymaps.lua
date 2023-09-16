-- Map leader
vim.g.mapleader = " "

-- Telescope plugin
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true, silent = true })

-- Toggle Nerd Tree
vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Switch to next and previous buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', { noremap = true, silent = true })

-- Move between split screens
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Spellcheck
vim.api.nvim_set_keymap('n', '<leader>ss', ':setlocal spell!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sn', ']s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', '[s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sa', 'zg', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sr', 'zug', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s?', 'z=', { noremap = true, silent = true })
