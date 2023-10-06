-- Maintainer: Magnus Hansson
-- Last change: 2023-09-16

--------------------------------------------------------------------------------
-- Import settings
--------------------------------------------------------------------------------
require('user/options')
require('user/keymaps')

--------------------------------------------------------------------------------
-- Import plugins
--------------------------------------------------------------------------------
require('plugins/plugins')
require('plugins/plugins_config/')
--require("bufferline").setup{}

--------------------------------------------------------------------------------
-- Python PEP 8
--------------------------------------------------------------------------------
--vim.o.textwidth = 79
--vim.o.colorcolumn = 80
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

--------------------------------------------------------------------------------
-- LaTeX: Call tex_mappings when FileType is .tex
--------------------------------------------------------------------------------
vim.cmd [[
  augroup MyTexGroup
    autocmd!
    autocmd FileType tex lua tex_mappings()
  augroup END
]]

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

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})
