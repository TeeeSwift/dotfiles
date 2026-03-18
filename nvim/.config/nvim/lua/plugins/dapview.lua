return {
  {
    "igorlfs/nvim-dap-view",
    -- let the plugin lazy load itself
    lazy = false,
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      windows = {
        size = 0.5,
        position = "right",
        terminal = {
          size = 0.5,
          position = "left",
          -- List of debug adapters for which the terminal should be ALWAYS hidden
          hide = {},
        },
      },
    },
  },
}
