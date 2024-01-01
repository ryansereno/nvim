-- open nvim-tree with \t
vim.api.nvim_set_keymap('n', '<leader>t', ':w<CR>:NvimTreeOpen<CR>', { noremap = true, silent = true })

-- File type dependent prettifier with \p
--vim.api.nvim_set_keymap('n', '<leader>p', ':Prettier<CR>', { noremap = true, silent = false })
vim.cmd [[
function! FormatBuffer()
    if &filetype == 'python'
        execute '!black %'
    else
        execute 'Prettier'
    endif
endfunction
]]
vim.api.nvim_set_keymap('n', '<leader>p', ':call FormatBuffer()<CR>', { noremap = true, silent = true })


-- move visual blocks with J & K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place with joining lines with J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor centered vertically on cntrl U and cntrl D scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms centered vertically
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste command that preserves clipboard
vim.keymap.set("x", "p", [["_dP]])

-- replace all instances of current word with \s
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- change github copilot key to cntrl-j
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
 
-- execute python code
vim.api.nvim_set_keymap('n', ',<space>', ':w<CR>:w !python3 %<CR>', { noremap = true, silent = false })


