-- local M = {}

-- vim.cmd("imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'")
vim.keymap.set('i', '<C-j>', function()
  if vim.fn["vsnip#expandable"]() == 1 then return '<Plug>(vsnip-expand)' end
end, { expr=true })
-- vim.cmd("smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'")
vim.keymap.set('s', '<C-j>', function()
  if vim.fn["vsnip#expandable"]() == 1 then return '<Plug>(vsnip-expand)' end
end, { expr=true })
vim.keymap.set('i', '<C-l>', function()
  if vim.fn["vsnip#available"](1) == 1 then return '<Plug>(vsnip-expand-or-jump)' end
end, { expr=true })
vim.keymap.set('s', '<C-l>', function()
  if vim.fn["vsnip#available"](1) == 1 then return '<Plug>(vsnip-expand-or-jump)' end
end, { expr=true })

-- " Jump forward or backward
-- vim.cmd("imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
-- vim.cmd("smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
-- vim.cmd("imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")
-- vim.cmd("smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")
vim.keymap.set('i', '<Tab>', function()
  if vim.fn["vsnip#jumpable"](1) == 1 then return '<Plug>(vsnip-jump-next)' end
end, { expr=true })
vim.keymap.set('s', '<Tab>', function()
  if vim.fn["vsnip#jumpable"](1) == 1 then return '<Plug>(vsnip-jump-next)' end
end, { expr=true })
vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then return '<Plug>(vsnip-jump-prev)' end
end, { expr=true })
vim.keymap.set('s', '<S-Tab>', function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then return '<Plug>(vsnip-jump-prev)' end
end, { expr=true })

-- " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- " See https://github.com/hrsh7th/vim-vsnip/pull/50
-- vim.cmd("nmap        s   <Plug>(vsnip-select-text)")
-- vim.cmd("xmap        s   <Plug>(vsnip-select-text)")
-- vim.cmd("nmap        S   <Plug>(vsnip-cut-text)")
-- vim.cmd("xmap        S   <Plug>(vsnip-cut-text)")

-- https://github.com/hrsh7th/vim-vsnip/issues/210#issuecomment-905692542
local wk = require("which-key")

-- wk.register({
-- ["C-j"] = {"vsnip#expandable()  ? '<Plug>(vsnip-expand)'" , "vsnip-expand", mode="i", expr=true},
-- })
-- wk.register({
-- ["C-j"] = {"vsnip#expandable()  ? '<Plug>(vsnip-expand)'" , "vsnip-expand", mode="s", expr=true},
-- })
-- wk.register({
-- ["C-<Space>"] = {"vsnip#expandable()  ? '<Plug>(vsnip-expand)'" , "vsnip-expand", mode="i", expr=true},
-- })

-- TODO unsure how useful these are
-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
wk.register({
    s = {"<Plug>(vsnip-select-text)", "vsnip select text"},
    S = {"<Plug>(vsnip-cut-text)", "vsnip cut text"},
})
wk.register({
    s = {"<Plug>(vsnip-select-text)", "vsnip select text", mode="x"},
    S = {"<Plug>(vsnip-cut-text)", "vsnip cut text", mode="x"},
})
