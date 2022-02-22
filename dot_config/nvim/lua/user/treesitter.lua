require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "bash", 
    "comment",
    "go",
    "gomod",
    "hcl",
    "javascript",
    "json",
    "lua",
    "make",
    "python",
    "regex",
    "ruby",
    "typescript",
    "vim",
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
