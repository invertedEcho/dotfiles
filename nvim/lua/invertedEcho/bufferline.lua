local bufferline = require('bufferline')
bufferline.setup({
  options = {
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    },
    diagnostics = 'nvim_lsp',
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

SetKey('n', '<tab>', '<cmd>BufferLineCycleNext<cr>')
SetKey('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>')
SetKey('n', '<leader>p', '<cmd>BufferLineTogglePin<cr>')
SetKey('n', '<leader>bp', '<cmd>BufferLinePick<cr>')
