" TODO: fix ctrl-p ignored files/directiories

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

Plugin 'godlygeek/tabular'                " dependency of vim-markdown, lines up text
Plugin 'plasticboy/vim-markdown'          " better markdown highlighting

Plugin 'kana/vim-textobj-user'            " allow for custom text object definitions
Plugin 'nelstrom/vim-textobj-rubyblock'   " rubyblock text objects
Plugin 'tpope/vim-fugitive'               " git wrapper (search .git directory)
Plugin 'ntpeters/vim-better-whitespace'   " highlight and remove whitespace
Plugin 'bling/vim-airline'                " better status line
Plugin 'scrooloose/syntastic'             " syntax checking
Plugin 'kien/ctrlp.vim'                   " fuzzy file finding
"Plugin 'ludovicchabant/vim-ctrlp-autoignore' " local config for ctrl-p
"FIXME: doesn't seem to be working

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

"CTRL-P FILE FINDING
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

"let g:ctrlp_extensions = ['autoignore']

"SYNTAX CHECKING
"(recommended default settings)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_ruby_checkers = ["rubocop"]

if !exists('g:syntastic_html_tidy_ignore_errors')
  let g:syntastic_html_tidy_ignore_errors = []
endif
let g:syntastic_html_tidy_ignore_errors += [
  \ '<ion-',
  \ 'discarding unexpected </ion-'
  \ ]

"LINE NUMBERING
set relativenumber
set number
set ruler

"SYNTAX
syntax on
au BufNewFile,BufRead *.prawn set filetype=ruby  " .prawn files are ruby

"FOLDING
set foldmethod=syntax
set foldlevelstart=4

"INDENTATION
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
set expandtab shiftwidth=2 tabstop=2
"set expandtab shiftwidth=2 tabstop=2
"autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 expandtab

"SEARCH
set hlsearch
set incsearch

"OPERATION
set backspace=2
set nobackup "TODO: ensure this is working

"to inspect the 'path' option, run :Path
command! Path :echo join(split(&path, ","), "\n")

"APPEARANCE
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"AIRLINE STATUS BAR
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 3

"LINE LENGTH INDICATOR
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif