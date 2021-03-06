"reload with :so %
set nocompatible

" Enable more colors for the colorschemes (by using CSApprox plugin)
" also install in ubuntu ncurses-term " and put export TERM=xterm-256color to .bashrc
" Install vim-gtk package to remove the 'must be compiled with gui support' warning
set t_Co=256
syntax on

" Use vundle to easily modify the runtime path to include all 
" plugins under the ~/.vim/bundle directory
filetype off

"https://github.com/gmarik/vundle#readme
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
" use :BundleInstall to install all other bundles
Bundle 'gmarik/vundle'

" Utility
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle 'scrooloose/nerdtree'
Bundle "bmatheny/vim-scala"
Bundle "ervandew/supertab"
"let g:SuperTabDefaultCompletionType = "context"

Bundle "fholgado/minibufexpl.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "vim-scripts/HTML-AutoCloseTag"

Bundle "kien/ctrlp.vim"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" snipmate + dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle "garbas/vim-snipmate"

Bundle "kchmck/vim-coffee-script"
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

Bundle "chrisbra/SudoEdit.vim"
Bundle "tsaleh/vim-matchit"

Bundle "jpalardy/vim-slime"
let g:slime_target = "tmux"

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"let g:CommandTMatchWindowAtTop=1 " show window at top


"Color scheme
Bundle "altercation/vim-colors-solarized"

Bundle "cschlueter/vim-mustang"
colorscheme mustang


"preceeds global plugin shortcuts
let mapleader = ","
"preceeds local/buffer plugin shortcuts
let maplocalleader = "-"

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something useful
map <right> :bn!<cr>
map <left> :bp!<cr>
map <down> :bd<cr>

" Only hide buffers when navigating away. Doesn't close them 
" and doesn't store them
set hidden
set number "line numbers
set tabstop=4
set softtabstop=4
set smarttab 
set autoindent " Always autoindent
set smartindent
set hlsearch  " Highlight search
set smartcase " all lower case is caseinsensitive search. Mixed case is casesensitive search
set incsearch " Show results as you search
set nowrap
set shiftwidth=4 " Number of spaces for autoindent
set shiftround " Use multiples of shiftwidth when using < or >
set showmatch " Show matching parenthesis

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

" set filetype stuff to on
filetype plugin indent on

" Show trailing spaces and tabs
set list
set listchars=tab:».,trail:.,extends:#,nbsp:.
"disable trailing tabs for html,xml
"autocmd filetype html,xml,jsp set listchars-=tab:>.

"search across files
:map <leader>g :vimgrep // **/* <BAR> cw<left><left><left><left><left><left><left><left><left><left><left>

"--------------------
" PLUGINS
" -------------------

"NERDTree Plugin
:map <leader>d :NERDTreeToggle<cr>

"vimclojure required
"filetype plugin indent on
"let vimclojure#NailgunClient = "/opt/clojure/vimclojure/ng"
"let clj_want_gorilla = 1
"let g:clj_paren_rainbow = 1

"execute the current line on shell
:map <localleader>e :call ExecuteLine()<cr>
function! ExecuteLine()
	let line = getline(".")
	let result = system(line)
	echo result
endfunction
