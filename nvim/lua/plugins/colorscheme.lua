return {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
	config = function() vim.cmd.colorscheme('tokyonight-night') end,
}

-- return {
-- 	'AlexvZyl/nordic.nvim',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function() require('nordic').load() end,
-- }
