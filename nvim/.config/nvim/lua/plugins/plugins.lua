--------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
-- Load plugins
--------------------------------------------------------------------------------

local plugins = {
  'nvim-tree/nvim-tree.lua',
  'LunarVim/bigfile.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins/plugins_config/treesitter')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    branch = 'main',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({})
    end,
  },
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.3',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
