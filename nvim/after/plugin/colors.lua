function InitColor(color)
	color = color or "nightfox"
	vim.cmd.colorscheme(color)

end

InitColor()
