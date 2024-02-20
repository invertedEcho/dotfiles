local M = {}

M.setup = function()
  require('toggleterm').setup({})

  require('invertedEcho.keymaps').terminal()
end

return M
