# nvim setup on a new machine

## Prerequisites

```sh
brew install neovim node           # Nvim 0.11+ required; node is for vtsls/vue_ls
```

For C# (omnisharp): install .NET SDK from Microsoft.

## Bootstrap

```sh
# Packer (plugin manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## First nvim launch

1. Open nvim. Ignore the wall of errors — plugins aren't installed yet.
2. `:PackerSync` — installs all plugins.
3. Quit, reopen nvim.
4. `:Mason` should auto-install the LSP servers listed in `after/plugin/lsp.lua` (`ensure_installed`). If not, run `:MasonInstall <name>` per missing server.
5. `:TSUpdate` — install/rebuild treesitter parsers.

## Mason-installed packages (source of truth)

The LSP list is in [`after/plugin/lsp.lua`](after/plugin/lsp.lua) under `ensure_installed` — Mason auto-installs these.

**Non-LSP tools** (not auto-installed; run manually if needed):
- `swiftlint` — `:MasonInstall swiftlint`

## Verify

- `:checkhealth` — overall sanity check
- `:checkhealth vim.lsp` — LSP server attachment status
- Open a `.lua` file → `K` should show hover docs

## Key bindings cheat sheet

| Key | Action |
|---|---|
| `K` | Hover docs |
| `gd` / `gD` | Go to definition / declaration |
| `gi` / `go` | Go to implementation / type definition |
| `gr` | Find references |
| `gl` | Show diagnostic for line |
| `[d` / `]d` | Prev / next diagnostic |
| `<F2>` | Rename symbol |
| `<F3>` | Format (normal + visual) |
| `<F4>` | Code actions |
| `<leader>ff` | Telescope file search |
| `<C-p>` | Telescope live grep |
| `<C-t>` | Send Telescope results to Trouble |

## Notes

- **No AI autocomplete.** Completions come from LSP via nvim-cmp only.
- **Vue + TS** requires `vtsls` (not `ts_ls`) — vue_ls forwards requests through a command only vtsls exposes. The plugin config lives in `after/plugin/lsp.lua`.
- **LSP log path**: `~/.local/state/nvim/lsp.log` — can grow huge, safe to delete.
- **Known deprecation warning** (`vim.tbl_flatten`): comes from `norcalli/nvim-colorizer.lua` (abandoned) and `null-ls.nvim` (transitive dep of `prettier.nvim`, archived). Harmless until Nvim removes `vim.tbl_flatten`. Fix when it breaks: swap colorizer to `catgoose/nvim-colorizer.lua`; migrate `prettier.nvim` → `stevearc/conform.nvim`.
