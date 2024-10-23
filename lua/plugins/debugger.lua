return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')
			dap.adapters.codelldb = {
				type = 'server',
				port = "${port}",
				executable = {
					-- CHANGE THIS to your path!
					command = vim.fn.stdpath('data') .. '\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe',
					args = { "--port", "${port}" },
					-- On windows you may have to uncomment this:
					detached = false,
				}
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return ".\\out\\" .. vim.fn.expand('%:t:r')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
				},
			}
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes",  size = 0.4 },
							{ id = "watches", size = 0.2 }
						},
						position = "left",
						size = 50
					},
					{
						elements = {
							{ id = "repl",    size = 0.4 },
							{ id = "console", size = 0.6 }
						},
						position = "bottom",
						size = 10
					}
				},
			})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end
	}
}
