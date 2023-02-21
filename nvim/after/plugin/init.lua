require('nvim-tree').setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})

require('project_nvim').setup()
require('telescope').load_extension('projects')
require('gitsigns').setup()
require('nvim-autopairs').setup()
require('nvim-surround').setup()
require('trouble').setup()
require('nvim-ts-autotag').setup()

require('lualine').setup({
	options = {
		section_separators = { left = '', right = '' },
		component_separators = '',
		theme = 'tokyonight',
	},
	sections = {
		lualine_c = {
			{
				'filename',
				path = 1,
			},
		},
		lualine_x = { 'encoding', 'filetype' },
	},
	tabline = {
		lualine_a = {
			{
				'tabs',
				mode = 2,
			},
		},
	},
})
