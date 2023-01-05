vim.lsp.start({
  name = 'gopls',
  cmd = {'gopls'},
  root_dir = vim.fs.dirname(vim.fs.find({'go.mod', '.git'}, { upward = true })[1]),
  -- lsp-config supports 'single_file_support' for these, but base LSP client does not.
})
