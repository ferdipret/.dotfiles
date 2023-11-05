return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		whitespace = { highlight = { "Whitespace", "NonText" } },
		indent = {
			char = "▎",
			tab_char = "▎",
			priority = 2,
		},
	},
}
