return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require("dap")
    local debug_dir = vim.fn.getenv('VSCODE_JS_DEBUG_DIR')
    if debug_dir == vim.NIL or debug_dir == "" then
      -- Handle the missing variable gracefully or set a default
      return
    end

    local js_debug_path = debug_dir .. '/lib/node_modules/js-debug/dist/src/dapDebugServer.js'

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { js_debug_path, "${port}" },
      }
    }

    dap.configurations.javascript = {
      {
        name = "Launch file",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
  end,

  keys = {
    { "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>",         { desc = "Debugger step into" } },
    { "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>",         { desc = "Debugger step over" } },
    { "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>",          { desc = "Debugger step out" } },
    { "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>",          { desc = "Debugger continue" } },
    { "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" } },
    { "<Leader>dx", "<cmd>lua require'dap'.terminate()<CR>",         { desc = "Debugger reset" } },
    { "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>",          { desc = "Debugger run last" } },

    -- rustaceanvim
    { "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>",     { desc = "Debugger testables" } }
  }

}
