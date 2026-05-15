-- Native LSP setup (Nvim 0.11+ vim.lsp.config / vim.lsp.enable flow).

-- Wire nvim-cmp capabilities into every server config.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- vue_ls (v3.x) runs in hybrid mode and forwards TS requests via a
-- `typescript.tsserverRequest` command. Only vtsls exposes that command,
-- so we use vtsls (not ts_ls) as the TS-side server.
local vue_ts_plugin = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin'

vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_ts_plugin,
            languages = { 'vue' },
            configNamespace = 'typescript',
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Source of truth for which LSPs to install. On a new machine, Mason
  -- will auto-install anything in this list. Add a server here to make
  -- it part of your reproducible setup.
  ensure_installed = {
    'clangd',
    'html',
    'lua_ls',
    'marksman',
    'omnisharp',
    'pylsp',
    'rust_analyzer',
    'vtsls',
    'vue_ls',
  },
  -- automatic_enable = true (default in v2): calls vim.lsp.enable()
  -- for every server installed via :Mason, picking up configs from
  -- nvim-lspconfig's lsp/ directory and any vim.lsp.config(...) overrides.
})

-- Keymaps: mirror what lsp-zero's default_keymaps used to provide.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
    -- Diagnostics
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count =  1 }) end, opts)
  end,
})
