return {
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local present, cmp = pcall(require, 'cmp')

			if not present then return end

			vim.o.completeopt = 'menu,menuone,noselect'

			local cmp_window = require('cmp.utils.window')

			cmp_window.info_ = cmp_window.info
			cmp_window.info = function(self)
				local info = self:info_()
				info.scrollable = false
				return info
			end

			local icons = {
				Text = '  ',
				Method = '  ',
				Function = '  ',
				Constructor = '  ',
				Field = '  ',
				Variable = '  ',
				Class = '  ',
				Interface = '  ',
				Module = '  ',
				Property = '  ',
				Unit = '  ',
				Value = '  ',
				Enum = '  ',
				Keyword = '  ',
				Snippet = '  ',
				Color = '  ',
				File = '  ',
				Reference = '  ',
				Folder = '  ',
				EnumMember = '  ',
				Constant = '  ',
				Struct = '  ',
				Event = '  ',
				Operator = '  ',
				TypeParameter = '  ',
			}

			local options = {
				window = {
					completion = {},
					documentation = { border = 'single' },
				},
				snippet = {
					expand = function(args) require('luasnip').lsp_expand(args.body) end,
				},
				formatting = {
					format = function(_, vim_item)
						vim_item.kind =
							string.format('%s %s', icons[vim_item.kind], vim_item.kind)
						return vim_item
					end,
				},
				mapping = {
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					['<Tab>'] = cmp.mapping(function(fallback)
-- 						local copilot_keys = vim.fn['copilot#Accept']()
						if cmp.visible() then
							cmp.select_next_item()
						elseif require('luasnip').expand_or_jumpable() then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<Plug>luasnip-expand-or-jump',
									true,
									true,
									true
								),
								''
							)
-- 						elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
-- 							vim.api.nvim_feedkeys(copilot_keys, 'i', true)
						else
							fallback()
						end
					end, {
						'i',
						's',
					}),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require('luasnip').jumpable(-1) then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes(
									'<Plug>luasnip-jump-prev',
									true,
									true,
									true
								),
								''
							)
						else
							fallback()
						end
					end, {
						'i',
						's',
					}),
				},
				sources = {
					{ name = 'luasnip' },
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'nvim_lua' },
					{ name = 'path' },
				},
			}

			cmp.setup(options)
		end
	}
}