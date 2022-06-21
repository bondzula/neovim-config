local status_ok, harpoon = pcall(require, "harpoon")

if not status_ok then
	return
end

harpoon.setup({
	save_on_toggle = false,	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_change = true, -- saves the harpoon file upon every change. disabling is unrecommended.
	enter_on_sendcmd = false,	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	tmux_autoclose_windows = false,	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	excluded_filetypes = { "harpoon" },	-- filetypes that you want to prevent from adding to the harpoon list menu.
})

local which_key_status_ok, which_key = pcall(require, "which-key")

if not which_key_status_ok then
	return
end

which_key.register({
	h = {
    name = "Harpoon",

		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },

		-- Navigation
		q = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "1st Mark" },
		w = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "2nd Mark" },
		e = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "3rd Mark" },
		r = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "4th Mark" },
	},
}, { prefix = "<leader>" })
