local M = {}

M.setup = function()
  require('dressing').setup({
    input = {
      enabled = true
    }
  })
end

return M
