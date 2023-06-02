local M = {}

M.setup = function()
  local telescope = require('telescope')

  telescope.setup({})

  require('invertedEcho.keymaps').telescope()
end

return M
