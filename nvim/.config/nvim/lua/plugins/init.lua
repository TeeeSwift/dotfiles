return {
  { "tpope/vim-fugitive",         lazy = false },
  {
    "numToStr/Comment.nvim", -- Fix: Remove the extra nesting
    config = function()
      require('Comment').setup()
    end
  },
  { 'kevinhwang91/nvim-bqf' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'lewis6991/gitsigns.nvim' },
  {
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup({})
    end
  }
}
