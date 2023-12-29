vim.lsp.start({
  name = 'gopls',
  cmd = {'gopls'},
  -- lsp-config supports 'single_file_support' for these, but base LSP client does not.
  root_dir = vim.fs.dirname(vim.fs.find({'go.mod', '.git'}, { upward = true })[1]),
  settings = {
    gopls = {
      -- analyses = {
      --   unusedparams = true,
      -- },
      staticcheck = true,
    },
  },
})
-- hack for now
-- ideally we could use setlocal since this is basically a wrapper(:h :CompilerSet)
vim.cmd('compiler go')
