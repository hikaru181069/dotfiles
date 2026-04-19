return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "DAP Continue" },
      { "<leader>do", function() require("dap").step_over() end,         desc = "DAP Step Over" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "DAP Step Into" },
      { "<leader>dO", function() require("dap").step_out() end,          desc = "DAP Step Out" },
      { "<leader>dr", function() require("dap").repl.open() end,         desc = "DAP REPL" },
      { "<leader>du", function() require("dapui").toggle() end,          desc = "DAP UI Toggle" },
      { "<leader>dx", function() require("dap").terminate() end,         desc = "DAP Terminate" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.40 },
              { id = "breakpoints", size = 0.20 },
              { id = "stacks",      size = 0.20 },
              { id = "watches",     size = 0.20 },
            },
            size = 40,
            position = "right",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 12,
            position = "bottom",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "js" },
      })

      require("dap-python").setup("python3")

      -- JavaScript / TypeScript (Node)
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }

      for _, lang in ipairs({ "javascript", "typescript" }) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Express server (server.js)",
            program = "${workspaceFolder}/server.js",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Express server (app.js)",
            program = "${workspaceFolder}/app.js",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
          },
        }
      end
    end,
  },
}
