-- It is required to first run lsp_installer.setup before configuring any servers
local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lsp_installer_ok then
	return
end

lsp_installer.setup({
    ensure_installed = { "html", "cssls", "tailwindcss", "stylelint_lsp",
    "gopls", "jsonls", "rust_analyzer", "tflint", "terraformls", "ansiblels",
    "dockerls", "bashls", "emmet_ls", "intelephense", "ltex", "sumneko_lua",
    "tsserver", "volar", "zk" },
})

-- Global LSP configuration
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
})

-- Now we can configure other servers
require('user.lsp.ltex')
require('user.lsp.sumneko_lua')
require('user.lsp.jsonls')
require("user.lsp.null-ls")
