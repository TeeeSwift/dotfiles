return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      exclude = { ".git", "node_modules" },
      filter = {
        typescriptreact = {
          "Function",
          "Variable",
          "Class",
          "Method",
          "Constant"
        },
      }
    },
    scratch = {
      name = "Scratch",
      ft = "markdown",
      filekey = {
        id = function()
          local root = Snacks.git.get_root() or vim.fn.getcwd()
          return root
        end,
        cwd = false,   -- use current working directory
        branch = true, -- use current branch name
        count = true,  -- use vim.v.count1
      },
    },
    term = {}

    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<leader>pf", function() Snacks.picker.files() end,                                                           desc = "Find Files" },
    { "<leader>pg", function() Snacks.picker.grep() end,                                                            desc = "Grep" },
    { "<leader>pd", function() Snacks.picker.diagnostics() end,                                                     desc = "Diagnostics" },
    { "<leader>ps", function() Snacks.picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } }) end, desc = "LSP Symbols" },
    { "<leader>pc", function() Snacks.picker.commands() end,                                                        desc = "Commands" },
    { "gr",         function() Snacks.picker.lsp_references() end,                                                  nowait = true,                 desc = "References" },
    { "<leader>.",  function() Snacks.scratch() end,                                                                desc = "Toggle Scratch Buffer" }
  },
  init = function()
    vim.api.nvim_create_user_command("Themes", function() Snacks.picker.colorschemes() end, {})
  end
}
