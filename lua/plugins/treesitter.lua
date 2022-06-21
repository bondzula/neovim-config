local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "javascript", "lua", "bash", "css", "dockerfile", "go", "hcl", "html", "jsdoc", "json", "markdown", "nix", "php",
    "rust", "scss", "typescript", "vue", "yaml"
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true,
    disable = { "yaml" }
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gss",
      node_incremental = "gsi",
      node_decremental = "gsd",
    },
  },

  autopairs = {
    enable = true,
  },

  autotag = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",

        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",

        ["aP"] = "@parameter.outer",
        ["iP"] = "@parameter.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
      	["]p"] = "@parameter.outer",
      	["]l"] = "@loop.outer",
      	["]i"] = "@conditional.outer",
      },

      goto_next_end = {
        ["]M"] = "@function.outer",
      	["]P"] = "@parameter.outer",
      	["]L"] = "@loop.outer",
      	["]I"] = "@conditional.outer",
      },

      goto_previous_start = {
        ["[m"] = "@function.outer",
      	["[p"] = "@parameter.outer",
      	["[l"] = "@loop.outer",
      	["[i"] = "@conditional.outer",
      },

      goto_previous_end = {
        ["[M"] = "@function.outer",
      	["[P"] = "@parameter.outer",
      	["[L"] = "@loop.outer",
      	["[I"] = "@conditional.outer",
      },
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
})
