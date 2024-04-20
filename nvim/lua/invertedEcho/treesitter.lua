require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'css', 'json', 'typescript' },
  highlight = {
    enable = true,
  },
})
