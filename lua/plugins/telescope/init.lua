local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local telescope_actions = require("telescope.actions.set")

telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		-- path_display = { "smart" }, -- This is the root of all evil

		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<A-d>"] = actions.delete_buffer,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-q>"] = actions.send_to_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-q>"] = actions.send_to_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--hidden" },
			attach_mappings = function(_)
				telescope_actions.select:enhance({
					post = function()
						vim.cmd(":normal! zx")
					end,
				})
				return true
			end,
		},
    current_buffer_fuzzy_find = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0
      },
    },
    lsp_references = {
      layout_strategy = "cursor",
      layout_config = {
        height = 0.3,
        preview_width = 0.5,
      },
    },
    lsp_document_symbols = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0
      },
    },
    lsp_workspace_symbols = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0
      },
    }
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

-- Extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("git_worktree")

require("plugins/telescope/mappings")

