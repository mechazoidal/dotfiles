local wk = require("which-key")

vim.diagnostic.config {
  -- underline = false,
  virtual_text = false
  -- signs = true,
  -- severity_sort = true,
}

vim.fn.sign_define("DiagnosticSignError", { text = ">>", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "--", texthl = "DiagnosticSignWarn" })

wk.register({
  name = "Diagnostic",
  f = {vim.diagnostic.open_float, "Open float"},
  l = {vim.diagnostic.setloclist, "Copy to loclist"},
  q = {vim.diagnostic.qflist, "Copy to quickfix"},
}, { prefix = "<leader>s"})

wk.register({
  ['[d'] = {vim.diagnostic.goto_prev, "Goto previous"},
  [']d'] = {vim.diagnostic.goto_next, "Goto next"},
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local keymap = {name = "LSP"}
    if client.server_capabilities.hoverProvider then
      keymap.K = {vim.lsp.buf.hover, "hover", buffer = args.buf}
    end
    -- declaration: if tagfunc, use `C-W ]`
    -- if client.server_capabilities.declarationProvider then
    --   keymap['gD'] = {vim.lsp.buf.declaration, "declaration"}
    -- end
    -- definition: if tagfunc, use `C-W }`
    -- if client.server_capabilities.definitionProvider then
    --   keymap['gd'] = {vim.lsp.buf.definition, "definition"}
    -- end
    if client.server_capabilities.implementationProvider then
      keymap['gi'] = {vim.lsp.buf.implementation, "implementation"}
    end
    -- FIXME conflicts with window moving binding
    -- if client.server_capabilities.signatureHelpProvider then
    --   keymap['<C-k>'] = {vim.lsp.buf.signature_help, "signature help"}
    -- end
    if client.server_capabilities.referencesProvider then
      keymap['gr'] = {vim.lsp.buf.references, "references"}
    end
    if client.server_capabilities.typeDefinitionProvider then
      keymap['<leader>D'] = {vim.lsp.buf.type_definition, "type definition"}
    end
    if client.server_capabilities.renameProvider then
      keymap['<leader>rn'] = {vim.lsp.buf.rename, "rename"}
    end
    -- TODO integrate into workspaces.nvim?
    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    wk.register(keymap)
  end,
})
