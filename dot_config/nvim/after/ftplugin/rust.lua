vim.lsp.start({
  name = 'rust-analyzer',
  cmd = {'rust-analyzer'},
  root_dir = vim.fs.dirname(vim.fs.find({'Cargo.toml', 'rust-project.json'}, { upward = true })[1]),
})

-- TODO find a way to auto-close preview window?
-- TODO I'd like these to be local, but they don't seem to have that option?
-- vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
-- vim.opt_local.shortmess:append("c")
