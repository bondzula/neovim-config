local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- For esier usage
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- General formatting
		formatting.trim_newlines,
		formatting.trim_whitespace,

		-- Javascript (js, jsx, vue)
		formatting.prettierd,
		diagnostics.eslint_d,

    diagnostics.vale,

		-- PHP
		-- TODO: php_cs_fixer
		-- TODO: phpstan https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#about-97

		-- Stylelint (css, scss, less)
		formatting.stylelint,
		diagnostics.stylelint,

    -- YAML
    diagnostics.yamllint,

    -- Ansible
    diagnostics.ansiblelint,
	},
})
