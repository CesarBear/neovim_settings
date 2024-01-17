return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
  },

  config = function()
    local dap = require("dap")

    -- set up the key bindings
    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<F10>", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<F11>", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<F12>", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<Leader>b", function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>B", function()
      dap.set_breakpoint()
    end)

    -- set up the c++/rust debugger with llvm-vscode
    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
      name = "lldb",
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.rust = dap.configurations.cpp

    local dapui = require("dapui")
    require("dapui").setup()
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
  end,
}
