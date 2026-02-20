-- Load nvim-dap and nvim-dap-ui
local dap = require("dap")
local dapui = require("dapui")

-- Setup the debugging adapter for Rust (using lldb)
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- Adjust the path if necessary
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch Rust Program",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    runInTerminal = true,
  },
}

-- Setup nvim-dap-ui for a better debugging experience
dapui.setup()

-- Open/close the UI when debugging starts and ends
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
