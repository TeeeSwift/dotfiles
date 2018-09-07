set nocompatible
filetype on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set number
set noeb vb t_vb=
set shell=/bin/bash
set t_Co=16
let mapleader = ","

" Theme-ing
syntax enable
set background=dark
colorscheme solarized

"Powerline 
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup 

set rtp+=/Users/taylor/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin
set laststatus=2

" Lines
set cursorline 
hi Cursorline ctermfg=white ctermbg=6 term=bold
hi CursorLineNr term=bold ctermfg=5
hi LineNr ctermbg=0 ctermfg=14
set relativenumber 
set number


"Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/matchit' 
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/webapi-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'prettier/vim-prettier'
Plugin 'terryma/vim-multiple-cursors'


"End Vundle
call vundle#end() 

"Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Snippets
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_leader_key='<C-Z>'

"fzf
set rtp+=/usr/local/opt/fzf
map <leader>; :FZF<CR>

"Prettier
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 130
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


"""""""""""
"WINDOWS + TABS
"""""""""""

"Sets direction of new window
set splitbelow
set splitright

"Remap window navigation
:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>

:nnoremap <C-t>     :tabnew<CR> 

