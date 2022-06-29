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

-- TODO: Add hydra mapings for harpoon
