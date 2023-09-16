-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Install plugins
return require('packer').startup(function()
    -- Add packages by their shorthand Github URL: https://github.com/wbthomason/packer.nvim

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Status bar and buffer bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Nerdtree
    use 'preservim/nerdtree'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Fonts
    use 'ryanoasis/vim-devicons'

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Show indentation
    use "lukas-reineke/indent-blankline.nvim"
end)
