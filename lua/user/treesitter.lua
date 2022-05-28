local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},

	indent = { enable = true, disable = { "yaml" } },

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

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- ['w', 's', 'p', 't'] builtin bindings
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["aC"] = "@class.outer",
				["iC"] = "@class.inner",

				["al"] = "@loop.outer",
				["il"] = "@loop.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aP"] = "@parameter.outer",
				["iP"] = "@parameter.inner",
			},
		},

		move = {
			enable = false,
			set_jumps = false, -- whether to set jumps in the jumplist
			-- goto_next_start = {
			-- 	["]f"] = "@function.outer",
			-- 	["]p"] = "@parameter.outer",
			-- 	["]l"] = "@loop.outer",
			-- 	["]c"] = "@conditional.outer",
			-- },
			--
			-- goto_next_end = {
			-- 	["]F"] = "@function.outer",
			-- 	["]P"] = "@parameter.outer",
			-- 	["]L"] = "@loop.outer",
			-- 	["]C"] = "@conditional.outer",
			-- },
			--
			-- goto_previous_start = {
			-- 	["[f"] = "@function.outer",
			-- 	["[p"] = "@parameter.outer",
			-- 	["[l"] = "@loop.outer",
			-- 	["[c"] = "@conditional.outer",
			-- },
			--
			-- goto_previous_end = {
			-- 	["[F"] = "@function.outer",
			-- 	["[P"] = "@parameter.outer",
			-- 	["[L"] = "@loop.outer",
			-- 	["[C"] = "@conditional.outer",
			-- },
		},
	},
})
