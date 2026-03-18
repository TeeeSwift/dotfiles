return {
  "tpope/vim-fugitive",
  keys = {
    -- {"<leader>gs", mode="n", function() vim.cmd.Git() end, desc= "git something"}
  },
  config = function()
    local fn = vim.fn

    function my_statusline()
      local branch = fn.FugitiveHead()

      if branch and #branch > 0 then
        branch = '  ' .. branch
      end

      return branch .. ' %f%m%=%l:%c'
    end

    -- Set the statusline to use your custom function
    vim.o.statusline = '%!v:lua.my_statusline()'
  end

}
