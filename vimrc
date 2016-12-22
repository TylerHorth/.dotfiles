" ---------------------------------------- 
"                PLUGINS 
" ---------------------------------------- 

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'maralla/completor.vim', { 'do': 'nvm use default; make js' }
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mhinz/vim-startify'
Plug 'vim-ruby/vim-ruby', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-rails', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-bundler', { 'for': [ 'eruby', 'ruby' ] }
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'tomtom/tcomment_vim'
Plug 'nixprime/cpsm', { 'do': 'env PY3=' . (has('python3') ? 'ON' : 'OFF') . ' ./install.sh' }
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
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
Plug 'ternjs/tern_for_vim', { 'do': 'nvm use default; npm install' }
Plug 'sjl/gundo.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-endwise'
Plug 'bufonly.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'dag/vim-fish'
Plug 'AndrewRadev/switch.vim'

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
set grepprg=rg\ --vimgrep\ --no-heading " Use ripgrep instead of grep
set grepformat=%f:%l:%c:%m,%f:%l:%m     " Set grepformat
set splitbelow                          " Default to split below current window
set splitright                          " Default to split on the right of window
set updatetime=250                      " Reduce update time from 4 seconds
set wrap                                " wrap long lines
set shell=bash                          " Tell vim to use bash shell
set nocursorline                        " Don't highlight current line
set ttyfast                             " Speed shit up or something
set whichwrap+=<,>,[,]                  " Line wrap for arrow keys


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
nnoremap <leader>ww :w<CR>
nnoremap <leader>ss :w<CR>
nnoremap <leader>wq :wq<CR>

" normal movement
noremap  gt         H
noremap  gb         L
noremap  gh         25h
noremap  gj         10j
noremap  gk         10k
noremap  gl         25l

" Join lines
nnoremap K          kJ

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
inoremap <C-J>      <Down>
inoremap <C-K>      <Up>
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
noremap  <Nul>      :call Jump()<CR><Right>
inoremap <Nul>      <C-O>:call Jump()<CR><Right>

" Marks
noremap gm          m

" Filetype mappings
autocmd FileType tex map  <buffer> <Leader>v :w<CR><LocalLeader>lv
autocmd FileType tex imap <buffer> <Leader>v <C-O>:w<CR><C-O><LocalLeader>lv


" -------------- COMMANDS ----------------

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

" -------------- switch.vim --------------

let g:switch_mapping = "<leader>."


" -------------- auto-pairs --------------

let g:AutoPairsMapCh = 0


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


" -------------- ctrlp.vim --------------- 

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s --nocolor --nogroup -g ""'
let g:ctrlp_use_caching = 1 
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_lazy_update = 0 
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
nnoremap <C-T> :CtrlPTag<CR>
nnoremap <C-G> :CtrlPBuffer<CR>


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

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


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


" -------------- emmet-vim ---------------

let g:user_emmet_install_global = 1
let g:user_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<C-e>'
imap <leader><Tab> <plug>(emmet-expand-abbr)
map  <leader>u     <plug>(emmet-update-tag)
imap <C-y>d        <plug>(emmet-balance-tag-inward)
imap <C-y>D        <plug>(emmet-balance-tag-outward)
imap <leader>n     <plug>(emmet-move-next)
imap <leader>N     <plug>(emmet-move-prev)
imap <C-y>i        <plug>(emmet-image-size)
imap <C-y>/        <plug>(emmet-toggle-comment)
imap <C-y>j        <plug>(emmet-split-join-tag)
imap <C-y>k        <plug>(emmet-remove-tag)
imap <C-y>a        <plug>(emmet-anchorize-url)
imap <C-y>A        <plug>(emmet-anchorize-summary)
imap <C-y>m        <plug>(emmet-merge-lines)
imap <C-y>c        <plug>(emmet-code-pretty)


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


" -------------- ale ---------------------

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
hi! link ALEErrorSign GruvboxRed
hi! link ALEWarningSign GruvboxYellow
let g:ale_sign_column_always = 1
nnoremap gn :ALENext<CR>
nnoremap gN :ALEPrevious<CR>


" -------------- javascript-libraries ----

let g:used_javascript_libs = 'jquery'


" -------------- vim-gitgutter -----------

let g:gitgutter_sign_column_always = 1


" -------------- clever-f.vim ------------

let g:clever_f_chars_match_any_signs = ';'


" -------------- vimtex ------------------

let g:vimtex_latexmk_options = '-pvc -pdf -synctex=1 -latexoption=-shell-escape'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
let g:completor_tex_omni_trigger =
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'
let g:vimtex_syntax_minted = [
      \ {'lang' : 'c',},
      \ {'lang' : 'cpp',},
      \]


" -------------- digraphs.vim ------------

map <leader>di vh<F4>


" -------------- gundo.vim ---------------

nnoremap gu :GundoToggle<CR>


" -------------- smooth-scroll ----------

let g:ac_smooth_scroll_min_limit_msec = 0
let g:ac_smooth_scroll_fb_sleep_time_msec = 5
let g:ac_smooth_scroll_du_sleep_time_msec = 5


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