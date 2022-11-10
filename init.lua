vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "my.options"
require "my.keymaps"
require "my.plugins"
require "my.colorscheme"
require "my.whichkey"
require "my.treesitter"
require "my.lsp"
require "my.cmp"
require "my.null-ls"
