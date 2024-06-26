require('lazy').setup({
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('invertedEcho.bufferline')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('invertedEcho.telescope')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    config = function()
      require('invertedEcho.cmp')
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = function()
      require('invertedEcho.lsp')
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
  },
  {
    'm4xshen/autoclose.nvim',
    config = true,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('invertedEcho.nvimtree')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('invertedEcho.treesitter')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('invertedEcho.lualine')
    end,
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require('invertedEcho.conform')
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tokyonight-storm')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    keys = {
      '<c-\\>',
      '<leader>g',
    },
    config = function()
      require('invertedEcho.toggleterm')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('invertedEcho.notify')
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('invertedEcho.comment')
    end,
    event = 'BufEnter',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },
  {
    'folke/trouble.nvim',
    event = 'BufEnter',
    config = function()
      require('invertedEcho.trouble')
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('invertedEcho.ts-autotag')
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup({
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      })
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('invertedEcho.lint')
    end,
  },
  {},
}, {
  ui = {
    border = 'rounded',
    title = 'Lazy Package Manager',
  },
})
