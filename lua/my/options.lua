-- :help options
local options = {
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

vim.au({'BufNewFile', 'BufRead'}, {
  '*.py,*.c,*.cpp,*',
  function ()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end
})

vim.au({'BufNewFile', 'BufRead'}, {
  '*.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json',
  function ()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always',
  }
})
vim.opt.shortmess:append "c"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
