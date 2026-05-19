require('nvim-treesitter.configs').setup({
  ensure_installed = {
    -- core / nvim internals
    'lua', 'vim', 'vimdoc', 'query',
    -- LSP hover popups are markdown — needed to avoid parse errors on K
    'markdown', 'markdown_inline',
    -- languages
    'c', 'javascript', 'typescript', 'tsx', 'vue', 'html', 'css',
    'python', 'rust', 'json', 'yaml', 'bash',
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
