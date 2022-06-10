local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- For esier usage
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- General formatting
		formatting.trim_newlines,
		formatting.trim_whitespace,

		-- Javascript (js, jsx, vue)
		formatting.prettier,

		diagnostics.eslint_d,
    code_actions.eslint_d,

    diagnostics.vale,

		-- PHP
		-- TODO: php_cs_fixer
		-- TODO: phpstan https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#about-97

    -- YAML
    diagnostics.yamllint,

    -- Ansible
    diagnostics.ansiblelint,
	},
  on_attach = require("user.lsp.handlers").on_attach,
})
