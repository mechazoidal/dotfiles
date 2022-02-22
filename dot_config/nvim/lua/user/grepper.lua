-- TODO original vim config
-- FIXME not sure if running into:
-- https://github.com/nanotee/nvim-lua-guide#caveats-3
-- as `g:grepper` does NOT exist when this file is called.
-- let g:grepper.rg.grepprg .= ' --smart-case'
-- let g:grepper.operator.prompt = 1
-- let g:grepper.operator.tool = 'rg'
-- let g:grepper.dir = 'repo,filecwd'

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
      name = "Grepper",
      r = {[[:Grepper -tool rg<cr>]], "rg"},
      -- FIXME this has same problem showing up like other ':' cmds
      -- r = {[[:GrepperRg ]], "rg"},
  },
})

-- TODO cannot define both operator mappings in one block yet:
-- https://github.com/folke/which-key.nvim/issues/56
wk.register {
  ["g"] = {
    s = {"<Plug>(GrepperOperator)", "operator", mode="x"},
  },
}
wk.register {
  ["g"] = {
    name = "+grepper",
    s = {"<Plug>(GrepperOperator)", "operator"},
  },
}

-- TODO examine grepper settings from:
-- https://github.com/kevinhwang91/nvim-bqf#integrate-with-other-plugins
