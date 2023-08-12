return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
	},
	-- Formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim", "lukas-reineke/lsp-format.nvim" },
		config = function()
			local lsp_format = require("lsp-format")
			local nls = require("null-ls")

			nls.setup({
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.prettierd,
					nls.builtins.diagnostics.eslint,
					nls.builtins.code_actions.eslint,
				},
				on_attach = lsp_format.on_attach,
			})
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local has_mason, mlsp = pcall(require, "mason-lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_attach = function(client, bufnr) end

			if has_mason then
				mlsp.setup({
					ensure_installed = { "lua_ls" },
				})

				mlsp.setup_handlers({
					function(server_name)
						require("lspconfig")[server_name].setup({
							on_attach = lsp_attach,
							capabilities = lsp_capabilities,
						})
					end,
				})
			end
		end,
	},
}
