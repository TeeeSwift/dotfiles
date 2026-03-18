return {
  enabled = false,
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>ft", mode = { "n", "v" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "<leader>fs", mode = { "n", "v" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter" },
  },
  init = function()
    require('flash').toggle(true)
  end
}
