-- require('telescope').setup{
--     defaults
--     pickers
--     extensions
-- }
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
      name = "+telescope",
      f = {[[:Telescope find_files<CR>]], "Telescope: Find files"},
      ["`"] = {[[:Telescope buffers<CR>]], "Telescope: Buffers"},
  }
})
