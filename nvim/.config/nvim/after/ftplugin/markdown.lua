-- Set your preferred width for manual formatting (gq)
vim.opt_local.textwidth = 80

-- Remove 't': Prevents auto-wrap while typing
-- Keep 'q': Allows formatting with 'gq'
-- Keep 'n': Recognizes numbered lists
-- Keep 'j': Removes comment leaders when joining lines
vim.opt_local.formatoptions:remove("t")

-- Optional: If you want to ensure long lines aren't broken even if
-- you type inside them later
vim.opt_local.formatoptions:append("l")
