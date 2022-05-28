local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_ok then
	return
end

lspconfig.sumneko_lua.setup({
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require", "ipairs", "pcall" },
			},
			-- workspace = {
			-- 	library = {
			-- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 		[vim.fn.stdpath("config") .. "/lua"] = true,
			-- 	},
			-- },
		},
	},
})
