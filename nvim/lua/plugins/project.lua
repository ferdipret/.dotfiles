return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        opts = {
					manual_mode = true,
					detection_methods = { "lsp", "pattern" },
					patterns = { ".git", "Makefile", "package.json" },
					show_hidden = false,
					silent_chdir = true,
					scope_chdir = 'global',
					datapath = vim.fn.stdpath("data"),
				},
        event = "VeryLazy",
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("telescope").load_extension("projects")
        end,
        keys = {
          { "<leader>pp", "<Cmd>Telescope projects<CR>", desc = "Switch Project" },
        },
      },
    },
  },

  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "echasnovski/mini.starter",
    optional = true,
    opts = function(_, opts)
      local items = {
        {
          name = "Projects",
          action = "Telescope projects",
          section = string.rep(" ", 22) .. "Telescope",
        },
      }
      vim.list_extend(opts.items, items)
    end,
  },
}
