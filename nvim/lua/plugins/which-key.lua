return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local status_ok, which_key = pcall(require, "which-key")
		if not status_ok then
			print("Which-key config not loaded")
			return
		end

		which_key.setup({
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			key_labels = {
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
				["<localleader>"] = "m",
			},
		})

		which_key.register({
			["<leader>"] = {

				b = {
					name = "+buffer",
					p = { "<cmd>bprev<CR>", "Buffer previous" },
					n = { "<cmd>bnext<CR>", "Buffer next" },
				},

				c = {
					name = "+code",
					a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
					f = { "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format" },
					r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
				},

				d = {
					name = "+diagnostic",
					n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostic next" },
					p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostic previous" },
					o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
				},

				o = {
					name = "+open",
				},

				p = {
					name = "+project",
				},

				["<localleader>"] = {
					name = "<localleader>",
					f = { "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format file" },
				},
			},
			g = {
				d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Lookup definition" },
				r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Lookup references" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Lookup declaration" },
				i = {
					"<cmd>lua vim.lsp.buf.implementation()<CR>",
					"Lookup implementation",
				},
			},
			K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Lookup Documentation" },
			["<C-k>"] = {
				"<cmd>lua vim.lsp.buf.signature_help()<CR>",
				"Signature help",
			},
		})
	end,
}
