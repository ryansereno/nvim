local dap = require('dap')
local dapui = require("dapui")

require("dapui").setup()

dap.adapters.coreclr = {
  type = 'executable',
  command ='/Users/ryan/netcoredbg/build/src/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
	{
	type = "coreclr",
    request = "launch",
    name = "Launch .NET Core App with DAP",
    program = "/Users/ryan/Documents/EL4/EL-API/EstimatingLinkAPI/bin/Debug/net7.0/EstimatingLinkAPI.dll",
    args = {},
    cwd = "/Users/ryan/Documents/EL4/EL-API/EstimatingLinkAPI",
    env = {
      ASPNETCORE_ENVIRONMENT = "Development",
      ASPNETCORE_URLS = "https://localhost:7236;http://localhost:5080"
    },
    stopAtEntry = false,
    console = 'integratedTerminal', -- Outputs log to Neovim's terminal
  },
}

--reset layout
vim.api.nvim_set_keymap(
  "n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", 
  { noremap = true }
)

--auto open & close
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
