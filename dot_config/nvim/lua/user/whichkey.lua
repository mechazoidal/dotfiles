-- FIXME how to define this where which-key can pick it up?
-- FIXME internet code, there's probably a cleaner version inside
local M = {
  toggle_qf = function()
  local qf_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_open = true
    end
  end
  if qf_open == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end
}

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
      name = "+misc",
      n = {[[:noh<cr>]], "Clear out search results"},
      w = {[[<C-w>v<C-w>l]], "Split window vertically"},
      v = {[[<C-w>s<C-w>k]], "Split window horizontally"},
      W = {[[:%s/\s\+$//<cr>:let @/=''<CR>]], "strip all trailing whitespace in the current file"},
      q = {M.toggle_qf, "Toggle the Quickfix window"}
  },
  -- Window-splitting helpers
  ["<C-h>"] = {[[<C-w>h]], "Move to left window"},
  ["<C-j>"] = {[[<C-w>j]], "Move to upper window"},
  ["<C-k>"] = {[[<C-w>k]], "Move to lower window"},
  ["<C-l>"] = {[[<C-w>l]], "Move to right window"},
  -- FIXME doesn't show in the command line until first char hit
  [";"] = {[[:]], "Make ; do the same thing as :"},
  ["K"] = {[[i<CR><ESC>h]], "Split line at cursor"},
  ["Y"] = {[[y$]], "Make Y apply from cursor to end of line"},
})

wk.register({
  ['jj'] = {[[<ESC>]], "exit insert mode"},
}, {mode = "i"})
