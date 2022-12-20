require("workspaces").setup()
-- TODO this option is provided to use :lcd , 
-- but doesn't seem to be working right? 
-- (expecting that each buffer in a workspace should :lcd , visible when I change buffers with 'bnext')
-- see https://github.com/natecraddock/workspaces.nvim/issues/2
-- and also look at how vim-rooter does it
-- ({
--   global_cd = false,
-- })
require('telescope').load_extension("workspaces")
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
      name = "+telescope",
      p = {[[:Telescope workspaces<CR>]], "Telescope: Workspaces"},
  }
})

