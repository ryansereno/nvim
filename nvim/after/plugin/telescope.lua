local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })

