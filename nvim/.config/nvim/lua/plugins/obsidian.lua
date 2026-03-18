-- Define a global variable for the vault's root path
-- You can change this path if your vault is located elsewhere
local obsidian_vault = vim.fn.expand("~") .. "/projects"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. obsidian_vault .. "/**/*.md",
    "BufNewFile " .. obsidian_vault .. "/**/*.md",
  },
  config = function()
    vim.opt.conceallevel = 1
    require('obsidian').setup({
      workspaces = {
        {
          name = "work",
          path = obsidian_vault .. "/work/project-management",
        },
        {
          name = "hayama",
          path = obsidian_vault .. "/personal/vaults/hayama/quartz/content",
          overrides = {
            templates = {
              folder = "templates",
              customizations = {
                lore = {
                  notes_subdir = "Lore",
                  note_id_func = function(title)
                    return title
                  end,
                },
                actors = {
                  notes_subdir = "actors",
                  note_id_func = function(title)
                    return title
                  end,
                },
                atlas = {
                  notes_subdir = "atlas",
                  note_id_func = function(title)
                    return title
                  end,
                },
                chronicles = {
                  notes_subdir = "chronicles",
                  note_id_func = function(title)
                    return title
                  end,
                },
              },
            }
          }
        },
      },
      legacy_commands = false,
      picker = {
        name = "snacks.pick",
        note_mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
        tag_mappings = {
          tag_note = "<C-x>",
          insert_tag = "<C-l>",
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
        create_new = true,
      },

      checkbox = {
        enabled = true,
        create_new = false,
        order = { " ", "~", "!", ">", "x" },
      },

      -- custom functions

    })
  end

}
