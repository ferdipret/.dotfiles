local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
local builtin_ok, builtin = pcall(require, 'telescope.builtin')
if not builtin_ok then
  return
end

which_key.setup({
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
    ["<localleader>"] = "m"
  },
})

which_key.register({
  ["<"] = { "<cmd>BufferPrevious<CR>", "Buffer previous" },
  [">"] = { "<cmd>BufferNext<CR>", "Buffer next" },
  ["<leader>"] = {
    ["<leader>"] = { builtin.find_files, "Find file" },
    ["/"] = { builtin.live_grep, "Search in project" },
    [","] = { builtin.buffers, "Switch workspace buffer" },
    ["-"] = { "<cmd>Dirbuf<CR>", "Dirbuf" },

    b = {
      name = "+buffer",
      a = { "<cmd>BufferCloseAllButCurrent<CR>", "Delete all but current" },
      d = { "<cmd>BufferDelete<CR>", "Delete" },
    },

    c = {
      name = "+code",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action task" },
      f = { "<cmd>lua vim.lsp.buf.format {async = true}<CR>", "Format file" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename keyword" },
    },

    d = {
      name = "+diagnostic",
      ["?"] = { "<cmd>Trouble<CR>", "Diagnostic panel" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostic next" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostic previous" },
      o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
    },

    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find file" },
    },

    g = {
      name = "+git",
      g = { "<cmd>LazyGit<cr>", "Git status" },
    },

    h = {
      name = "+help",
      h = { builtin.help_tags, "Help tags" },
    },

    o = {
      name = "+open",
      p = { "<cmd>NvimTreeToggle<CR>", "Project sidebar" },
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
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Lookup implementation" },
  },

  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Lookup Documentation" },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
})
