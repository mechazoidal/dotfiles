local M = {}

-- adapted from:
-- https://github.com/kevinhwang91/nvim-bqf/issues/35
M.toggle_qf = function()
  local qf_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_open = true
    end
  end
  if qf_open == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
  -- save last cursor position in list
  if vim.b.bqf_enabled then
    vim.api.nvim_feedkeys([['"]], 'im', false)
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
  if not vim.tbl_isempty(vim.fn.getloclist(0)) then
    vim.cmd "lopen"
  end
end

local wk = require("which-key")
wk.setup {
  plugins = {
    presets = {
      -- workaround for inconsistent timeoutlen:
      -- https://github.com/folke/which-key.nvim/issues/152
      operators = false
    }
  },
}

wk.register({
  name = "Window",
    w = {[[<C-w>v<C-w>l]], "Split vertically"},
    v = {[[<C-w>s<C-w>k]], "Split horizontally"},
    q = {M.toggle_qf, "Toggle quickfix"},
    l = {M.toggle_ll, "Toggle location list"},
}, { prefix = "<leader>w"})

-- if you want to set function keys
-- https://github.com/folke/which-key.nvim/issues/321#issuecomment-1237877928
wk.register({
  ["<leader>"] = {
      [","] = {[[:noh<cr>]], "Clear out search results"},
      W = {[[:%s/\s\+$//<cr>:let @/=''<CR>]], "Strip all trailing whitespace"},
  },
  [";"] = {[[:]], "Alias: :"},
  ["Y"] = {[[y$]], "Alias: y$"},
  -- Window-navigation helpers
  ["<C-h>"] = {[[<C-w>h]], "Move to left window"},
  ["<C-j>"] = {[[<C-w>j]], "Move to upper window"},
  ["<C-k>"] = {[[<C-w>k]], "Move to lower window"},
  -- FIXME which-key complains this is overwriting a nohlsearch binding
  ["<C-l>"] = {[[<C-w>l]], "Move to right window"},
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

