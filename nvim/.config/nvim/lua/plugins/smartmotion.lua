return {
  "FluxxField/smart-motion.nvim",
  config = function(_, opts)
    -- 1. Run the standard setup
    require("smart-motion").setup(opts)

    -- 2. Force ; and , back to native Vim behavior
    -- We use the literal characters so Vim knows to use the built-in command
    vim.keymap.set({ "n", "x", "o" }, ";", ";", { desc = "Native repeat" })
    vim.keymap.set({ "n", "x", "o" }, ",", ",", { desc = "Native reverse repeat" })
  end,
  opts = {
    presets = {
      delete = true,
      change = true,
      yank = true,
      treesitter = true,
      diagnostics = true,
      search = {
        s = true,
        S = false,
        f = false,
        F = false,
        t = false,
        T = false
      },
    },
  }
}
