require('project_nvim').setup()
require('telescope').load_extension('projects')
require('gitsigns').setup()
require('nvim-autopairs').setup()
require('nvim-surround').setup()
require('trouble').setup()
require('nvim-ts-autotag').setup()
require('toggleterm').setup()

require('Comment').setup({
	pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

require('indent_blankline').setup({
	show_current_context = true,
})

require('lualine').setup({
	options = {
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		theme = 'auto',
		disabled_filetypes = {
			statusline = { 'NvimTree' },
			winbar = { 'NvimTree' },
		},
	},
})
