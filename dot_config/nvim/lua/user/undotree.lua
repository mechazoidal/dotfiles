local wk = require("which-key")
wk.register({
  ["<leader>"] = {
      name = "+undotree",
      U = {[[:UndotreeToggle<CR>]], "Undotree: Toggle"},
  }
})
