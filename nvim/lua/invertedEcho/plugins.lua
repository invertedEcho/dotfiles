local M = {
  'folke/lazy.nvim',
  'nvim-lua/plenary.nvim',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = require('invertedEcho.colorscheme').setup,
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('invertedEcho.nvim_tree').setup,
  },
  {
    'hrsh7th/nvim-cmp',
    config = require('invertedEcho.cmp').setup,
    event = 'BufEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  },
  { 'williamboman/mason.nvim', config = true, cmd = 'Mason' },
  { 'williamboman/mason-lspconfig.nvim', config = true, event = 'BufEnter' },
  {
    'neovim/nvim-lspconfig',
    event = 'BufEnter',
    config = require('invertedEcho.lsp').setup,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = 'TSUpdate',
    config = require('invertedEcho.treesitter').setup,
    event = 'BufEnter',
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufEnter' },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = require('invertedEcho.telescope').setup,
    keys = '<leader>t',
  },
  {
    'mhartington/formatter.nvim',
    event = 'BufEnter',
    config = require('invertedEcho.formatter').setup,
  },
  {
    'numToStr/FTerm.nvim',
    keys = '<c-\\>',
    config = require('invertedEcho.terminal').setup,
  },
  {
    'windwp/nvim-autopairs',
    event = 'BufEnter',
    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    config = require('invertedEcho.comment').setup,
    event = 'BufEnter',
  },
  'b0o/SchemaStore.nvim',
  {
    'folke/trouble.nvim',
    event = 'BufEnter',
  },
  {
    'jose-elias-alvarez/typescript.nvim',
    event = 'BufEnter',
  },
  {
    'nathom/filetype.nvim',
    lazy = false,
    config = require('invertedEcho.filetype').setup,
  },
  { 'akinsho/bufferline.nvim' },
  { 'rose-pine/neovim' },
  {
    'folke/zen-mode.nvim',
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}

return M
