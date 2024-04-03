require('lazy').setup({
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
      set_key('n', '<tab>', '<cmd>BufferLineCycleNext<cr>')
      set_key('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = require('invertedEcho.telescope'),
    cmd = 'Telescope',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine-moon')
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
}, {
  ui = {
    border = 'rounded',
    title = 'Lazy Package Manager',
  },
})
