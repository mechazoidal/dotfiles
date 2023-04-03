
local config = {
  name = 'pylsp',
  cmd = {'pylsp'},
  root_dir = vim.fs.dirname(vim.fs.find({'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git'}, { upward = true })[1]),
  -- lsp-config supports 'single_file_support' for these, but base LSP client does not.
}
-- TODO https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
-- vim.lsp.start({config
  -- reuse_client = function(client, conf)
  --   return (client.name == conf.name
  --     and (
  --       client.config.root_dir == conf.root_dir
  --       or (conf.root_dir == nil and vim.startswith(api.nvim_buf_get_name(0), "/usr/lib/python")
  --       or (conf.root_dir == nil and vim.startswith(api.nvim_buf_get_name(0), "/opt/local/usr/lib/python"))
  --     )
  --   )
  -- end
-- })
vim.lsp.start(config)
