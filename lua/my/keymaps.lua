local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
	return
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " m"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<esc>", ":nohl<CR>", opts)

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)
keymap('n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
