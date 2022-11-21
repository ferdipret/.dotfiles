local options = require("options")

-- :help options
local settings = {
  fileencoding = "utf-8",
  backup = false,
  writebackup = false,
  undofile = true,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  updatetime = 300,
  expandtab = true,
  cursorline = true,
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  list = true,
}

vim.cmd([[
  au BufNewFile,BufRead *.py,*.c,*.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

  au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
]])

if options.colorscheme then
	vim.cmd("colorscheme " .. options.colorscheme)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({
  virtual_text = false,
})
vim.opt.shortmess:append "c"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
