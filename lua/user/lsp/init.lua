local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local lsp_config_ok, lsp_config = pcall(require, "lspconfig")

if not lsp_installer_ok and not lsp_config_ok then
	return
end

-- Merge two tables lists together
local function extend(tab1, tab2)
  for _, value in ipairs(tab2) do
    table.insert(tab1, value)
  end
  return tab1
end

-- Merge two object tables together
local function object_assign(t1, t2)
	for key, value in pairs(t2) do
	   t1[key] = value
	end

	return t1
end

-- Servers installed using LSP installer
local local_servers = {
  "html", "cssls", "bashls", "dockerls", "emmet_ls", "gopls", "intelephense",
  "jsonls", "zk", "rust_analyzer", "tailwindcss", "terraformls", "tsserver",
  "rnix",
}

-- Servers installed on the system
local global_servers = {
  "sumneko_lua"
}

-- Auto install required servers
lsp_installer.setup({
  ensure_installed = local_servers,
})

local repeatable = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

-- Setup the servers
for _, lsp in pairs(extend(local_servers, global_servers)) do
  -- use the server name, and try to require the file from the lsp directory if
  -- the file is present, add "settings" key from that file to existing table
  local ok, config = pcall(require, "user.lsp.settings." .. lsp)

  if ok then
    lsp_config[lsp].setup(object_assign(repeatable, config[lsp]))
  end

  if not ok then
    lsp_config[lsp].setup(repeatable)
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

require("user.lsp.null-ls")
