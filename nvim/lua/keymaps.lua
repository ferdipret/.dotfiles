local options = require("options")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = options.leader
vim.g.maplocalleader = options.localleader

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<esc>", ":nohl<CR>", opts)

vim.keymap.set("n", "gf",
  function()
    local status_ok, obsidian = pcall(require, "obsidian")

    if not status_ok then
      return "gf"
    end

    if obsidian.util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)
