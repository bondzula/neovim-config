local ok, bufferline = pcall(require, 'bufferline')

if not ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'insert_after_current',
  }
}

-- Buffer manipulation
vim.keymap.set('n', ']b', function() bufferline.cycle(1) end)
vim.keymap.set('n', '[b', function() bufferline.cycle(-1) end)
vim.keymap.set('n', ']B', function() bufferline.move(1) end)
vim.keymap.set('n', '[B', function() bufferline.move(-1) end)
