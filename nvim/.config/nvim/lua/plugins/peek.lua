return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      close_on_bdelete = true, -- close preview window on buffer delete

      syntax = true,           -- enable syntax highlighting, affects performance

      theme = 'dark',          -- 'dark' or 'light'

      update_on_change = true,

      app = 'browser', -- 'webview', 'browser', string or a table of strings
      -- explained below

      filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
    })
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
