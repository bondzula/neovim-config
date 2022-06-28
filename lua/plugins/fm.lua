require('fm-nvim').setup {
  -- (Vim) Command used to open files
  edit_cmd = "edit",

  -- See `Q&A` for more info
  on_close = {},
  on_open = {},

  -- UI Options
  ui = {
    -- Default UI (can be "split" or "float")
    default = "float",

    float = {
      -- Floating window border (see ':h nvim_open_win')
      border    = "rounded",

      -- Highlight group for floating window/border (see ':h winhl')
      float_hl  = "Normal",
      border_hl = "FloatBorder",

      -- Floating Window Transparency (see ':h winblend')
      blend = 10,

      -- Num from 0 - 1 for measurements
      height = 0.7,
      width  = 0.7,

      -- X and Y Axis of Window
      x = 0.5,
      y = 0.5
    },

    split = {
      -- Direction of split
      direction = "topleft",

      -- Size of split
      size = 24
    }
  },

  -- Terminal commands used w/ file manager (have to be in your $PATH)
  cmds = {
    lf_cmd      = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
    fm_cmd      = "fm",
    nnn_cmd     = "nnn",
    fff_cmd     = "fff",
    twf_cmd     = "twf",
    fzf_cmd     = "fzf --reverse --border none --height 100% --preview 'bat -p --color=always {}'",
    fzy_cmd     = "find . | fzy",
    xplr_cmd    = "xplr",
    vifm_cmd    = "vifm",
    skim_cmd    = "sk",
    broot_cmd   = "broot",
    gitui_cmd   = "gitui",
    ranger_cmd  = "ranger",
    joshuto_cmd = "joshuto",
    lazygit_cmd = "lazygit",
    neomutt_cmd = "neomutt"
  },

  -- Mappings used with the plugin
  mappings = {
    vert_split = "<C-v>",
    horz_split = "<C-h>",
    tabedit    = "<C-t>",
    edit       = "<C-e>",
    ESC        = "<ESC>"
  },

  -- Path to broot config
  broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson"
}

vim.keymap.set("n", "<leader>ol", function() require('fm-nvim').Lf(vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<leader>gg", require('fm-nvim').Lazygit)
