require('nvim-treesitter.configs').setup({
  ensure_installed = { 'typescript', 'lua', 'css', 'json' },
  highlight = {
    enable = true,
  },
})
