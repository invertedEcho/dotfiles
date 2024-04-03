-- stay in visual mode after indenting
set_key('v', '<', '<gv')
set_key('v', '>', '>gv')

-- move in insert mode
set_key('i', '<c-h>', '<left>')
set_key('i', '<c-j>', '<down>')
set_key('i', '<c-k>', '<up>')
set_key('i', '<c-l>', '<right>')

-- switch windows
set_key('n', '<c-h>', '<c-w>h')
set_key('n', '<c-j>', '<c-w>j')
set_key('n', '<c-k>', '<c-w>k')
set_key('n', '<c-l>', '<c-w>l')

set_key('n', '<leader>x', '<cmd>bd<cr>')
