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

-- TODO map worktree keybind using hydra
