" To-Do List {{{
" FIXME: fix ctrl-p ignored files/directories
" FIXME: nobackup
" TODO: find an rspec highlight/textobj plugin
" }}}

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
Plugin 'scrooloose/nerdcommenter'         " easily comment/uncomment in code
Plugin 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plugin 'ap/vim-css-color'                 " highlight CSS hex colors

Plugin 'keith/swift.vim'                  " swift highlighting and indentation

Plugin 'elixir-lang/vim-elixir'           " elixir highlighting and indentation

Plugin 'slim-template/vim-slim'           " syntax highlighting for slim
Plugin 'vim-ruby/vim-ruby'                " vim/ruby configuration files
Plugin 'tpope/vim-rvm'                    " rvm support
Plugin 'tpope/vim-bundler'                " lightweight wrapper for bundler
Plugin 'tpope/vim-rake'	                  " for non-rails projects
Plugin 'tpope/vim-rails'                  " rails support
" TODO find an rspec highlight/textobj plugin

Plugin 'pangloss/vim-javascript'          " javascript syntax/indentation
Plugin 'jelera/vim-javascript-syntax'     " more complete js syntax
Plugin 'moll/vim-node'                    " like rails.vim for node
Plugin 'burnettk/vim-angular'             " vim does angular
Plugin 'kchmck/vim-coffee-script'         " syntax highlighting for coffeescript

Plugin 'dag/vim2hs'                       " Better Haskell syntax highlighting
Plugin 'lukerandall/haskellmode-vim'      " Haskell utilities {{{
  au Bufenter *.hs compiler ghc " use ghc for haskell files
  let g:haddock_browser="/Applications/Google\ Chrome.app"
  let g:haddock_browser="%s %s"
" }}}

Plugin 'godlygeek/tabular'                " dependency of vim-markdown, lines up text
Plugin 'plasticboy/vim-markdown'          " better markdown highlighting

Plugin 'kana/vim-textobj-user'            " allow for custom text object definitions
Plugin 'nelstrom/vim-textobj-rubyblock'   " rubyblock text objects
Plugin 'tpope/vim-fugitive'               " git wrapper (search .git directory)
Plugin 'ntpeters/vim-better-whitespace'   " highlight and remove whitespace
Plugin 'bling/vim-airline'                " better status line {{{
  let g:airline_powerline_fonts = 1
  set laststatus=2
  let g:airline#extensions#tabline#enabled = 3
" }}}
Plugin 'scrooloose/syntastic'             " syntax checking {{{
  "recommended default settings"
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ["jshint"]
  let g:syntastic_ruby_checkers = ["rubocop"]
  " let g:syntastic_haskell_checkers = ["ghc-mod"]

  if !exists('g:syntastic_html_tidy_ignore_errors')
    let g:syntastic_html_tidy_ignore_errors = []
  endif
  let g:syntastic_html_tidy_ignore_errors += [
    \ '<ion-',
    \ 'discarding unexpected </ion-'
    \ ]
" }}}
Plugin 'kien/ctrlp.vim'                   " fuzzy file finding {{{
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
  let g:ctrlp_custom_ignore = {
    \  'dir':  '\v[\/](\.(git|hg|svn)|(node_modules|dist))$',
    \  'file': '\v\.(exe|so|dll|git)$',
    \  'link': 'some_bad_symbolic_links',
    \ }

  " let g:ctrlp_extensions = ['autoignore']
" }}}
"Plugin 'ludovicchabant/vim-ctrlp-autoignore' " local config for ctrl-p

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

"LEADER
let mapleader=","

"MACROS
runtime macros/matchit.vim

" {{{ LAYOUT BALANCING
" automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
  nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
  nnoremap <leader>= :wincmd =<cr>
" }}}

" {{{ SPELLCHECK
  set complete+=kspell  "autocomplete words if spellcheck is enabled"
" }}}

" {{{ LINE NUMBERING
  set relativenumber
  set number
  set ruler
" }}}

" {{{ SYNTAX
" Other filetype detections are in ./ftdetect/*.vim
  syntax on
" }}}

" {{{ FOLDING
" language-specific settings found in ./vim/after/ftplugin/*.vim
  set foldmethod=syntax
  set foldlevelstart=4
" }}}

" {{{ INDENTATION
" language-specific settings found in ./vim/after/ftplugin/*.vim
  set expandtab shiftwidth=2 tabstop=2
" }}}

" {{{ SEARCH
  set hlsearch
  set incsearch
" }}}

" {{{ OPERATION
  set backspace=2
  set nobackup "TODO: ensure this is working
" }}}

" {{{ APPEARANCE
  set t_Co=256
  "let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized

  "line length indicator"
  if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
" }}}

"generate ctags"
nnoremap <leader>tt :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)

"to inspect the 'path' option, run :Path"
command! Path :echo join(split(&path, ","), "\n")
