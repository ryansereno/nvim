local builtin = require('telescope.builtin')

-- open telescope fuzzy find with cntrl p or file find with \ff
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble }, -- cntrl-t remap for Trouble quickFix menu
      n = { ["<c-t>"] = trouble.open_with_trouble }, -- cntrl-t remap for Trouble quickFix menu
    },
  },
}
