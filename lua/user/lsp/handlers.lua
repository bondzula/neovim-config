local M = {}

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = bufnr })
  -- TODO: maybe K
	vim.keymap.set("n", "<c-k>", vim.lsp.buf.hover, { buffer = bufnr })

	-- TODO: I would rather have it <c-.> not sure why it doesn't work
	vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { buffer = bufnr })

	-- Telescope specific
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = bufnr })
  -- TODO: vim.diagnostic.setlocalist()
	vim.keymap.set("n", "gh", vim.diagnostic.open_float, { buffer = bufnr })
	vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { buffer = bufnr })
	vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { buffer = bufnr })
end

M.on_attach = function(client, bufnr)
  require("nvim-navic").attach(client, bufnr)

	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end

	if client.name == "volar" then
		client.server_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end

	if client.name == "stylelint_lsp" then
		client.server_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- pretty fold with UFO plugin
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
