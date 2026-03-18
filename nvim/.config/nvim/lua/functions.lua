vim.cmd [[command! RankAndFile lua vim.fn.setreg('+', vim.fn.expand('%')..':'..vim.fn.line('.'))]]

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalNumbers", { clear = true }),
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
