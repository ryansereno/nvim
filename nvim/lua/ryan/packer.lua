-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local packer_opt_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.isdirectory(packer_opt_path) == 1 then
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- package manager

  use {
	  -- file search/ grep
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { -- advanced syntax highlighting
	  'nvim-treesitter/nvim-treesitter',
	  branch = 'master',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- LSP: native vim.lsp.config (Nvim 0.11+) + Mason for installing servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- ships server-specific configs in lsp/
  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-tree/nvim-tree.lua'
  use { 'nvim-lualine/lualine.nvim' } -- bottom info bar
  use "jiangmiao/auto-pairs" -- auto quote and bracket pairs
  use('jose-elias-alvarez/null-ls.nvim') -- injects LSP diagnostics into nvim
  use('MunifTanjim/prettier.nvim') -- prettify code
  use 'folke/trouble.nvim' -- pretty quickFix menu
  use 'nvim-tree/nvim-web-devicons' -- enable icons in lualine and telescope; edit ~/.local/share/nvim/site/pack/packer to fix specific icons, like vue
  use { "catppuccin/nvim", as = "catppuccin" } --color scheme
  use("oxfist/night-owl.nvim") --color scheme
  use "EdenEast/nightfox.nvim" --color scheme
  use "folke/tokyonight.nvim" --color scheme
  use 'shaunsingh/moonlight.nvim' --color scheme
  use 'norcalli/nvim-colorizer.lua'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use "folke/zen-mode.nvim"
  use { "ellisonleao/gruvbox.nvim" }
  use {"ember-theme/nvim"}
end)
