-- nvim-treesitter `main` branch (the 2024+ rewrite). No setup{}; just
-- declare which parsers to install, then start treesitter per-buffer.

-- Source of truth for installed parsers. Run :PackerSync after editing.
require('nvim-treesitter').install({
  -- core / nvim internals
  'lua', 'vim', 'vimdoc', 'query',
  -- LSP hover popups are markdown — needed to avoid parse errors on K
  'markdown', 'markdown_inline',
  -- languages you actually use
  'c', 'javascript', 'typescript', 'tsx', 'vue', 'html', 'css',
  'python', 'rust', 'json', 'yaml', 'bash',
})

-- Auto-start treesitter highlight (+ indent) when a buffer's filetype loads.
-- `pcall` swallows the "parser not installed" error for filetypes we didn't list.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
