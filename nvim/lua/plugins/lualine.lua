return {
	'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup({
			options = {
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				theme = 'auto',
				disabled_filetypes = {
					statusline = { 'NvimTree' },
					winbar = { 'NvimTree' },
				},
			},
		})
	end
}
