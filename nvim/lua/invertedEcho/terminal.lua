local M = {}

M.setup = function()
  require('FTerm').setup({
    border = 'single',
  })

  require('invertedEcho.keymaps').terminal()
end

return M
