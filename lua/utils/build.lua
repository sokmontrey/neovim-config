local cmd = {
	cpp = {
		compile = function(name, ext) return "clang++ --debug " .. name .. "." .. ext .. " -o " .. name end,
		run = function(name, _) return name end
	},
	cs = {
		compile = function(_, _) return "dotnet run" end,
		run = function(_, _) return "" end
	}
}

local function compile()
	local file_ext = vim.fn.expand("%:e")
	local file_name = vim.fn.expand('%:t:r')
	local command = cmd[file_ext].compile(file_name, file_ext)
	vim.cmd('5TermExec size=65 direction=vertical cmd="'.. command ..'"')
end

local function run()
	local file_ext = vim.fn.expand("%:e")
	local file_name = vim.fn.expand('%:t:r')
	local command = cmd[file_ext].run(file_name, file_ext)
	vim.cmd('5TermExec size=65 direction=vertical cmd="'.. command ..'"')
end

local function compile_and_run()
	local file_ext = vim.fn.expand("%:e")
	local file_name = vim.fn.expand('%:t:r')
	local command = cmd[file_ext].compile(file_name, file_ext) .. " & " .. cmd[file_ext].run(file_name, file_ext)
	vim.cmd('5TermExec size=65 direction=vertical cmd="'.. command ..'"')
end

return {
	compile = compile,
	run = run,
	compile_and_run = compile_and_run,
}
