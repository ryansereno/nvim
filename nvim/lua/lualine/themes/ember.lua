-- lualine theme matching ember-mono
local c = {
  bg      = "#170800",
  bg_soft = "#1f0e03",
  bg_sel  = "#341705",
  fg      = "#ff9a10",
  fg_dim  = "#c27309",
  mute    = "#7a4a08",
  faint   = "#4a2c05",
  hi      = "#ffb347",
  bright  = "#ffd280",
  warn    = "#ff5a1a",
}

-- mode section (a) inverts: dark text on amber. middle (b/c) sits on soft bg.
local mode_a = { bg = c.fg,     fg = c.bg, gui = "bold" }
local mode_b = { bg = c.bg_soft, fg = c.fg }
local mode_c = { bg = c.bg,     fg = c.fg_dim }

return {
  normal = {
    a = mode_a,
    b = mode_b,
    c = mode_c,
  },
  insert = {
    a = { bg = c.bright, fg = c.bg, gui = "bold" },
    b = mode_b,
    c = mode_c,
  },
  visual = {
    a = { bg = c.hi, fg = c.bg, gui = "bold" },
    b = mode_b,
    c = mode_c,
  },
  replace = {
    a = { bg = c.warn, fg = c.bg, gui = "bold" },
    b = mode_b,
    c = mode_c,
  },
  command = {
    a = { bg = c.fg_dim, fg = c.bg, gui = "bold" },
    b = mode_b,
    c = mode_c,
  },
  terminal = {
    a = { bg = c.mute, fg = c.bg, gui = "bold" },
    b = mode_b,
    c = mode_c,
  },
  inactive = {
    a = { bg = c.bg_soft, fg = c.mute, gui = "bold" },
    b = { bg = c.bg_soft, fg = c.mute },
    c = { bg = c.bg,      fg = c.faint },
  },
}
