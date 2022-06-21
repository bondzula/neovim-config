local status, telegraph = pcall(require, "telegraph")

if not status then
  return
end

local map = vim.keymap.set

map("n", "<leader>tl", function() telegraph.telegraph({ how = "tmux_popup", cmd = "-w 80% -h 80%  lf {filepath}"}) end)
