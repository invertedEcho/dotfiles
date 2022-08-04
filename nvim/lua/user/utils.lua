U = {}

U.bind = function(fn, ...)
	local args = { ... }
	return function()
		return fn(unpack(args))
	end
end

U.nv_cmd = vim.api.nvim_command

U.key = vim.keymap.set

U.D = function(...)
	print(vim.inspect(unpack({ ... })))
end

U.make_key = function(opts)
	return function(...)
		local args = { ... }
		table.insert(args, opts)
		U.key(unpack(args))
	end
end

U.make_cmd = function(cmd)
	return U.bind(U.nv_cmd, cmd)
end
