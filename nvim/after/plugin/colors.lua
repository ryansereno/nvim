function InitColor(color)
	color = color or "ember"
	vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "SignColumn", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "NormalNC", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "MsgArea", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "CursorLine", {bg = "NONE", ctermbg = "NONE"})
    vim.api.nvim_set_hl(0, "Pmenu", {bg = "NONE", ctermbg = "NONE"})
    
    vim.g.transparent_background = true
end

InitColor()

vim.api.nvim_create_user_command("TransparentColo", function(opts)
    InitColor(opts.args)
end, { nargs = 1, complete = "color" })
