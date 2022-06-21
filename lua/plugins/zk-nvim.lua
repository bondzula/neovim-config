local status_ok, zk = pcall(require, "zk")

if not status_ok then
  return
end

zk.setup({
  -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope" or "fzf"
  picker = "telescope",

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      -- on_attach = ...
      -- etc, see `:h vim.lsp.start_client()`
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})

local which_key_status_ok, which_key = pcall(require, "which-key")

if not which_key_status_ok then
	return
end

which_key.register({
	z = {
    name = "Zattlekasten",

    -- Search and open notes
    o = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Open Note" },
    t = { "<cmd>ZkTags<cr>", "Note Tags" },

    -- New Note
    n = { "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", "New Note" },

    -- Daily note
    d = { "<cmd>ZkNew { group = 'daily', dir = 'daily' }<cr>", "Open Daily Note"}
	},
}, { prefix = "<leader>" })
