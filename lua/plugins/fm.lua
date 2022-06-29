local status, fm = pcall(require, "fm-nvim")

if not status then
  return
end

fm.setup {
  -- (Vim) Command used to open files
  edit_cmd = "edit",

  -- See `Q&A` for more info
  on_close = {},
  on_open = {},

  -- UI Options
  ui = {
    default = "float",

    float = {
      border    = "rounded",
      float_hl  = "Normal",
      border_hl = "FloatBorder",
      blend     = 10, -- (:h winblend)
      height    = 0.8,
      width     = 0.8,
    },

    split = {
      direction = "topleft",
      size = 24
    }
  },
  cmds = {
    lf_cmd      = "lf",
    lazygit_cmd = "lazygit",
  },
  mappings = {
    vert_split = "<C-v>",
    horz_split = "<C-h>",
    tabedit    = "<C-t>",
    edit       = "<C-e>",
    ESC        = "<ESC>"
  },
}

-- Open LF at current file path
local function open_lf()
  fm.Lf(vim.fn.expand('%:p'))
end

vim.keymap.set("n", "<leader>ol", open_lf)
