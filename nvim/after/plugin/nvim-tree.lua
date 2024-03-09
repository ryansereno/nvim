--file tree plugin

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mapping for 's' to open the file in a vertical split
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Split'))

  -- Custom color for untracked files
  vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = '#ffb380' })

end

-- pass to setup along with your other options
require("nvim-tree").setup {
	  renderer = {
    icons = {
      glyphs = {
        git = {
          untracked = "*"
        },
      }
    }
  },
  ---
  on_attach = my_on_attach,
  ---
}

