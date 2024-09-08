local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

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
    program = "/Users/ryan/Documents/EL4/FL-API/FieldLinkAPI/bin/Debug/net8.0/FieldLinkAPI.dll",
    args = {},
    cwd = "/Users/ryan/Documents/EL4/FL-API/FieldLinkAPI",
    env = {
      ASPNETCORE_ENVIRONMENT = "Development",
      ASPNETCORE_URLS = "https://localhost:7236;http://localhost:5080"
    },
    stopAtEntry = false,
    console = 'integratedTerminal', -- Outputs log to Neovim's terminal
    externalConsole = true,
externalConsoleCommand = "iterm2"
  },
}

--breakpoint icons
vim.fn.sign_define('DapBreakpoint', { text='🛑', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text='▶️', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped' })

--toggle breakpoint
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapToggleBreakpoint<CR>", {noremap=true})

-- start debugging
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})

--reset layout
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", { noremap = true })

--auto open & close the UI panes
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
