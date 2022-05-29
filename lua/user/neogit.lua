local status_ok, neogit = pcall(require, "neogit")

if not status_ok then
	return
end

neogit.setup({
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = true,
	auto_refresh = true,
	disable_builtin_notifications = false,
	use_magit_keybindings = false,
	commit_popup = {
		kind = "split",
	},
	-- Change the default way of opening neogit
	kind = "tab",
	-- customize displayed signs
	signs = {
		-- { CLOSED, OPENED }
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true,
	},
	-- Setting any section to `false` will make the section not render at all
	sections = {
		untracked = {
			folded = false,
		},
		unstaged = {
			folded = false,
		},
		staged = {
			folded = false,
		},
		stashes = {
			folded = true,
		},
		unpulled = {
			folded = true,
		},
		unmerged = {
			folded = false,
		},
		recent = {
			folded = true,
		},
	},
	-- override/add mappings
	mappings = {
		-- modify status buffer mappings
		status = {
			-- Adds a mapping with "B" as key that does the "BranchPopup" command
			-- ["B"] = "BranchPopup",
			-- Removes the default mapping of "s"
			-- ["s"] = "",
		},
	},
})

local which_key_status_ok, which_key = pcall(require, "which-key")

if not which_key_status_ok then
	return
end

which_key.register({
	["<leader>g"] = {
		g = { neogit.open,                               "Neogit" },
    c = { function() neogit.open({ "commit" }) end,  "Commit" },
    p = { function() neogit.open({ "push" }) end,    "Push" },
	},
})
