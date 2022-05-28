-- It is required to first run lsp_installer.setup before configuring any servers
local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lsp_installer_ok then
	return
end

lsp_installer.setup({
    ensure_installed = { "html", "cssls", "tailwindcsc", "stylelint_lsp",
    "gopls", "jsonls", "rust_analyzer", "tflint", "terraformls", "ansiblels",
    "dockerls", "bashls", "emmet_ls", "intelephense", "ltex-ls", "sumneko_lua",
    "tsserver", "volar", "zk" },
})


-- Now we can configure other servers
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_ok then
	return
end


require('user.lsp.ltex')
-- lspconfig.sumneko_lua.setup { on_attach = on_attach }
-- lspconfig.tsserver.setup { on_attach = on_attach }

require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
