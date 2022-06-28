local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local lsp_config_ok, lsp_config = pcall(require, "lspconfig")

if not lsp_installer_ok and not lsp_config_ok then
	return
end

-- Servers installed using LSP installer
local local_servers = {
  "html", "cssls", "bashls", "dockerls", "emmet_ls", "gopls", "intelephense",
  "rust_analyzer", "tailwindcss", "terraformls", "tsserver", "rnix",
  "volar"
}

-- Servers installed on the systm
local global_servers = {
  "sumneko_lua", "ltex"
}

-- Auto install required servers
lsp_installer.setup({
  ensure_installed = local_servers,
})

local repeatable = {
  on_attach = require("config.lsp.handlers").on_attach,
  capabilities = require("config.lsp.handlers").capabilities,
}

-- Setup the servers
for _, lsp in pairs(vim.list_extend(local_servers, global_servers)) do
  -- use the server name, and try to require the file from the lsp directory if
  -- the file is present, add "settings" key from that file to existing table
  local ok, config = pcall(require, "config.lsp.settings." .. lsp)

  if not ok then
    lsp_config[lsp].setup(repeatable)
  end

  if ok then
    lsp_config[lsp].setup(vim.tbl_extend("keep", repeatable, config[lsp]))
  end
end

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

require("config.lsp.null-ls")
