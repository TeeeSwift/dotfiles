local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set('n', '<leader>w', ":w<CR>")
keymap.set('n', '<leader>pv', ':Explore<CR>')

-- Screen movement
keymap.set({ 'n', 'x', 'o' }, 'H', "_")
keymap.set({ 'n', 'x', 'o' }, 'L', "$")

-- don't yank with x
keymap.set({ 'n', 'x' }, 'x', '"_x')
keymap.set({ 'n', 'x' }, 'c', '"_c')
keymap.set('n', 'C', '"_C')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-a>')


-- Split window
keymap.set('n', 'sp', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'vsp', ':vsplit<Return><C-w>w', { silent = true })

-- movement
keymap.set('v', "J", ":m '>+1<CR>gv=gv")
keymap.set('v', "K", ":m '>-2<CR>gv=gv")
keymap.set('n', 'k', [[(v:count > 1 ? "m'" . v:count : "g") . 'k']], { expr = true })
keymap.set('n', 'j', [[(v:count > 1 ? "m'" . v:count : "g") . 'j']], { expr = true })

keymap.set('n', "J", "mzJ`z")
keymap.set('n', "<C-d>", "<C-d>zz")
keymap.set('n', "<C-u>", "<C-u>zz")
keymap.set('n', "n", "nzzzv")
keymap.set('n', "N", "Nzzzv")

vim.api.nvim_create_user_command(
  'ConformFormat', -- The name of your command (e.g., you'll type :ConformFormat)
  function()
    -- This is the function that gets executed when the command is run
    require('conform').format()
  end,
  {
    -- Options for the command:
    desc = 'Format current buffer with Conform', -- Description shown in the command picker (e.g., when you type :Conform)
    nargs = 0,                                   -- This command takes no arguments
    -- buffer = true,                            -- Uncomment this line if you want the command to be buffer-local
  }
)

-- Function to toggle the quickfix window
function ToggleQuickfix()
  local quickfix_open = vim.fn.getqflist({ winid = 0 }).winid > 0

  if quickfix_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

-- Map <Space>q to toggle the quickfix window
vim.api.nvim_set_keymap('n', '<leader>qf', ':lua ToggleQuickfix()<CR>', { noremap = true, silent = true })

keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })




-- Function to create or switch to the terminal buffer
-- Lua variable to store the terminal buffer ID
local term_buf_id = nil
local last_non_term_buf_id = 0

-- Remap "jj" to exit terminal insert mode
vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Full-screen Terminal Toggle
vim.keymap.set({ "n", "t" }, "<C-x>", function()
  Snacks.terminal.toggle(nil, {
    id = "vwatcher",
    win = {
      style = "terminal",
      position = "float", -- Use float to overlay everything
      height = 0,         -- 0 or 1 in Snacks often defaults to full size
      width = 0,          -- depending on the specific layout config
      -- If 0 doesn't fill your screen, use 1 or the specific backdrop:
      backdrop = 100,
    }
  })
end, { desc = "Full-screen Watcher" })
