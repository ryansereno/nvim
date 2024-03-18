-- Turns off all bell notifications in Vim
vim.opt.belloff = "all"

-- Enables line numbers in the editor
vim.wo.number = true

-- Sets the number of spaces a tab character represents
vim.bo.tabstop = 4

-- Sets the number of spaces used for each indentation level
vim.bo.shiftwidth = 4

-- Converts tabs into spaces
vim.bo.expandtab = true

-- Highlight terms found when searching
vim.o.hlsearch = true

-- Makes search case insensitive
vim.o.ignorecase = true

-- Detect whether to make search case sensitive
vim.o.smartcase = true

-- Enables syntax highlighting in Vim
vim.cmd('syntax on')
