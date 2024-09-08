function InitColor(color)
	color = color or "night-owl"
	vim.cmd.colorscheme(color)
        vim.api.nvim_set_hl(0, "Normal", {ctermbg = nil, guibg = nil})
    	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
end

InitColor()
