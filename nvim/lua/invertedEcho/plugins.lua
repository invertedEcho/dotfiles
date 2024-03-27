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
    'akinsho/toggleterm.nvim',
    keys = {
      '<c-\\>',
      '<leader>g',
    },
    -- keys = '<c-\\>',
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
  -- RegEx helper
  {
    'tomiis4/Hypersonic.nvim',
    event = 'CmdlineEnter',
    cmd = 'Hypersonic',
    config = function()
      require('hypersonic').setup({})
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },
  {
    'stevearc/dressing.nvim',
    lazy = false,
    config = function()
      require('dressing').setup({})
    end,
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
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
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
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
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  -- nvim dap should be in it's config file
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          {
            '<leader>du',
            function()
              require('dapui').toggle({})
            end,
            desc = 'Dap UI',
          },
          {
            '<leader>de',
            function()
              require('dapui').eval()
            end,
            desc = 'Eval',
            mode = { 'n', 'v' },
          },
        },
        opts = {},
        config = function(_, opts)
          local dap = require('dap')
          local dapui = require('dapui')
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close({})
          end
        end,
      },
    },
  },
  {
    'mfussenegger/nvim-dap-python',
    filetype = 'python',
    config = function()
      require('dap-python').setup()
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('lualine').setup({
        options = { section_separators = '', component_separators = '' },
      })
    end,
  },
  {
    'TobinPalmer/Tip.nvim',
    event = 'VimEnter',
    init = function()
      -- Default config
      --- @type Tip.config
      require('tip').setup({
        seconds = 3,
        title = 'Tip!',
        url = 'https://vtip.43z.one', -- Or https://vimiscool.tech/neotip
        -- url = 'https://vimiscool.tech/neotip', -- Or https://vimiscool.tech/neotip
      })
    end,
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
    lazy = false,
    config = function()
      require('fidget').setup({

        -- Options related to LSP progress subsystem
        progress = {
          poll_rate = 0, -- How and when to poll for progress messages
          suppress_on_insert = false, -- Suppress new messages while in insert mode
          ignore_done_already = false, -- Ignore new tasks that are already complete
          ignore_empty_message = false, -- Ignore new tasks that don't contain a message
          -- Clear notification group when LSP server detaches
          clear_on_detach = function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
          -- How to get a progress message's notification group key
          notification_group = function(msg)
            return msg.lsp_client.name
          end,
          ignore = {}, -- List of LSP servers to ignore

          -- Options related to how LSP progress messages are displayed as notifications
          display = {
            render_limit = 16, -- How many LSP messages to show at once
            done_ttl = 3, -- How long a message should persist after completion
            done_icon = '✔', -- Icon shown when all LSP progress tasks are complete
            done_style = 'Constant', -- Highlight group for completed LSP tasks
            progress_ttl = math.huge, -- How long a message should persist when in progress
            -- Icon shown when LSP progress tasks are in progress
            progress_icon = { pattern = 'dots', period = 1 },
            -- Highlight group for in-progress LSP tasks
            progress_style = 'WarningMsg',
            group_style = 'Title', -- Highlight group for group name (LSP server name)
            icon_style = 'Question', -- Highlight group for group icons
            priority = 30, -- Ordering priority for LSP notification group
            skip_history = true, -- Whether progress notifications should be omitted from history
            -- How to format a progress message
            format_message = require('fidget.progress.display').default_format_message,
            -- How to format a progress annotation
            format_annote = function(msg)
              return msg.title
            end,
            -- How to format a progress notification group's name
            format_group_name = function(group)
              return tostring(group)
            end,
            overrides = { -- Override options from the default notification config
              rust_analyzer = { name = 'rust-analyzer' },
            },
          },

          -- Options related to Neovim's built-in LSP client
          lsp = {
            progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
            log_handler = false, -- Log `$/progress` handler invocations (for debugging)
          },
        },

        -- Options related to notification subsystem
        notification = {
          poll_rate = 10, -- How frequently to update and render notifications
          filter = vim.log.levels.INFO, -- Minimum notifications level
          history_size = 128, -- Number of removed messages to retain in history
          override_vim_notify = false, -- Automatically override vim.notify() with Fidget
          -- How to configure notification groups when instantiated
          configs = { default = require('fidget.notification').default_config },
          -- Conditionally redirect notifications to another backend
          redirect = function(msg, level, opts)
            if opts and opts.on_open then
              return require('fidget.integration.nvim-notify').delegate(
                msg,
                level,
                opts
              )
            end
          end,

          -- Options related to how notifications are rendered as text
          view = {
            stack_upwards = true, -- Display notification items from bottom to top
            icon_separator = ' ', -- Separator between group name and icon
            group_separator = '---', -- Separator between notification groups
            -- Highlight group used for group separator
            group_separator_hl = 'Comment',
            -- How to render notification messages
            render_message = function(msg, cnt)
              return cnt == 1 and msg or string.format('(%dx) %s', cnt, msg)
            end,
          },

          -- Options related to the notification window and buffer
          window = {
            normal_hl = 'Comment', -- Base highlight group in the notification window
            winblend = 100, -- Background color opacity in the notification window
            border = 'none', -- Border around the notification window
            zindex = 45, -- Stacking priority of the notification window
            max_width = 0, -- Maximum width of the notification window
            max_height = 0, -- Maximum height of the notification window
            x_padding = 1, -- Padding from right edge of window boundary
            y_padding = 0, -- Padding from bottom edge of window boundary
            align = 'bottom', -- How to align the notification window
            relative = 'editor', -- What the notification window position is relative to
          },
        },

        -- Options related to integrating with other plugins
        integration = {
          ['nvim-tree'] = {
            enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
          },
          ['xcodebuild-nvim'] = {
            enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
          },
        },

        -- Options related to logging
        logger = {
          level = vim.log.levels.WARN, -- Minimum logging level
          max_size = 10000, -- Maximum log file size, in KB
          float_precision = 0.01, -- Limit the number of decimals displayed for floats
          -- Where Fidget writes its logs to
          path = string.format('%s/fidget.nvim.log', vim.fn.stdpath('cache')),
        },
      })
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    config = function()
      vim.cmd('colorscheme rose-pine-moon')
    end,
  },
}

return M
