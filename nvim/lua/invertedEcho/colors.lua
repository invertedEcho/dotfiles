function SetColor(color)
	color = color or "moonfly"
	vim.cmd.colorscheme(color)
end

SetColor()
