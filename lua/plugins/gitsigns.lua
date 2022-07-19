local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = {
      hl = "GitSignsChange",
      text = "▎",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  on_attach = function(buffnum)
    local status_hydra, hydra = pcall(require, "hydra")

    if not status_hydra then
      return
    end

    local hydra_hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _R_: reset whole buffer  _b_: blame line      ^
 _K_: prev hunk   _S_: stage buffer      _k_: preview hunk   _r_: reset hunk          _u_: undo stage hunk ^
 ^
 ^ ^                              _g_: Lazygit              _q_: exit
]]

    -- TODO: stage only visualy selected lines
    -- TODO: integrate git linker, both visual and normal modes

    hydra({
      hint = hydra_hint,
      config = {
        color = 'pink',
        invoke_on_body = true,
        buffer = buffnum,
        hint = {
          position = 'bottom',
          border = 'rounded'
        },
      },
      mode = { 'n', 'v' },
      body = '<leader>g',
      heads = {
        { 'J', gitsigns.next_hunk, { silent = true, nowait = true, desc = "Just to next hunk" } },
        { 'K', gitsigns.prev_hunk, { silent = true, nowait = true, desc = "Just to previous hunk" } },
        { 's', gitsigns.stage_hunk, { silent = true, nowait = true, desc = "Stage hunk" } },
        { 'S', gitsigns.stage_buffer, { silent = true, nowait = true, desc = "Stage whole buffer" } },
        { 'r', gitsigns.reset_hunk, { silent = true, nowait = true, desc = "Reset hunk" } },
        { 'R', gitsigns.reset_buffer, { silent = true, nowait = true, desc = "Reset the whole buffer" } },
        { 'u', gitsigns.undo_stage_hunk },
        { 'k', gitsigns.preview_hunk },
        { 'd', gitsigns.toggle_deleted, { nowait = true } },
        { 'b', gitsigns.blame_line },

        { 'y', function() require("gitlinker").get_buf_range_url("v") end, { silent = true } },

        { 'g', '<cmd>Lazygit<CR>', { exit = true, nowait = true } },
        { 'q', nil, { exit = true, nowait = true } },
      }
    })
  end
})
