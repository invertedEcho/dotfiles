require('bufferline').setup({
  options = {
    diagnostics = 'vim-lsp',
    indicator = {
      style = 'underline',
    },
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        seperator = true,
      },
    },
  },
})
set_key('n', '<tab>', '<cmd>BufferLineCycleNext<cr>')
set_key('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>')
set_key('n', '<leader>p', '<cmd>BufferLineTogglePin<cr>')
set_key('n', '<leader>bp', '<cmd>BufferLinePick<cr>')
