-- Core nvim settings
vim.o.undofile = true
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
-- TODO look into shada , shadafile

-- indent wrapped lines, by indenting them another level 
-- and showing 'showbreak' char
vim.o.breakindent = true
vim.o.breakindentopt = "shift:4,sbr" 
-- vim.o.listchars = [[tab:▸\ ,eol:¬]]
-- vim.o.showbreak = [[↪]]
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
-- TODO evaluate
-- vim.o.infercase = true
vim.o.modelines = 0
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- default: jtcroql
-- neovim default: tcqj
-- FIXME should just _add_ these, not override
-- see https://neovim.io/doc/user/lua.html#vim.opt
-- Allow 'gq', automatically insert comment leader in Insert, recognize list numbers
-- vim.o.formatoptions="qrn1"
-- TODO using :append or :prepend with a list results in '12qcjt' instead of the expected 'tqcn1j'. Why?
-- vim.opt.formatoptions:append {'1', 'n'}
-- vim.opt.formatoptions:prepend {'1', 'n'}
vim.opt.formatoptions:append '1'
vim.opt.formatoptions:append 'n'

vim.o.synmaxcol = 500
vim.o.tildeop = true
vim.o.showmode = true
vim.o.hidden = true
vim.o.visualbell = true
vim.o.list = true
vim.opt.spelllang:prepend("en_us")

vim.opt.wildmode:prepend('longest:full')
vim.opt.wildignore:prepend('*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class')

-- :help provider-clipboard 
-- vim.o.clipboard = 'unnamedplus'
-- FIXME needs to be config'd special on windows
-- vim.o.clipboard = 'unnamed,unnamedplus'

-- Space as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- TODO
-- " change all fancy characters to their ascii equivs(", ', etc.)
-- " from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L615
-- function! RemoveFancyCharacters()

local vimrc_group = vim.api.nvim_create_augroup('vimrc', { clear = true })

-- Save all on focus lost
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = {"*"},
  group = vimrc_group,
  command = "wall"
})
