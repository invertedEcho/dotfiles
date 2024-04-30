local telescope = require('telescope')
telescope.setup({
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
})
SetKey('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
SetKey('n', '<leader>tt', '<cmd>Telescope live_grep<cr>')
SetKey('n', '<leader>ty', '<cmd>Telescope resume<cr>')
SetKey('n', '<leader>tc', '<cmd>Telescope colorscheme<cr>')
SetKey(
  'n',
  '<leader>th',
  '<cmd>Telescope find_files hidden=true no_ignore=true<cr>'
)
SetKey('n', '<leader>tb', '<cmd>Telescope buffers<cr>')
