local utils = require('utils')
local map = utils.map
local cmd = utils.cmd

vim.g.mapleader = ' '

-- pane key maps
map('n', '<leader>wq', '<C-w>q', 'close the pane')
map('n', '<leader>ws', '<C-w>s', 'split horizontaly')
map('n', '<leader>wv', '<C-w>v', 'split verticaly')
map('n', '<leader>wj', '<C-w>j', 'go pane down')
map('n', '<leader>wk', '<C-w>k', 'go pane up')
map('n', '<leader>wh', '<C-w>h', 'go pane left')
map('n', '<leader>wl', '<C-w>l', 'go pane right')
map('n', '<leader>ww', '<C-w>w', 'go to the next pane')

map('n', '<leader>e', cmd('Ex'), 'open file explorer')

map('n', 'gh', '^', 'go to first char in line')
map('n', 'gl', '$', 'go to last char in line')

