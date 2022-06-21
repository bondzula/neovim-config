local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
	return
end

local types = require("luasnip.util.types")

ls.config.set_config({
	-- Keep the last snippet, so we can jump back in it if need be.
	history = true,

	-- Update text in dynamic sniptes as you type.
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets
	enable_autosnippets = true,

	-- Highlights
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

-- Snippets
-- This is a snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- This is a format node.
-- Takes a format string, and list of nodes
-- fmt(<fmt_string>, { ...nodes })
local fmt = require("luasnip.extras.fmt").fmt

-- This is an insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node
-- rep(<position>)
local rep = require("luasnip.extras").rep

-- Choice node
local c = ls.choice_node
local t = ls.text_node
local r = ls.restore_node
local sn = ls.snippet_node

-- javascript snippets

-- TODO [js] Call methods on either selected item, or if there is a dot
-- TODO [js, php] different snippet for methods and functions
-- TODO [js, php] If conditional, it would be perfect if we can have dynamic if, elseif, else, where we can add new elseif on the fly withoud saying up front how many there are
-- TODO [js, php] try, catch, similiar
-- TODO [js, php] Loops, for, for in, for each, while, do while
-- TODO [js, php] Console logs
-- TODO return ${}
-- TODO switch to async function

ls.add_snippets("all", {
  ls.parser.parse_snippet("name", "Stefan Bondzulic"),

  -- TODO: Make this snippet multichoise, so i can switch between my emails
  ls.parser.parse_snippet("email", "stefanbondzulic@gmail.com"),
})

ls.add_snippets("javascript", {
  s(
    "imp",
    fmt(
      "import {} from '{}'",
      { c(1, { i(1), sn(nil, { t("{ "), i(1), t(" }") }), sn(nil, { i(1), t(" as "), i(2) }) }), i(2) }
    )
  ),

  -- const
  s("c", fmt("const {} = {}", { i(1, "name"), i(2, "value") })),

  -- const destructuring
  s("cd", {
    t("const "),
    c(1, { sn(nil, { t("[ "), i(1), t(" ]") }), sn(nil, { t("{ "), i(1), t(" }") }) }),
    t(" = "),
  i(2),
  }),

  -- arrow function
  s(
    "fn",
    fmt(
      "({}) => {}",
      {
        i(1),
        c(
          2,
          {
            i(1),
            sn(nil, { t("{ "), t({ "", "\t" }), i(1), t({ "", "}" }) }),
            sn(nil, { t("{ "), t({ "", "\t" }), t("return "), i(1), t({ "", "}" }) }),
            sn(nil, { t("({ "), t({ "", "\t" }), i(1), t({ "", "})" }) }),
          }
        ),
      }
    )
  ),
})

ls.add_snippets("lua", {
  s("req", fmt("local {} = require('{}')", { i(1), rep(1) })),
})

ls.add_snippets("markdown", {
	s("link", fmt("({})[{}]", { i(1), i(2)})),
})

-- Keymaps

-- <c-k>
-- either expand the snippe, or go the the next one, otherwise do nothing
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-j>
-- move to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- <c-l>
-- switch between choice nodes
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- reload the snippets on the fly instead of restarting the editor
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/bondzula/luasnip.lua<cr>")
