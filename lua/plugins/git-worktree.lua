local status_ok, worktree = pcall(require, 'git-worktree')

if not status_ok then
  return
end

worktree.setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .", -- <string>
    clearjumps_on_change = true,
    autopush = false,
})


local which_key_status_ok, which_key = pcall(require, "which-key")

if not which_key_status_ok then
	return
end

which_key.register({
	g = {
    name = "Git",

		o = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Manage Git Worktrees" },
		n = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "New Git Worktree" },
	},
}, { prefix = "<leader>" })
