local status_ok, surround = pcall(require, "surround")

if not status_ok then
	return
end

surround.setup({
	mappings_style = "sandwich",
	map_insert_mode = false,
})

-- sa{motion}{char} and this can be any motion
-- sr{char}{char} change surrounding character
-- sd{char} remove surrounding character
-- ss repeat last surround action
