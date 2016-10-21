" To-Do List {{{
" - Make a 'default' theme that's easy to switch to for non-solarized
"   terminals
" }}}

set nocompatible              " be iMproved, required
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator' " navigate seamlessly between tmux and vim
Plug 'tpope/vim-surround'             " quoting/parenthesizing made simple
Plug 'ntpeters/vim-better-whitespace' " highlight and remove whitespace
Plug 'kien/ctrlp.vim'                   " fuzzy file finding {{{
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
" }}}

" LANGUAGES
" note: many plugins load for markdown files in order to get proper syntax
"       highlighting for fenced code blocks

Plug 'elixir-lang/vim-elixir',  { 'for': ['elixir', 'markdown'] }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

Plug 'ElmCast/elm-vim',         { 'for': ['elm', 'markdown'] }

Plug 'rust-lang/rust.vim',      { 'for': ['rust', 'markdown'] }
Plug 'cespare/vim-toml',        { 'for': 'toml' }

" highlight CSS hex colors
Plug 'ap/vim-css-color',        { 'for': ['css', 'scss'] }

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } "{{{
let g:vim_markdown_folding_disabled = 1
"}}}

" {{{ APPEARANCE AND THEMES
Plug 'bling/vim-airline'                " better status line {{{
  let g:airline_powerline_fonts = 1
  set laststatus=2
  let g:airline#extensions#tabline#enabled = 3
" }}}
Plug 'vim-airline/vim-airline-themes'   " make the status bar a reasonable color {{{
   set background=dark
   let g:airline_theme='solarized'
" }}}
Plug 'altercation/vim-colors-solarized' " nicer solarized color scheme {{{
  " colorscheme solarized set below in APPEARANCE
" }}}
" }}}

call plug#end()

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
  colorscheme solarized " from altercation/vim-colors-solarized
  if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
" }}}

" {{{ VIM FUNCTIONALITY
  set mouse= "disable mouse highlighting"
" }}}
