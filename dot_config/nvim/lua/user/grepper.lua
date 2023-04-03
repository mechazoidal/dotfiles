local wk = require("which-key")
wk.register({
  -- TODO move under leader-g ?
  ["<leader>"] = {
      rg = {[[:Grepper -tool rg<cr>]], "Grepper: ripgrep"},
  },
})

-- This is the ONLY way I've found to modify the defaults.
-- The table does NOT exist in vim.g at any startupfile hook(including after/plugin)
-- and setting the table through lua overwrites ALL defaults.
-- (possibly due to grepper being a pure Vimscript plugin?)
vim.cmd([[
runtime plugin/grepper.vim
let g:grepper.dir = 'repo,filecwd'
]])

-- cannot define both operator mappings in one block (yet?)
-- https://github.com/folke/which-key.nvim/issues/56
wk.register {
  ["g"] = {
    s = {"<Plug>(GrepperOperator)", "operator", mode="x"},
  },
}
wk.register {
  ["g"] = {
    s = {"<Plug>(GrepperOperator)", "+grepper"},
  },
}

-- bqf integration
-- TODO move these into lua
vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

