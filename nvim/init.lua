vim.defer_fn(function() pcall(require, 'impatient') end, 0)

require('ferdipret.settings')
require('ferdipret.keymaps')
require('ferdipret.plugins')
