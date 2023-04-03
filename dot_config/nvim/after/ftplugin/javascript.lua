local bin_name = 'typescript-language-server'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

vim.lsp.start({
  name = 'typescript-language-server',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({'package.json', 'tsconfig.json', 'jsconfig.json', '.git'}, { upward = true })[1])
})

