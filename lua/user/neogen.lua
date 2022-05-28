local status_ok, neogen = pcall(require, "neogen")

if not status_ok then
	return
end

neogen.setup({
	enabled = true, --if you want to disable Neogen
	input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
	-- languages = { -- for more template configurations, see the language's configuration file in configurations/{lang}.lua
	-- 	lua = {
	-- 		template = {
	-- 			annotation_convention = "emmylua", -- for a full list of annotation_conventions, see supported-languages below,
	-- 		},
	-- 	},
	-- },
})
