local telescopeConfig = {}

telescopeConfig.setup = function()
  local telescope = require('telescope')
  telescope.setup({
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
  })
  set_key('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
  set_key('n', '<leader>tt', '<cmd>Telescope live_grep<cr>')
  set_key('n', '<leader>ty', '<cmd>Telescope resume<cr>')
  set_key('n', '<leader>tc', '<cmd>Telescope colorscheme<cr>')
end

return telescopeConfig
