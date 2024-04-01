require("lazy").setup({
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = 'nvim-lua/plenary.nvim',
    config = require("invertedEcho.telescope"),
    cmd = 'Telescope'
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine-moon')
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    -- FIXME
    lazy = false,
    config = require("invertedEcho.lsp").setup,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip'
    },
  },
})
