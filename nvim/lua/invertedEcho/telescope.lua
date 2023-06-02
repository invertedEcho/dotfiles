local M = {}

M.setup = function()
  local telescope = require('telescope')

  telescope.setup({})

  require('nyarthan.keymaps').telescope()
end

return M
