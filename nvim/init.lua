vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('invertedEcho.bootstrap')

require('invertedEcho.util')
require('invertedEcho.keymaps').setup()

require('lazy').setup('invertedEcho.plugins', {
  defaults = {
    lazy = true,
  },
})

require('invertedEcho.options')
require('invertedEcho.bufferline')

if vim.g.neovide then
  require('invertedEcho.neovide')
end
