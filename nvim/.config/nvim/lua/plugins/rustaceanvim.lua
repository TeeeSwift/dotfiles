return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = function()
          -- For rust-analyzer, since Mason 2.0 puts it in PATH,
          -- `vim.fn.exepath` is the most reliable way to get its absolute path.
          local ra_path = vim.fn.exepath('rust-analyzer')
          if ra_path and vim.fn.filereadable(ra_path) then
            return { ra_path }
          else
            vim.notify(
              "Error: 'rust-analyzer' executable not found. Ensure it's installed via Mason or available globally.",
              vim.log.levels.ERROR)
            return { 'rust-analyzer' } -- Fallback to global if not found, but expect errors
          end
        end,
      },
    }
  end
}
