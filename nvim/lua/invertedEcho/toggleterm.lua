require('toggleterm').setup({})

set_key('n', '<c-\\>', '<cmd>ToggleTerm<cr>')
set_key('n', '<leader>g', '<cmd>TermExec cmd="lazygit" direction=float<cr>')
set_key('t', '<c-\\>', '<C-\\><C-n>')
