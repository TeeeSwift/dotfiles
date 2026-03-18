return {
  cmd = { 'deno', 'lsp' },
  root_markers = { 'deno.json', 'deno.jsonc' },
  filetypes = {'javascript', 'typescript'},
  settings = {
    deno = {
      enable = true,
      suggest = {
        names = true
      }
    }
  }
}
