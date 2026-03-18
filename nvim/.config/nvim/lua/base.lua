-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- removes all autocommands
-- autocommands are like event triggers
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.conceallevel = 0

vim.o.textwidth = 80 -- Replace 80 with your desired line length
vim.o.wrap = true

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- colors
-- vim.o.term = 'iterm2'
vim.opt.termguicolors = true
vim.g.nord_italic = true

--shows line number
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*, /private/tmp/*'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true --auto indent
vim.opt.si = true -- smart indent
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- finding files, search subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.g.netrw_liststyle = 3

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.cmd [[
    function SetupConcealment()
        syntax match ZeroWidthNonJoiner /[\u200D]/ conceal
        " syntax match ZeroWidthNonJoiner /[\u200D]/ conceal cchar=
    endfunction

    augroup ConcealSetup
        autocmd!
        autocmd VimEnter * call SetupConcealment()
    augroup END
]]
