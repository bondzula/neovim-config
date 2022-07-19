local Hydra = require('hydra')

local hint = [[
                 _f_: files       _m_: marks
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
  🭅█ ▁     █🭐
  ██🬿      🭊██   _h_: vim help    _c_: execute command
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _k_: keymap      _;_: commands history
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _r_: registers   _?_: search history

                 _<Enter>_: Telescope           _<Esc>_ 
]]

local status, telescope = pcall(require, "telescope.builtin")

if not status then
  return
end

Hydra({
   name = 'Telescope',
   hint = hint,
   config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded',
      },
   },
   mode = 'n',
   body = '<leader>t',
   heads = {
      { 'f', telescope.find_files },
      { 'g', telescope.live_grep },
      { 'h', '<cmd>Telescope help_tags<cr>', { desc = 'Vim help' } },
      { 'o', '<cmd>Telescope oldfiles<cr>', { desc = 'Recently opened files' } },
      { 'm', '<cmd>Telescope marks<cr>', { desc = 'Marks' } },
      { 'k', '<cmd>Telescope keymaps<cr>' },
      { 'r', '<cmd>Telescope registers<cr>' },
      { 'p', '<cmd>Telescope projects<cr>', { desc = 'Projects' } },
      { '/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search in file' } },
      { '?', '<cmd>Telescope search_history<cr>',  { desc = 'Search history' } },
      { ';', '<cmd>Telescope command_history<cr>', { desc = 'Command-line history' } },
      { 'c', '<cmd>Telescope commands<cr>', { desc = 'Execute command' } },
      { '<Enter>', '<cmd>Telescope<cr>', { exit = true, desc = 'List all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
   }
})
