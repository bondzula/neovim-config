local schemastore_ok, schemastore = pcall(require, "schemastore")

if not schemastore_ok then
	return
end

local M = {}

M.jsonls = {
  filetypes = { "json" },
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}


return M
