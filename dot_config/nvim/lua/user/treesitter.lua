require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "bash", 
    "comment",
    "make",
    "hcl",
    "python",
    "ruby",
    "yaml",
  },
  sync_install = false,

  highlight = {
    enable = true,
  },
  -- incremental_selection = {
  --   enable = true,
  --   TODO keymaps?
  -- },
  -- indent = {
  --   enable = true,
  --   NOTE experimental, bound to '=' operator by default
  -- }
}
