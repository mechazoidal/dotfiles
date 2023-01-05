-- require('telescope').setup{
--     defaults
--     pickers
--     extensions
-- }
local wk = require("which-key")
wk.register({
  f = {[[:Telescope find_files<CR>]], "Telescope: Find files"},
  ["`"] = {[[:Telescope buffers<CR>]], "Telescope: Buffers"},
  e = {[[:Telescope oldfiles<CR>]], "Telescope: File history"},
  q = {[[:Telescope quickfix<CR>]], "Telescope: Quickfix"},
  l = {[[:Telescope loclist<CR>]], "Telescope: Locations"},
}, { prefix = "<leader>"})
