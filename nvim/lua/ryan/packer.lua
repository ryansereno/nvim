-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
	  run = ':TSUpdate'
  }
  use {
	  -- creates and configures LSP servers
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use('neovim/nvim-lspconfig') -- default configs for LSP
  --use "preservim/nerdtree" -- file tree
  use 'nvim-tree/nvim-tree.lua'
  use { 'nvim-lualine/lualine.nvim' } -- bottom info bar
  use "jiangmiao/auto-pairs" -- auto quote and bracket pairs
  use('jose-elias-alvarez/null-ls.nvim') -- injects LSP diagnostics into nvim
  use('MunifTanjim/prettier.nvim') -- prettify code
  use 'folke/trouble.nvim' -- pretty quickFix menu
  --use 'ryanoasis/vim-devicons' -- enable icons nerdtree
  use 'nvim-tree/nvim-web-devicons' -- enable icons in lualine and telescope; edit ~/.local/share/nvim/site/pack/packer to fix specific icons, like vue
  use { "catppuccin/nvim", as = "catppuccin" } --color scheme
  use("oxfist/night-owl.nvim") --color scheme
  use "EdenEast/nightfox.nvim" --color scheme
  use "folke/tokyonight.nvim" --color scheme
  use 'shaunsingh/moonlight.nvim' --color scheme
end)
