"reload with :so %

" Enable more colors for the colorschemes (by using CSApprox plugin)
" also install in ubuntu ncurses-term
" and put export TERM=xterm-256color to .bashrc
" Install vim-gtk package to remove the 'must be compiled with gui support' warning
set t_Co=256
syntax on
colorscheme inkpot

let mapleader = ","

"line numbers
set number

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn!<cr>
map <left> :bp!<cr>
map <down> :bd<cr>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

"NERDTree Plugin
:map <leader>d :NERDTreeToggle<cr>


