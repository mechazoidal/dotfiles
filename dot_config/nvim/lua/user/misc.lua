-- Misc plugin settings not worth a file for
local M = {}

-- tpope/vim-fugitive
M.fugitive = function()
  local msg = ''
  if vim.g.loaded_fugitive then
      msg = vim.fn.FugitiveStatusline()
  end
  return msg
end

function Status_Line()
  -- TODO copied from fugitive.txt, could probably use direct function calls
  -- https://old.reddit.com/r/neovim/comments/xtynan/show_me_your_statusline_big_plus_if_you_wrote_it/
  local left = [[%<%f %h%m%r]]
  local right = [[%=%-14.(%l,%c%V%) %P]]
  return left .. M.fugitive() .. right
end
vim.o.statusline = "%{%v:lua.Status_Line()%}"

local wk = require("which-key")
wk.register({
    G = {[[:Git ]], "Fugitive cmd"},
}, { prefix = "<leader>"})

