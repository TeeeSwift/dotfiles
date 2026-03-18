vim.lsp.enable({ 'lua_ls', 'marksman' })

-- Check whether it's a deno project or not
local function is_deno_project()
  local deno_files = { 'deno.json', 'deno.jsonc', 'deno.lock' }

  for _, filepath in ipairs(deno_files) do
    filepath = table.concat({ vim.fn.getcwd(), filepath }, '/')

    if vim.uv.fs_stat(filepath) ~= nil then return true end
  end

  return false
end

if is_deno_project() then
  vim.lsp.enable({ 'denols' })
else
  vim.lsp.enable({ 'ts_ls' })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then return end

    --@diagnostic disable-next=line: missing-parameter
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})
