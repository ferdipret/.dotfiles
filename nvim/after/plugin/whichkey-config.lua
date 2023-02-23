local M = {}

function M.setup()
	local status_ok, which_key = pcall(require, 'which-key')
	local builtin_ok, builtin = pcall(require, 'telescope.builtin')

	if not status_ok and builtin_ok then
		print('Which-key config not loaded')
		return
	end

	which_key.setup({
		key_labels = {
			['<space>'] = 'SPC',
			['<cr>'] = 'RET',
			['<tab>'] = 'TAB',
			['<localleader>'] = 'm',
		},
	})

	which_key.register({
		['<C-_>'] = {
			'<Plug>(comment_toggle_linewise_visual)',
			'Search in project',
		},
	}, { mode = 'v' })

	which_key.register({
		['?'] = { builtin.keymaps, 'Get maps' },
		-- This maps to Control + /
		['<C-_>'] = {
			'<Plug>(comment_toggle_linewise_current)',
			'Search in project',
		},
		['<leader>'] = {
			['<leader>'] = { '<cmd>Telescope find_files<CR>', 'Find file' },
			['/'] = { builtin.live_grep, 'Search in project' },
			[','] = { builtin.buffers, 'Switch workspace buffer' },
			['-'] = { '<cmd>Dirbuf<CR>', 'Dirbuf' },

			b = {
				name = '+buffer',
				a = { '<cmd>BufferCloseAllButCurrent<CR>', 'Delete all but current' },
				d = { '<cmd>BufferDelete<CR>', 'Delete' },
				p = { '<cmd>bprev<CR>', 'Buffer previous' },
				n = { '<cmd>bnext<CR>', 'Buffer next' },
			},

			c = {
				name = '+code',
				a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Action' },
				f = { '<cmd>lua vim.lsp.buf.format {async = true}<CR>', 'Format' },
				r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
			},

			d = {
				name = '+diagnostic',
				['?'] = { '<cmd>Trouble<CR>', 'Diagnostic panel' },
				n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Diagnostic next' },
				p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Diagnostic previous' },
				o = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open float' },
			},

			f = {
				name = '+file',
				f = { '<cmd>Telescope find_files hidden=true<CR>', 'Find file' },
			},

			g = {
				name = '+git',
				g = { '<cmd>LazyGit<CR>', 'Git status' },
			},

			h = {
				name = '+help',
				h = { builtin.help_tags, 'Help tags' },
			},

			n = {
				name = '+notes',
				s = { '<cmd>ObsidianSearch<CR>', 'Search' },
				d = { '<cmd>ObsidianToday<CR>', 'Daily' },
			},

			o = {
				name = '+open',
				p = { '<cmd>NvimTreeFindFileToggle<CR>', 'Project sidebar' },
			},

			p = {
				name = '+project',
				p = { '<cmd>Telescope projects<CR>', 'Project switch' },
			},

			['<localleader>'] = {
				name = '<localleader>',
				f = { '<cmd>lua vim.lsp.buf.format {async = true}<CR>', 'Format file' },
			},
		},
		g = {
			d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Lookup definition' },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Lookup references' },
			D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Lookup declaration' },
			i = {
				'<cmd>lua vim.lsp.buf.implementation()<CR>',
				'Lookup implementation',
			},
		},
		K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Lookup Documentation' },
		['<C-k>'] = {
			'<cmd>lua vim.lsp.buf.signature_help()<CR>',
			'Signature help',
		},
	})
end

M.setup()
