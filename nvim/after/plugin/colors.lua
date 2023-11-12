function InitColor(color)
	color = color or "night-owl"
	vim.cmd.colorscheme(color)
end

InitColor()
