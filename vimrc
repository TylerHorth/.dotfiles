" ---------------------------------------- 
"                PLUGINS 
" ---------------------------------------- 

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mhinz/vim-startify'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'svermeulen/vim-easyclip'
Plug 'lervag/vimtex'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'morhetz/gruvbox'
Plug 'gioele/vim-autoswap'
Plug 'gabrielelana/vim-markdown'
Plug 'digitaltoad/vim-pug'
Plug 'chrisbra/unicode.vim'
Plug 'sunaku/vim-dasht'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/bufonly.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'dag/vim-fish'
Plug 'AndrewRadev/switch.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/neosnippet.vim' 
Plug 'Shougo/neosnippet-snippets'
Plug 'majutsushi/tagbar'
Plug 'matze/vim-move'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if executable('tern')
  Plug 'ternjs/tern_for_vim'
endif
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neco-syntax'
  Plug 'ponko2/deoplete-fish'
  Plug 'poppyschmo/deoplete-latex'
  if executable('tern')
    Plug 'carlitux/deoplete-ternjs'
  endif
else
  Plug 'maralla/completor.vim'
endif

call plug#end()     


" ---------------------------------------- 
"                SETTINGS 
" ---------------------------------------- 

" -------------- GENERAL -----------------

let mapleader=','                       " Mapleader
let maplocalleader='-'                  " Maplocalleader
set showcmd                             " Show (partial) command in status line.
set showmatch                           " Show matching brackets.
set ignorecase                          " Do case insensitive matching
set smartcase                           " Do smart case matching
set incsearch                           " Incremental search
set autowrite                           " Automatically save before commands like :next and :make
set hidden                              " Hide buffers when they are abandoned
set mouse=a                             " Enable mouse usage (all modes)
set tabstop=2                           " a tab is two spaces
set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set number                              " always show line numbers
set shiftwidth=2                        " number of spaces to use for autoindenting
set expandtab                           " Spaces instad of tabs
set shiftround                          " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch                            " highlight search terms
set foldmethod=syntax                   " Create folds based on syntax
set foldlevelstart=99                   " Folds are not closed to start
set pastetoggle=<F2>                    " Paste mode
set t_Co=256                            " Use 256 colors
set termguicolors                       " True color support
set noshowmode                          " Don't show current mode
set clipboard=unnamed,unnamedplus       " Merge system and vim clipboards
set background=dark                     " Set background to dark
set grepprg=set grepprg=rg\ --vimgrep   " Use ag instead of grep
set grepformat=%f:%l:%c:%m,%f:%l:%m     " Set grepformat
set splitbelow                          " Default to split below current window
set splitright                          " Default to split on the right of window
set updatetime=250                      " Reduce update time from 4 seconds
set wrap                                " wrap long lines
set shell=bash                          " Tell vim to use bash shell
set nocursorline                        " Don't highlight current line
set ttyfast                             " Speed shit up or something
set whichwrap+=<,>,[,]                  " Line wrap for arrow keys
set signcolumn=yes                      " Always sign column
let g:c_syntax_for_h = 1                " Assume h files are c not c++
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1   " Cursor shape for neovim
endif
if exists('&inccommand')
  set inccommand=nosplit
endif


" -------------- COLORSCHEME -------------

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_sign_column = 'bg0'
silent! colorscheme	gruvbox


" -------------- MAPPINGS ----------------

" clear search
nnoremap <leader>/  :noh<CR>

" buffer nav
nnoremap L          :bn<CR><F5>
nnoremap H          :bN<CR><F5>
nnoremap <leader>qq :bd<CR>
nnoremap <leader>qw :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qh <C-W><C-H>:q<CR>
nnoremap <leader>qj <C-W><C-J>:q<CR>
nnoremap <leader>qk <C-W><C-K>:q<CR>
nnoremap <leader>ql <C-W><C-L>:q<CR>
nnoremap <leader>ss :w<CR>
nnoremap <leader>wq :wq<CR>

" normal movement
noremap  gh         25h
noremap  gj         10j
noremap  gk         10k
noremap  gl         25l

" quick macro
map      Q          @q

" c++ make/run
map      \m         :silent make\|redraw!\|cc<CR>
map      \r         :!valgrind %:p:r<CR>
map      \\         \m\r

" Quickly edit/reload the vimrc file
nmap     <silent>   <leader>ev  :e  $MYVIMRC<CR>
nmap     <silent>   <leader>sv  :so $MYVIMRC<CR><F5> 
" New lines from normal mode
nnoremap <leader>k  O<Esc>j
nnoremap <leader>j  o<Esc>k

" New lines from normal mode
inoremap <leader>j  <C-O>o
inoremap <leader>k  <C-O>O

" Navigation from insert
inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-K> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <C-H>      <Left>
inoremap <C-L>      <Right>

" paste from insert
imap     <C-p>      <C-R>"
imap     <C-S-p>    <Left><C-R>"

" Closer <Del>
inoremap <C-D>      <Del>

" Long line nav
nnoremap j          gj
nnoremap k          gk

" Jump to next closest bracket, comma, quote, etc.
if has('nvim')
  noremap  <c-space>  :call Jump()<CR><Right>
  inoremap <c-space>  <C-O>:call Jump()<CR><Right>
else
  noremap  <Nul>      :call Jump()<CR><Right>
  inoremap <Nul>      <C-O>:call Jump()<CR><Right>
endif

" Marks
noremap gm          m

" Run command, insert result below
nnoremap <leader>c yy0i> <ESC>:r !<C-R>"<CR>

" Filetype mappings
autocmd FileType tex map  <buffer> <Leader>v :w<CR><LocalLeader>lv
autocmd FileType tex imap <buffer> <Leader>v <C-O>:w<CR><C-O><LocalLeader>lv


" -------------- COMMANDS ----------------

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -nargs=? Submit call MarmosetSubmit(<f-args>)
command! Fetch call MarmosetFetch()
command! Long call MarmosetLong()
command! Release call MarmosetRelease()


" -------------- AUTOCMD -----------------

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
augroup QuickFix
  au!
  au QuickFixCmdPost [^l]* nested cwindow
  au QuickFixCmdPost    l* nested lwindow
augroup END

" Jump to the last position when reopening a file
augroup PersistCursorPos
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END


" ---------------------------------------- 
"                PLUGIN OPTIONS 
" ---------------------------------------- 


" -------------- slime -------------------

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": empty($TMUX) ? "" : split($TMUX, ",")[0], "target_pane": ":.2"}


" -------------- tagbar ------------------

nnoremap <silent> <leader>g :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" -------------- LanguageClient ----------

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }
let g:LanguageClient_autoStart = 1
if has('nvim')
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> <C-T> :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
else
  nnoremap <C-T> :Tags<CR>
endif

let g:LanguageClient_diagnosticsDisplay = {
      \ 1: {
      \ "name": "Error",
      \ "texthl": "ALEError",
      \ "signText": "•",
      \ "signTexthl": "ALEErrorSign"
      \ },
      \ 2: {
      \ "name": "Warning",
      \ "texthl": "ALEWarning",
      \ "signText": "•",
      \ "signTexthl": "ALEWarningSign"
      \ },
      \ 3: {
      \ "name": "Information",
      \ "texthl": "LanguageClientInformation",
      \ "signText": "•",
      \ "signTexthl": "ALEInfoSign"
      \ },
      \ 4: {
      \ "name": "Hint",
      \ "texthl": "LanguageClientHint",
      \ "signText": "•",
      \ "signTexthl": "ALEInfoSign"
      \ }
      \ }


" -------------- deoplete ----------------

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_menu_width = -1
let g:deoplete#max_abbr_width = -1
call deoplete#custom#source('neosnippet', 'rank', 9999)
call deoplete#custom#source('buffer', 'rank', 0)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" -------------- neosnippet --------------

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_optional_arguments = 0
imap <expr> <C-F> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_jump_or_expand)" :
      \ deoplete#mappings#close_popup()
smap <expr> <C-F> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_jump_or_expand)" :
      \ deoplete#mappings#close_popup()

" For conceal markers.
if has('conceal')
  set conceallevel=2
endif


" -------------- switch.vim --------------

let g:switch_mapping = "<leader>."


" -------------- auto-pairs --------------

let g:AutoPairsMapCh=0
au FileType rust let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`', '<':'>'}


" -------------- a.vim ------------------- 

map \a :A<CR>


" -------------- vim-dasht --------------- 

" Search API docs for query you type in:
nnoremap <Leader>dk :Dasht<Space>

" Search API docs for word under cursor:
nnoremap <silent> <Leader>dK :call Dasht([expand('<cWORD>'), expand('<cword>')])<Return>

" Search API docs for the selected text:
vnoremap <silent> <Leader>dK y:<C-U>call Dasht(getreg(0))<Return>

let g:dasht_filetype_docsets = {
      \ 'cpp': ['boost', 'c++', '^c$', 'OpenGL', 'OpenCV_C'],
      \ 'html': ['css', 'js', 'bootstrap', 'jquery'],
      \ 'javascript': ['jasmine', 'nodejs', 'grunt', 'gulp', 'jade', 'react'],
      \ 'python': ['(num|sci)py', 'pandas', 'sqlalchemy', 'twisted', 'jinja'],
      \ }


" -------------- fzf --------------------- 

nnoremap <C-P> :Files<CR>
nnoremap <C-G> :Buffers<CR>


" -------------- easymotion --------------

map <LocalLeader> <Plug>(easymotion-prefix)


" -------------- vim-airline -------------

map <F5> :redraw!<CR>:AirlineRefresh<CR>
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


" -------------- nerdtree ----------------

map <C-n> :NERDTreeToggle<CR>


" -------------- completor.vim -----------

let g:completor_completion_delay = 0
let g:completor_disable_buffer = 1


" -------------- vim-startify ------------

let g:ascii = [
      \ '        __',
      \ '.--.--.|__|.--------.',
      \ '|  |  ||  ||        |',
      \ ' \___/ |__||__|__|__|',
      \ ''
      \]
let g:startify_custom_header = map(g:ascii, '"   ".v:val')
let g:startify_session_persistence = 1
let g:startify_list_order = [
      \ ['   Sessions'],
      \ 'sessions',
      \ ['   Directory'],
      \ 'dir',
      \ ['   Bookmarks'],
      \ 'bookmarks',
      \ ['   Recent'],
      \ 'files',
      \ ]
let g:startify_bookmarks = ['~/.dotfiles']


" -------------- vim-easy-align ----------

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

" -------------- vim-merginal ------------

nmap <leader>m :Merginal<CR>


" -------------- vim-easyclip ------------

let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseSubstituteDefaults = 1
nmap ]p          <plug>EasyClipSwapPasteForward
nmap [p          <plug>EasyClipSwapPasteBackwards
map  M           m$


" -------------- tern_for_vim ------------

nnoremap <Leader>t :TernDef<CR>
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


" -------------- ale ---------------------

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
hi! link ALEErrorSign GruvboxRed
hi! link ALEWarningSign GruvboxYellow
let g:ale_sign_column_always = 1
nnoremap gn :ALENext<CR>
nnoremap gN :ALEPrevious<CR>
let g:ale_linters = { 'c': ['cppcheck'], 'rust': []}


" -------------- javascript-libraries ----

let g:used_javascript_libs = 'jquery'


" -------------- clever-f.vim ------------

let g:clever_f_chars_match_any_signs = ';'


" -------------- vimtex ------------------

let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_ignored_warnings = [
    \ 'Underfull',
    \ 'Overfull',
    \ 'specifier changed to',
    \ ]
let g:vimtex_syntax_minted = [
    \ {'lang' : 'c',},
    \ {'lang' : 'cpp',},
    \ ]


" -------------- digraphs.vim ------------

map <leader>di vh<F4>


" -------------- gundo.vim ---------------

nnoremap gu :GundoToggle<CR>


" ----------------------------------------
"                FUNCTIONS
" ----------------------------------------

" -------------- Marmoset ----------------

let g:Course="cs241"

function! MarmosetSubmit(...)
  if a:0 > 0
    let t:Files=a:1
  end
  if !exists("t:Files")
    let t:Files=expand("%")
  end
  if exists("g:Course") && exists("t:Assignment")
    execute "!marmoset submit " . g:Course . " " . t:Assignment . " " . t:Files
  else
    echo "g:Course/t:Assignment not defined! (:h let)"
  end
endfunction

function! MarmosetFetch()
  if exists("g:Course") && exists("t:Assignment")
    execute "!marmoset fetch " . g:Course . " " . t:Assignment
  else
    echo "g:Course/t:Assignment not defined! (:h let)"
  end
endfunction

function! MarmosetLong()
  if exists("g:Course") && exists("t:Assignment")
    execute "!marmoset long " . g:Course . " " . t:Assignment
  else
    echo "g:Course/t:Assignment not defined! (:h let)"
  end
endfunction

function! MarmosetRelease()
  if exists("g:Course") && exists("t:Assignment")
    execute "!marmoset release " . g:Course . " " . t:Assignment
  else
    echo "g:Course/t:Assignment not defined! (:h let)"
  end
endfunction


" -------------- Jump --------------------

function! Jump()
  let chars = ['[', ']', '{', '}', '(', ')', '"', "'", '<', '>', ',', '`', '$']
  let regex = '\V' . join(chars, '\|')
  call search(regex, 'cW')
endfunction
