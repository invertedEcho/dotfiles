-- stay in visual mode after indenting
SetKey('v', '<', '<gv')
SetKey('v', '>', '>gv')

-- move in insert mode
SetKey('i', '<c-h>', '<left>')
SetKey('i', '<c-j>', '<down>')
SetKey('i', '<c-k>', '<up>')
SetKey('i', '<c-l>', '<right>')

-- switch windows
SetKey('n', '<c-h>', '<c-w>h')
SetKey('n', '<c-j>', '<c-w>j')
SetKey('n', '<c-k>', '<c-w>k')
SetKey('n', '<c-l>', '<c-w>l')

-- resize windows
SetKey('n', '<c-->', '<c-w>-')
SetKey('n', '<c-=>', '<c-w>+')

-- delete buffer
SetKey('n', '<leader>x', '<cmd>bd<cr>')
SetKey('n', '<leader>ax', '<cmd>%bd|e#<cr>')

-- dap -> move to dap.lua once moved from plugins.lua into seperate file
SetKey('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
SetKey('n', '<leader>dc', '<cmd>DapContinue<cr>')
SetKey('n', '<leader>di', '<cmd>DapStepInto<cr>')
SetKey('n', '<leader>do', '<cmd>DapStepOut<cr>')
SetKey('n', '<leader>dt', '<cmd>Terminate<cr>')
