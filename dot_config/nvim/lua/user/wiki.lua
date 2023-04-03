local wk = require("which-key")
-- require('telescope').load_extension('vimwiki')
-- Vimwiki-specific settings
-- TODO this might work properly in neovim now
-- vim.cmd('let g:vimwiki_url_maxsave = 0')
-- vim.cmd('let diary_wiki = {}')
-- vim.cmd([[let diary_wiki.path = '~/personalwiki']])
-- vim.cmd('let diary_wiki.auto_tags = 1')
-- vim.cmd('let diary_wiki.auto_diary_index = 1')
-- vim.cmd('let notes_wiki = {}')
-- vim.cmd([[let notes_wiki.path = '~/notewiki']])
-- vim.cmd('let notes_wiki.auto_tags = 1')
-- vim.cmd('let g:vimwiki_list = [diary_wiki, notes_wiki]')
-- vim.cmd('let g:vimwiki_table_mappings = 0')
-- function SetExtraVimwikiMappings()
--   nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
--   vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
-- endfunction()

-- TODO disable default binds and move to which-key
-- let g:vimwiki_key_mappings = {}



-- wk.register({
--   name = "Wiki",
--   l = {[[:Telescope vimwiki link<CR>]], "Telescope: Insert link"},
--   w = {[[<Plug>VimwikiMakeDiaryNote]], "Today's diary entry"},
-- }, { prefix = "<leader>k"})
-- wk.register({
--   name = "Wiki",
--   f = {[[<cmd>lua require('telescope').extensions.vimwiki.vimwiki()<CR>]], "Telescope: Files"},
--   g = {[[<cmd>lua require('telescope').extensions.vw.live_grep()<CR>]], "Telescope: Grep"},
-- }, { prefix = "<leader>k", noremap=true})

-- TODO
-- https://github.com/jakewvincent/mkdnflow.nvim#%EF%B8%8F-configuration
-- require('mkdnflow').setup({})
