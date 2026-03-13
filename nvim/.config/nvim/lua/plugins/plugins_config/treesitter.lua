-- Install parsers (using the new nvim-treesitter API)
require'nvim-treesitter'.install({ "python", "bash", "markdown", "c", "lua", "rust", "ruby", "vim" })

-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if not ok then
      -- Silently fail if parser not available for this filetype
    end
  end,
})
