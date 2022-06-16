local status_ok, neogen = pcall(require, "neogen")

if not status_ok then
	return
end

neogen.setup({
	enabled = true,
  snippet_engine = "luasnip"
})

vim.keymap.set("n", "<leader>cd", neogen.generate)
