local TelescopePrompt = {
	TelescopeSelection = {
		bg = '#45475A',
	},
	TelescopeBorder = {
		bg = '#313244',
	},
	TelescopeNormal = {
		bg = '#1E1E2E',
	},
	TelescopePromptNormal = {
		bg = '#313244',
	},
	TelescopePromptBorder = {
		bg = '#313244',
	},
	TelescopePromptTitle = {
		fg = '#ffffff',
	},
	TelescopePreviewTitle = {
		fg = '#ffffff',
	},
	TelescopeResultsTitle = {
		fg = '#ffffff',
	},
}

for hl, col in pairs(TelescopePrompt) do
	vim.api.nvim_set_hl(0, hl, col)
end

return {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader><space>", '<cmd>Telescope find_files<CR>', desc = 'Find file' },
		{ "<leader>ff", '<cmd>Telescope find_files hidden=true<CR>', desc= 'Find file' },
	},
	config = function ()
		require('telescope').setup({
			defaults = {
				vimgrep_arguments = {
					'rg',
					'-L',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
				},
				prompt_prefix = '   ',
				selection_caret = '  ',
				entry_prefix = '  ',
				initial_mode = 'insert',
				selection_strategy = 'reset',
				sorting_strategy = 'ascending',
				layout_strategy = 'horizontal',
				layout_config = {
					horizontal = {
						prompt_position = 'top',
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require('telescope.sorters').get_fuzzy_file,
				generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
				path_display = { 'truncate' },
				winblend = 0,
				border = {},
				borderchars = {
					prompt = { '', '', '', '', '', '', '', '' },
					results = { '', '', '', '', '', '', '', '' },
					preview = { '', '', '', '', '', '', '', '' },
				},
				color_devicons = true,
				set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
				file_previewer = require('telescope.previewers').vim_buffer_cat.new,
				grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
				qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
				mappings = {
					n = { ['q'] = require('telescope.actions').close },
				},
			},
			extensions_list = { 'themes', 'terms' },
		})
	end
}