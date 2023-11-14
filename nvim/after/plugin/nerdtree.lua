require("nvim-tree").setup {}

vim.api.nvim_set_keymap('n', '<leader>t', ':w<CR>:NvimTreeOpen<CR>', { noremap = true, silent = true })

