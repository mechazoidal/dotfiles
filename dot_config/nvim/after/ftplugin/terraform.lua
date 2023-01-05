vim.bo.formatprg = 'terraform fmt -'

local config = {
  name = 'terraform-ls',
  cmd = {'terraform-ls', 'serve'},
  root_dir = vim.fs.dirname(vim.fs.find({'.terraform', '.git'}, { upward = true })[1]),
}

vim.lsp.start(config)
