-- ember.lua
-- A minimal single-hue Neovim colorscheme.
-- Activate with: :colorscheme ember

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "ember-mono"

-- Palette ---------------------------------------------------------------
local c = {
  bg       = "#170800", -- background
  bg_soft  = "#1f0e03", -- cursorline, float bg
  bg_sel   = "#341705", -- visual selection
  fg       = "#ff9a10", -- primary text
  fg_dim   = "#c27309", -- secondary text
  mute     = "#7a4a08", -- comments, non-text
  faint    = "#4a2c05", -- splits, borders, line nr
  hi       = "#ffb347", -- slightly brighter (keywords)
  bright   = "#ffd280", -- brightest (strings, literals)
  warn     = "#ff5a1a", -- errors / diff accent
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

-- Editor UI -------------------------------------------------------------
hi("Normal",        { fg = c.fg,   bg = c.bg })
hi("NormalFloat",   { fg = c.fg,   bg = c.bg_soft })
hi("FloatBorder",   { fg = c.faint, bg = c.bg_soft })
hi("CursorLine",    { bg = c.bg_soft })
hi("CursorLineNr",  { fg = c.fg,   bold = true })
hi("LineNr",        { fg = c.faint })
hi("SignColumn",    { bg = c.bg })
hi("ColorColumn",   { bg = c.bg_soft })
hi("VertSplit",     { fg = c.faint })
hi("WinSeparator",  { fg = c.faint })
hi("StatusLine",    { fg = c.fg,   bg = c.bg_soft })
hi("StatusLineNC",  { fg = c.mute, bg = c.bg_soft })
hi("TabLine",       { fg = c.mute, bg = c.bg_soft })
hi("TabLineSel",    { fg = c.fg,   bg = c.bg })
hi("TabLineFill",   { bg = c.bg_soft })
hi("Pmenu",         { fg = c.fg,   bg = c.bg_soft })
hi("PmenuSel",      { fg = c.bg,   bg = c.fg })
hi("PmenuSbar",     { bg = c.bg_soft })
hi("PmenuThumb",    { bg = c.faint })
hi("Visual",        { bg = c.bg_sel })
hi("Search",        { fg = c.bg,   bg = c.bright })
hi("IncSearch",     { fg = c.bg,   bg = c.hi })
hi("MatchParen",    { fg = c.bright, bold = true })
hi("NonText",       { fg = c.faint })
hi("Whitespace",    { fg = c.faint })
hi("SpecialKey",    { fg = c.faint })
hi("Folded",        { fg = c.mute, bg = c.bg_soft })
hi("FoldColumn",    { fg = c.faint })
hi("Directory",     { fg = c.hi })
hi("Title",         { fg = c.bright, bold = true })
hi("Question",      { fg = c.fg })
hi("ModeMsg",       { fg = c.fg_dim })
hi("MoreMsg",       { fg = c.fg_dim })
hi("ErrorMsg",      { fg = c.warn })
hi("WarningMsg",    { fg = c.hi })
hi("Cursor",        { fg = c.bg,   bg = c.fg })

-- Syntax (subtle variations on the same hue) ----------------------------
hi("Comment",       { fg = c.mute, italic = true })
hi("Constant",      { fg = c.bright })
hi("String",        { fg = c.bright })
hi("Character",     { fg = c.bright })
hi("Number",        { fg = c.bright })
hi("Boolean",       { fg = c.bright })
hi("Float",         { fg = c.bright })

hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.hi })

hi("Statement",     { fg = c.hi })
hi("Conditional",   { fg = c.hi })
hi("Repeat",        { fg = c.hi })
hi("Label",         { fg = c.hi })
hi("Operator",      { fg = c.fg_dim })
hi("Keyword",       { fg = c.hi, bold = true })
hi("Exception",     { fg = c.hi })

hi("PreProc",       { fg = c.fg_dim })
hi("Include",       { fg = c.fg_dim })
hi("Define",        { fg = c.fg_dim })
hi("Macro",         { fg = c.fg_dim })
hi("PreCondit",     { fg = c.fg_dim })

hi("Type",          { fg = c.hi })
hi("StorageClass",  { fg = c.fg_dim })
hi("Structure",     { fg = c.hi })
hi("Typedef",       { fg = c.hi })

hi("Special",       { fg = c.bright })
hi("SpecialChar",   { fg = c.bright })
hi("Delimiter",     { fg = c.fg_dim })
hi("Tag",           { fg = c.hi })
hi("Underlined",    { fg = c.fg, underline = true })
hi("Todo",          { fg = c.bg, bg = c.bright, bold = true })
hi("Error",         { fg = c.warn })

-- Treesitter ------------------------------------------------------------
hi("@comment",               { link = "Comment" })
hi("@string",                { link = "String" })
hi("@number",                { link = "Number" })
hi("@boolean",               { link = "Boolean" })
hi("@function",              { link = "Function" })
hi("@function.call",         { fg = c.fg })
hi("@function.builtin",      { fg = c.hi })
hi("@method",                { link = "Function" })
hi("@keyword",               { link = "Keyword" })
hi("@keyword.return",        { fg = c.hi, italic = true })
hi("@conditional",           { link = "Conditional" })
hi("@repeat",                { link = "Repeat" })
hi("@operator",              { link = "Operator" })
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.fg_dim, italic = true })
hi("@parameter",             { fg = c.fg, italic = true })
hi("@field",                 { fg = c.fg })
hi("@property",              { fg = c.fg })
hi("@constant",              { link = "Constant" })
hi("@constant.builtin",      { fg = c.bright, italic = true })
hi("@type",                  { link = "Type" })
hi("@type.builtin",          { fg = c.hi, italic = true })
hi("@tag",                   { link = "Tag" })
hi("@punctuation",           { fg = c.fg_dim })
hi("@punctuation.bracket",   { fg = c.fg_dim })
hi("@punctuation.delimiter", { fg = c.fg_dim })

-- Diagnostics -----------------------------------------------------------
hi("DiagnosticError",          { fg = c.warn })
hi("DiagnosticWarn",           { fg = c.hi })
hi("DiagnosticInfo",           { fg = c.fg_dim })
hi("DiagnosticHint",           { fg = c.mute })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.warn })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.hi })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.fg_dim })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.mute })

-- Diff ------------------------------------------------------------------
hi("DiffAdd",    { bg = "#2a1a05" })
hi("DiffChange", { bg = "#2a1a05" })
hi("DiffDelete", { fg = c.warn, bg = c.bg_soft })
hi("DiffText",   { bg = "#3a2408" })

-- Git signs -------------------------------------------------------------
hi("GitSignsAdd",    { fg = c.bright })
hi("GitSignsChange", { fg = c.fg_dim })
hi("GitSignsDelete", { fg = c.warn })
