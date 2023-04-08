function ConfigureColor(color)
	color = color or "dark-decay"
	vim.cmd.colorscheme(color)
end

ConfigureColor()
