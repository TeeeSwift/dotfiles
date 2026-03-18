-- In your ~/.config/nvim/lua/lsp/marksman.lua
local obsidian_vault = vim.fn.expand("~") .. "/projects/personal/vaults"

local function is_descendant(file_path, dir_path)
  -- 1. Get the absolute path of the current buffer's file.
  -- '%:p' expands to the full path of the current file.
  local abs_file = vim.fn.fnamemodify(file_path, ':p')

  -- 2. Get the absolute path of the directory and ensure it has a trailing separator.
  local abs_dir = vim.fn.fnamemodify(dir_path, ':p')

  -- Ensure the directory path ends with a path separator (e.g., '/').
  -- This prevents false positives like checking '~/projects/foo_file' against '~/projects/foo'.
  local path_sep = package.config:sub(1, 1) -- Get the system path separator (e.g., '/' or '\').
  if not abs_dir:match(path_sep .. "$") then
    abs_dir = abs_dir .. path_sep
  end

  -- 3. Check if the absolute file path starts with the absolute directory path.
  return abs_file:sub(1, #abs_dir) == abs_dir
end

return {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'md' },
  -- root_dir = '/Users/taylor/projects/work/e1/bizdev-document'
  root_dir = function(bufnr_or_fname, on_dir)
    local fname

    -- 1. Check if the argument is a buffer number (integer)
    if type(bufnr_or_fname) == 'number' then
      -- Retrieve the full file name from the buffer number
      fname = vim.api.nvim_buf_get_name(bufnr_or_fname)
    elseif type(bufnr_or_fname) == 'string' then
      -- Argument is already the file path string (the ideal case)
      fname = bufnr_or_fname
    else
      -- Handle nil/unexpected arguments
      return nil
    end

    if is_descendant(fname, obsidian_vault) then
      return nil
    end

    local r = vim.fs.root(fname, { '.git', '.marksman.toml' }) or fname

    on_dir(r)
  end,
}
