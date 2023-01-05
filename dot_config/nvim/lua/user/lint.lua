require('lint').linters_by_ft = {
  -- markdown = {'vale',}
  sh = {'shellcheck',},
  -- go = {'golangci-lint',},
  -- rust = {},
  -- ruby = {'ruby'},
  python = {'flake8',},
  yaml = {'yamllint',},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
