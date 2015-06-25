set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'                " let Vundle manage Vundle, required
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme
Plugin 'christoomey/vim-tmux-navigator'   " navigate seamlessly between tmux and vim
Plugin 'vim-ruby/vim-ruby'                " vim/ruby configuration files
Plugin 'tpope/vim-rvm'			  " rvm support
Plugin 'tpope/vim-bundler'		  " lightweight wrapper for bundler
Plugin 'tpope/vim-rake'			  " for non-rails projects
Plugin 'tpope/vim-rails'		  " rails support
Plugin 'kana/vim-textobj-user'		  " allow for custom text object definitions
Plugin 'nelstrom/vim-textobj-rubyblock'   " rubyblock text objects
Plugin 'tpope/vim-fugitive'		  " git wrapper (search .git directory)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"MACROS
runtime macros/matchit.vim

"LAYOUT BALANCING
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

"WINDOW FOCUS (interferes with layout balancing)
"TODO: delete/reenable
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

"LINE NUMBERING
set relativenumber 
set number
set ruler

"SYNTAX
syntax on

"FOLDING
set foldmethod=syntax
set foldlevelstart=4

"INDENTATION
"autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
set expandtab shiftwidth=2 tabstop=2

"SEARCH
set hlsearch
set incsearch

"OPERATION
set backspace=2
set nobackup

"to inspect the 'path' option, run :Path
command! Path :echo join(split(&path, ","), "\n")

"APPEARANCE
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
