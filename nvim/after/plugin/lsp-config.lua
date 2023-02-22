require('mason').setup({
	ui = {
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		},
	},
})
require('mason-lspconfig').setup()

require('cmp').setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr) end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})
	end,
})

local null_ls_ok, null_ls = pcall(require, 'null-ls')
local lsp_format_ok, lsp_format = pcall(require, 'lsp-format')
if not null_ls_ok and lsp_format_ok then return end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
	},
	on_attach = lsp_format.on_attach,
})

require('lsp-colors').setup()
