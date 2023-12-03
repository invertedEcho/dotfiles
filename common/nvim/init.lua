vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('invertedEcho.bootstrap')

require('invertedEcho.util')
require('invertedEcho.options')
require('invertedEcho.keymaps').setup()

require('lazy').setup('invertedEcho.plugins', {
  defaults = {
    lazy = true,
  },
})
require('invertedEcho.bufferline')
