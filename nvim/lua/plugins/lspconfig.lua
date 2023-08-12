return {
	-- LSP Config
	{
		'neovim/nvim-lspconfig',
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
						package_uninstalled = "✗"
					}
				}
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local has_mason, mlsp = pcall(require, 'mason-lspconfig')

			if has_mason then
				mlsp.setup({
					ensure_installed = { "lua_ls" },
				})

				mlsp.setup_handlers {
					function (server_name)
						require("lspconfig")[server_name].setup {}
					end,
				}
			end
		end
	}
}
