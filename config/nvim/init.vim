" To-Do List {{{
" }}}

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required
Plugin 'christoomey/vim-tmux-navigator' " navigate seamlessly between tmux and vim
Plugin 'tpope/vim-surround'             " quoting/parenthesizing made simple
Plugin 'ap/vim-css-color'               " highlight CSS hex colors
Plugin 'ntpeters/vim-better-whitespace' " highlight and remove whitespace
Plugin 'bling/vim-airline'                " better status line {{{
  let g:airline_powerline_fonts = 1
  set laststatus=2
  let g:airline#extensions#tabline#enabled = 3
" }}}
Plugin 'vim-airline/vim-airline-themes'   " make the status bar a reasonable color {{{
   set background=dark
   let g:airline_theme='solarized'
" }}}
Plugin 'kien/ctrlp.vim'                   " fuzzy file finding {{{
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
" }}}

Plugin 'elixir-lang/vim-elixir'         " elixir highlighting for vim
Plugin 'slashmili/alchemist.vim'        " ide-like utilities for alchemist

Plugin 'rust-lang/rust.vim'             " rust file detection, highlighting, etc.

Plugin 'cespare/vim-toml'               " TOML detection/highlighting

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


" {{{ LAYOUT BALANCING
" automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
" }}}

" {{{ SPELLCHECK
  set complete+=kspell  "autocomplete words if spellcheck is enabled"
" }}}

" {{{ LINE NUMBERING
  set relativenumber
  set number
  set ruler
" }}}

" {{{ INDENTATION
" language-specific settings found in ./vim/after/ftplugin/*.vim
  set expandtab shiftwidth=2 tabstop=2 "preferred default settings"
" }}}

" {{{ SEARCH
  set hlsearch
  set incsearch
" }}}

" {{{ APPEARANCE
  "line length indicator"
  if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
" }}}

" {{{ VIM FUNCTIONALITY
  set backspace= "disable backspace for a better vim mindset"
  set mouse= "disable mouse highlighting"
" }}}
