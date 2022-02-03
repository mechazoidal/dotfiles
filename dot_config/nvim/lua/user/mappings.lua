-- mapx version
local m = require('mapx').setup {
  global = true,
  whichkey = true,
  -- enableCountArg = false,
  -- debug = vim.g.mapxDebug or false,
}

-- ?
local silent = m.silent
local expr = m.expr


nnoremap([[<leader>n]], [[:noh<cr>]], "Clear out search results")
nnoremap([[;]], [[:]], "Make ; do the same thing as :")
inoremap([[jj]], [[<ESC>]], "exit insert mode")
nnoremap([[K]], [[i<CR><ESC>h]], "Split line at cursor")

-- " Window-splitting helpers
nnoremap([[<leader>w]], [[<C-w>v<C-w>l]], "Split window vertically")
nnoremap([[<leader>v]], [[<C-w>s<C-w>k]], "Split window horizontally")
nnoremap([[<C-h>]], [[<C-w>h]], "Move to left window")
nnoremap([[<C-j>]], [[<C-w>j]], "Move to upper window")
nnoremap([[<C-k>]], [[<C-w>k]], "Move to lower window")
nnoremap([[<C-l>]], [[<C-w>l]], "Move to right window")

nnoremap([[Y]], [[y$]], "Make Y apply from cursor to end of line")

nnoremap([[<leader>W]], [[:%s/\s\+$//<cr>:let @/=''<CR>]], "strip all trailing whitespace in the current file")

m.group("silent", {}, function()
  nnoremap([[<leader>e]], [[<cmd>lua vim.diagnostic.open_float()<CR>]])
end)
