-- Maintainer: Magnus Hansson
-- Last change: 2022-08-15

--------------------------------------------------------------------------------
-- Load packer plugins, run :PackerSync to install
--------------------------------------------------------------------------------
-- Load lua/packes-plugins.lua
require('user/packer-plugins')

-- Lualine
require('lualine').setup({
    options = {
        theme = 'dracula',
    }
})
require('lualine').setup()

-- Bufferline
require("bufferline").setup{}

-- Treesitter
require('user/treesitter')

--------------------------------------------------------------------------------
-- Import settings
--------------------------------------------------------------------------------
require('user/options')
require('user/keymaps')
require('user/indent-blankline')

--------------------------------------------------------------------------------
-- Python PEP 8
--------------------------------------------------------------------------------
--vim.o.textwidth = 79
--vim.o.colorcolumn = 80
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

--------------------------------------------------------------------------------
-- LaTeX
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Misc.
--------------------------------------------------------------------------------
-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]]
})

-- Reload whenever .Xresources is updated
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "~/.Xresources" },
  command = [[!xrdb %]]
})
