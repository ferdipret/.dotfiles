-- return {
-- 	'folke/tokyonight.nvim',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function() vim.cmd.colorscheme('tokyonight-night') end,
-- }

return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	priority = 1000,
	config = function() vim.cmd.colorscheme('catppuccin-mocha') end,
}
