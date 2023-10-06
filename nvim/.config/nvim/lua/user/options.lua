local options = {
    -- General
    encoding = "utf-8",                 -- the encoding written to a file
    history = 500,                      -- how many lines in history
    clipboard = "unnamedplus",          -- allows neovim to access the system clipboard
    showmode = false,                   -- hide, e.g.,  -- INSERT --
    smartindent = true,                 -- make indenting smarter again
    expandtab = true,                   -- convert tabs to spaces
    undofile = true,                    -- enable persistent undo
    showtabline = 2,                    -- always show tabs
    splitright = true,                  -- force all vertical splits to go to the right of current window
    splitbelow = true,                  -- force all horizontal splits to go below current window
    foldenable = false,                 -- don't fold text

    -- System
    undofile = true,                    --
    undolevels = 10000,                 --

    -- Searching
    ignorecase = true,                  -- ignore case in search patterns
    smartcase = true,                   -- smart case

    -- Line Settings
    relativenumber = true,              -- set relative numbered lines
    textwidth = 99,                     --
    colorcolumn = "100",                  --
    linebreak = true,                   --
    showbreak = "+++",                  --

    --- Color
--    syntax = true,                      --
    t_Co = 256,                         --
    termguicolors = true                -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
  vim.o[k] = v
end
