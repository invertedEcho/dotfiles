local notify = require('notify')

vim.notify = notify

notify.setup({
  fps = 144,
  stages = 'slide',
})
