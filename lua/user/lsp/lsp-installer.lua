local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.setup({
    ensure_installed = { "html", "cssls", "tailwindcsc", "stylelint_lsp",
    "gopls", "jsonls", "rust_analyzer", "tflint", "terraformls", "ansiblels",
    "dockerls", "bashls", "emmet_ls", "intelephense", "ltex-ls", "sumneko_lua",
    "tsserver", "volar", "zk" },
})
