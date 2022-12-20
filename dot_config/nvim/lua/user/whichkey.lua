local M = {}

M.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  else
    print("qf: no items")
  end
end

M.toggle_ll = function()
  local ll_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["loclist"] == 1 then
      ll_exists = true
    end
  end
  if ll_exists == true then
    vim.cmd "lclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "lopen"
  else
    print("loclist: none")
  end
end

local wk = require("which-key")
-- TODO map F1 to `:h`
wk.register({
  ["<leader>"] = {
      name = "+misc",
      n = {[[:noh<cr>]], "Clear out search results"},
      w = {[[<C-w>v<C-w>l]], "Split window vertically"},
      v = {[[<C-w>s<C-w>k]], "Split window horizontally"},
      W = {[[:%s/\s\+$//<cr>:let @/=''<CR>]], "strip all trailing whitespace in the current file"},
      -- TODO should I just use telescope's loclist / quickfix pickers
      -- q = {M.toggle_qf, "Toggle the Quickfix window"},
      -- l = {M.toggle_ll, "Toggle the location list window"},
  },
  -- Window-splitting helpers
  ["<C-h>"] = {[[<C-w>h]], "Move to left window"},
  ["<C-j>"] = {[[<C-w>j]], "Move to upper window"},
  ["<C-k>"] = {[[<C-w>k]], "Move to lower window"},
  ["<C-l>"] = {[[<C-w>l]], "Move to right window"},
  -- FIXME doesn't show in the command line until first char hit
  [";"] = {[[:]], "Make ; do the same thing as :"},
  ["Y"] = {[[y$]], "Make Y apply from cursor to end of line"},
})

wk.register({
  ['jj'] = {[[<ESC>]], "exit insert mode"},
}, {mode = "i"})

-- TRIAL
-- https://old.reddit.com/r/vim/comments/2mj7w7/vim_and_kinesis_advantage_pro/cm5gqcg/
-- wk.register({
--   ["<CR>"] = {[[<ESC>]], "Map enter to escape in insert mode"},
-- }, {mode = "i"})

  -- wk.register({
  --   ["K"] = {[[i<CR><ESC>h]], "Split line at cursor"},
  -- })
