return {
  'fuenor/JpFormat.vim',
  ft = { 'markdown' }, -- Adjust filetypes as needed
  config = function()
    -- Set formatexpr to use JpFormat.vim's formatting function
    -- jpfmt#formatexpr() provides kinsoku shori ("hanging punctuation")
    -- jpvim#formatexpr() might be better if you don't want hanging punctuation,
    -- as it often feels more natural for general text. Experiment to see which you prefer.
    vim.opt.formatexpr = 'jpfmt#formatexpr()'

    -- Or if you prefer without "hanging punctuation"
    -- vim.opt.formatexpr = 'jpvim#formatexpr()'
  end,
}
