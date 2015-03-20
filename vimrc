"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

set nocompatible               " Be iMproved
if has('vim_starting')

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************

" Calendar vim
NeoBundle 'mattn/calendar-vim'
" Ctrlp
NeoBundle 'ctrlpvim/ctrlp.vim'
" vim-json
NeoBundle 'leshill/vim-json'
" vim-surround
NeoBundle 'tpope/vim-surround.git'
" jedi-vim
NeoBundle 'davidhalter/jedi-vim'
" NerdTree
NeoBundle 'scrooloose/nerdtree'
" Airline
NeoBundle 'bling/vim-airline'
" Fugitive
NeoBundle 'tpope/vim-fugitive'
" ack.vim (Needs ack-grep)
NeoBundle 'mileszs/ack.vim'
" Polyglot
NeoBundle 'sheerun/vim-polyglot'
" gitgutter
NeoBundle 'airblade/vim-gitgutter'
" vim-commentary
NeoBundle 'tpope/vim-commentary'
" CSApprox  http://www.vim.org/scripts/script.php?script_id=2390
NeoBundle 'vim-scripts/CSApprox'
" vim-shell
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'
" Syntastic (Needs pip install flake8)
NeoBundle 'scrooloose/syntastic'
" TaskList
NeoBundle 'vim-scripts/TaskList.vim'
" logstash highlight
NeoBundle 'vim-scripts/logstash.vim'

" Tagbar  (Needs exuberant-ctags)
NeoBundle 'majutsushi/tagbar'
" IdentLine
NeoBundle 'Yggdroot/indentLine'

"" Coloresque
NeoBundle 'gorodinskiy/vim-coloresque'

" Themes
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

"" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

"" VimChat
NeoBundle 'ironcamel/vimchat'

" Funny stuff
" Game of life
NeoBundle 'vim-scripts/vim-game-of-life.git'
" Tetris
NeoBundle 'vim-scripts/TeTrIs.vim.git'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""
" SETUP
"""

"" map leader to
let mapleader=","

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

""Vim does not support backspace in Insert Mode (vim terminal OSX)
set backspace=indent,eol,start

""spacetabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase  " Ignore case when searching
set smartcase  " When searching try to be smart about cases

"" enable hidden buffers
set hidden

"" Encoding
set bomb
set ttyfast
set binary

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use Unix as the standard file type
set ffs=unix,dos,mac
set showcmd
set shell=/bin/bash

""no bells
if has("gui_macvim")
  " set macvim specific stuff
  set visualbell
endif
set novisualbell
set noerrorbells
set vb t_vb=
au GUIEnter * set vb t_vb=

"" Visual settings
syntax on
set ruler  "Ruler format (percent file, line and column)
set number " Display line numbers


""Highlight *.md files in markdown
au BufNewFile,BufRead *.md set filetype=markdown

"" 256 colors in colorscheme (from vim-bootstrap)
"" set t_Co=256
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    ""set guifont=Menlo:h12
    ""set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h12
    ""set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    set guifont=Menlo\ for\ Powerline:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

" Removing bars and scroll bars in GUI
set guioptions-=m ""remove menu bar
set guioptions-=T ""remove tool bar
set guioptions+=LlRrb ""add scroll lines
set guioptions-=LlRrb ""remove scroll lines

"" Avoiding trailing whitespaces
highlight TrailWhitespace ctermbg=blue guibg=blue
match TrailWhitespace /\s\+$\| \+\ze\t/
""highlight BadWhitespace ctermbg=red guibg=red (from vim-bootstrap)

""Highlight current line.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""80 characters vertical line
highlight ColorColumn ctermbg=grey ctermfg=white guibg=grey guifg=white
set colorcolumn=79

"" Colorscheme
"" if has("gui_running")
""   colorscheme blackboard
"" else
""   colorscheme koehler
"" endif
set background=dark
if !has('gui_running')
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif
colorscheme solarized
"" let g:solarized_termcolors=256


""Display one more bottom line
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Don't redraw while executing macros (good performance config)
set lazyredraw

" How many tenths of a second to blink when matching brackets
set mat=2

" Show matching brackets when text indicator is over them
set showmatch

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
" Mappings
"*****************************************************************************
"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gll :!git pull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Ctrlp.vim
set wildmode=list:longest,list:full
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*~
set wildignore+=*.obj,.git,*.rbc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'

"" ctrlp in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=W391'

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1

" Tagbar
nmap <silent> <leader>m :TagbarToggle<CR>
let g:tagbar_autofocus = 1


""Surround helpers
"" t
autocmd FileType htmldjango let b:surround_116 = "{% trans \"\r\" %}"
"" T
autocmd FileType htmldjango let b:surround_84 = "{% blocktrans %}\r{% endblocktrans %}"
"" c
autocmd FileType htmldjango let b:surround_99 = "{# \r #}"
"" C
autocmd FileType htmldjango let b:surround_67 = "{% comment %}\n\r\n{% endcomment %}"

"" Move tabs
nnoremap <leader>+ :call MoveToNextTab()<CR>
nnoremap <leader>- :call MoveToPrevTab()<CR>

" Fast saving
nmap <leader>w :w!<cr>
""Mapping
map <leader>t <Plug>TaskList
map <leader>1 :NERDTreeToggle<CR>

map <leader>f :nohlsearch<CR>
map <leader>k :Calendar<CR>

"" Copy/Paste Clipboard
nmap <leader>v "+gP
imap <leader>v <ESC><C-V>i
vmap <leader>c "+y

""Note -- <leader>te Open Tetris
"":Gol - Game of life

let g:javascript_enable_domhtmlcss = 1

"#############################
" Functions and small plugins
"#############################

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()       
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"" Move tabs
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc


"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
