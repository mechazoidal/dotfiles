vim.bo.formatprg = 'terraform fmt -'
vim.bo.commentstring = '#%s'

local config = {
  name = 'terraform-ls',
  cmd = {'terraform-ls', 'serve'},
  -- https://github.com/hashicorp/terraform-ls/blob/main/docs/language-clients.md#language-ids
  -- root_dir = vim.fs.dirname(vim.fs.find({'*.tf'}, { upward = true })[1]),
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
}

-- based on https://github.com/neovim/nvim-lspconfig/issues/161
if not vim.startswith(vim.api.nvim_buf_get_name(0), "fugitive:") then
  vim.lsp.start(config)
end
