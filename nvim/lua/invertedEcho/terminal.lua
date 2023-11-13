local M = {}

M.setup = function()
  require('FTerm').setup({
    border = 'single',
    dimensions = {
      height = 0.95,
      width = 0.95,
    },
  })

  require('invertedEcho.keymaps').terminal()
end

return M
