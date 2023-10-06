-- Map leader
vim.g.mapleader = " "

-- Telescope plugin
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true, silent = true })

-- Toggle Nerd Tree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Hide search highlight
vim.api.nvim_set_keymap('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })

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

-- LaTeX, here I create a function and call it in init.lua
function tex_mappings()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('i', ',ref', '\\ref{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',cp', '\\parencite{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',ct', '\\textcite{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',bf', '\\textbf{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',it', '\\textit{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',lb', '\\label{}<Esc>T{i', opts)
    vim.api.nvim_set_keymap('i', ',li', '\\item<Space>', opts)

    -- Put \begin{} \end{} around the current word.
    vim.api.nvim_set_keymap('n', '<leader>b', 'YpkI\\begin{<ESC>A}<ESC>jI\\end{<ESC>A}<esc>kA', opts)
end

-- Unbind default bindings for arrow keys, trust me this is for your own good
--vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-k>', '')
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', '')
