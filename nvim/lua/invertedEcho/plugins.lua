local M = {
  'folke/lazy.nvim',
  'nvim-lua/plenary.nvim',
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
  { 'akinsho/bufferline.nvim' },
  { 'rose-pine/neovim' },
  {
    'folke/zen-mode.nvim',
    lazy = false,
    opts = {},
  },
  {
    'tomiis4/Hypersonic.nvim',
    event = 'CmdlineEnter',
    cmd = 'Hypersonic',
    config = function()
      require('hypersonic').setup({
        -- config
      })
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify')
    end,
    lazy = false,
  },
  {
    'f-person/git-blame.nvim',
    lazy = false,
    config = function()
      require('gitblame').setup({
        enabled = true,
      })
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd('colorschem tokyonight-night')
    end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = false,
  },
}

return M
