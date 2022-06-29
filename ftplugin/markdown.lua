local status_ok, zk_util = pcall(require, "zk.util")

if not status_ok then
  return
end

-- TODO: Add hydra mapings:
-- Note links
-- Note backlings
-- New note from selection
-- Add the key mappings only for Markdown files in a zk notebook.
-- if zk_util.notebook_root(vim.fn.expand("%:p")) ~= nil then
-- end
