local M = {}

M.setup = function()
  require('catppuccin').setup({
    color_overrides = {
      mocha = {
        -- original colors darkened by 50%
        base = '#0f0f17',
        mantle = '#0c0c12',
      },
    },
  })

  U.cmd('colorscheme catppuccin')
end

return M
