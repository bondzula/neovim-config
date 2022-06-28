local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local hl = vim.api.nvim_set_hl
local icons = require "config.icons"
local space = " "

-- hl(0, "NavicFile",          { default = true, link = "CmpItemKindFile" })
-- hl(0, "NavicModule",        { default = true, link = "CmpItemKindModule" })
-- -- hl(0, "NavicNamespace",     { default = true, link = "" })
-- -- hl(0, "NavicPackage",       { default = true, link = "" })
-- hl(0, "NavicClass",         { default = true, link = "CmpItemKindClass" })
-- hl(0, "NavicMethod",        { default = true, link = "CmpItemKindMethod" })
-- -- hl(0, "NavicProperty",      { default = true, link = "" })
-- hl(0, "NavicField",         { default = true, link = "CmpItemKindField" })
-- hl(0, "NavicConstructor",   { default = true, link = "CmpItemKindConstructor" })
-- hl(0, "NavicEnum",          { default = true, link = "CmpItemKindEnum" })
-- hl(0, "NavicInterface",     { default = true, link = "CmpItemKindInterface" })
-- hl(0, "NavicFunction",      { default = true, link = "CmpItemKindFunction" })
-- hl(0, "NavicVariable",      { default = true, link = "CmpItemKindVariable" })
-- hl(0, "NavicConstant",      { default = true, link = "CmpItemKindConstant" })
-- hl(0, "NavicString",        { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicNumber",        { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicBoolean",       { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicArray",         { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicObject",        { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicKey",           { default = true, link = "CmpItemKindKey" })
-- hl(0, "NavicNull",          { default = true, link = "CmpItemKindValue" })
-- hl(0, "NavicEnumMember",    { default = true, link = "CmpItemKindEnumMember" })
-- hl(0, "NavicStruct",        { default = true, link = "CmpItemKindStruct" })
-- hl(0, "NavicEvent",         { default = true, link = "CmpItemKindEvent" })
-- hl(0, "NavicOperator",      { default = true, link = "CmpItemKindOperator" })
-- hl(0, "NavicTypeParameter", { default = true, link = "CmpItemKindTypeParameter" })
-- hl(0, "NavicText",          { default = true, link = "LineNr" })
hl(0, "NavicText",          { default = true, link = "Conceal" })
hl(0, "NavicSeparator",     { default = true, link = "LineNr" })

-- Customized config
navic.setup {
  icons = {
    File          = "%#CmpItemKindFile#" .. icons.kind.File .. "%*" .. space,
    Module        = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
    Namespace     = "%#CmpItemKindField#" .. icons.kind.Namespace .. "%*" .. space,
    Package       = "%#CmpItemKindField#" .. icons.kind.Package .. "%*" .. space,
    Class         = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space,
    Method        = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space,
    Property      = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
    Field         = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
    Constructor   = "%#CmpItemKindConstructor#" .. icons.kind.Constructor .. "%*" .. space,
    Enum          = "%#CmpItemKindEnum#" .. icons.kind.Enum .. "%*" .. space,
    Interface     = "%#CmpItemKindInterface#" .. icons.kind.Interface .. "%*" .. space,
    Function      = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space,
    Variable      = "%#CmpItemKindVariable#" .. icons.kind.Variable .. "%*" .. space,
    Constant      = "%#CmpItemKindConstant#" .. icons.kind.Constant .. "%*" .. space,
    String        = "%#CmpItemKindValue#" .. icons.kind.String .. "%*" .. space,
    Number        = "%#CmpItemKindValue#" .. icons.kind.Number .. "%*" .. space,
    Boolean       = "%#CmpItemKindValue#" .. icons.kind.Boolean .. "%*" .. space,
    Array         = "%#CmpItemKindValue#" .. icons.kind.Array .. "%*" .. space,
    Object        = "%#CmpItemKindValue#" .. icons.kind.Object .. "%*" .. space,
    Key           = "%#CmpItemKindKey#" .. icons.kind.Key .. "%*" .. space,
    Null          = "%#CmpItemKindValue#" .. icons.kind.Null .. "%*" .. space,
    EnumMember    = "%#CmpItemKindEnumMember#" .. icons.kind.EnumMember .. "%*" .. space,
    Struct        = "%#CmpItemKindStruct#" .. icons.kind.Struct .. "%*" .. space,
    Event         = "%#CmpItemKindEvent#" .. icons.kind.Event .. "%*" .. space,
    Operator      = "%#CmpItemKindOperator#" .. icons.kind.Operator .. "%*" .. space,
    TypeParameter = "%#CmpItemKindTypeParameter#" .. icons.kind.TypeParameter .. "%*" .. space,
  },

  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
