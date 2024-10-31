return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- dapui.setup()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          dapui.setup()
        end,
      })
      -- require("dap-go").setup()

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

      -- vim.keymap.set("n", "<Leader>dt", ":DapUiToggle<CR>", {})
      -- vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
      -- vim.keymap.set("n", "<Leader>dc", dap.continue, {})
      -- vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", {})

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "⏺️", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
    end,
  },
}
