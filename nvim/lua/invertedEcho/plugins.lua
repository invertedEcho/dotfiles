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
    lazy = false,
    config = require('invertedEcho.telescope').setup,
    -- cmd = 'Telescope',
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
    -- FIXME
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
      -- TODO: make seperators not triangle but just vertical line
      require('lualine').setup({
        options = {
          theme = 'palenight',
          component_seperators = { left = nil, right = nil },
        },
      })
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
      require('fidget').setup({
        progress = {
          display = {
            done_icon = '✔',
          },
        },
      })
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
      local notify = require('notify')
      vim.notify = notify
      notify.setup({
        fps = 144,
        stages = 'slide',
      })
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
}, {
  ui = {
    border = 'rounded',
    title = 'Lazy Package Manager',
  },
})
