local status_ok, zk_util = pcall(require, "zk.util")

if not status_ok then
	return
end

-- Add the key mappings only for Markdown files in a zk notebook.
if zk_util.notebook_root(vim.fn.expand("%:p")) ~= nil then
	local which_key_ok, which_key = pcall(require, "which-key")

	if not which_key_ok then
		return
	end

	-- Normal binds
	which_key.register({
		z = {
			name = "Zattlekasten",

			b = { "<cmd>ZkBacklinks<cr>", "Note Backlinks" },
			l = { "<cmd>ZkLinks<cr>", "Note Link" },
		},
	}, {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	})

	-- Visual binds
	which_key.register({
		z = {
			name = "Zattlekasten",

			n = { ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<cr>", "New Message Title" },
			c = {
				":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
				"New Message Content",
			},
		},
	}, {
		mode = "v",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	})
end
