-- vim.diagnostic.setqflist()
-- vim.diagnostic.config({virtual_text = false})
require('lint').linters_by_ft = {
  -- markdown = {'vale',}
  sh = {'shellcheck',},
  -- go = {'golangci-lint',},
  -- rust = {},
  -- ruby = {'ruby'},
  python = {'flake8',},
  yaml = {'yamllint',},
}

require'agrp'.set{
  Linting = {
    ['BufRead,InsertLeave,BufWritePost'] = {
      {'*', require('lint').try_lint},
      {'*', require('lint').try_lint},
      {'*', require('lint').try_lint},
    },
  },
}

