require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "bash", 
    "comment",
    "dockerfile",
    "dot",
    "go",
    "gomod",
    "hcl",
    "javascript",
    "json",
    "jsonnet",
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
  auto_install = false,

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
