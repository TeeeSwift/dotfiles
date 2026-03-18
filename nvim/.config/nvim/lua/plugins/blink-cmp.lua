return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  -- use a release tag to download pre-built binaries
  version = 'v1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- Use 'preset' to load a base, then override individual keys
      preset = 'default',

      ['<C-n>'] = { 'show', 'select_next', 'fallback' },
      ['<C-k>'] = { 'show', 'show_documentation', 'hide_documentation' },

      ['<C-space>'] = {},
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},

      ['<C-f>'] = { 'snippet_forward', 'fallback' },
      ['<C-b>'] = { 'snippet_backward', 'fallback' },
      ['<Up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<Down>'] = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      -- use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      default = { 'lazydev', 'buffer', 'lsp', 'path', 'snippets' },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      -- add vim-dadbod-completion to your completion providers
      providers = {
        -- dont show LuaLS require statements when lazydev has items
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },

    -- experimental signature help support
    signature = { enabled = true },

    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    completion = {
      menu = {
        draw = {
          columns = {
            { "label",      "label_description", gap = 1 },
            { "kind_icon",  "kind" },
            { "source_name" }
          }
        }
      },
      documentation = { auto_show = false },
    },
    -- (Default) Only show the documentation popup when manually triggered
  },
  opts_extend = { "sources.default" },
}
