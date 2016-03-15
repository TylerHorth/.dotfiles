set nocompatible

" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
    execute 'silent !mkdir -p ~/.vim/plugged'
    execute 'silent !mkdir -p ~/.vim/autoload'
    execute 'silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Raimondi/delimitMate'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-complete' }
Plug 'rdnetto/YCM-Generator', { 'for': [ 'c', 'cpp' ], 'branch': 'stable' }
Plug 'mhinz/vim-startify'
Plug 'a.vim', { 'for': [ 'c', 'cpp' ] }
Plug 'vim-ruby/vim-ruby', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-rails', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-bundler', { 'for': [ 'eruby', 'ruby' ] }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'eruby' ] }
Plug 'c.vim', { 'for': [ 'c', 'cpp' ] }
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'eruby' ] }
Plug 'tomtom/tcomment_vim'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-ragtag'

call plug#end()     

" mapleader
let mapleader=","

set noshowmode
set clipboard="unnamed"

" buffer nav
nnoremap L :bn<CR>
nnoremap H :bN<CR>
nnoremap J gT
nnoremap K gt
nnoremap <leader>qq :bd<CR>
nnoremap <leader>qw :q<CR>
nnoremap <leader>qa :qa<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ww :w<CR>
nmap <silent> <leader>ss :w<CR>
nmap <silent> <leader>wq :wq<CR>

" New lines from normal mode
nmap <leader>k O<Esc>j
nmap <leader>j o<Esc>k

" Line up / Line down from insert
inoremap <C-J> <C-O>o
inoremap <C-K> <C-O>O

" paste from insert
imap <C-p> <C-O>p
imap <C-S-p> <C-O>P

" ag instead of grep
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" emmet
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

" ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor --nogroup --hidden',
  \ 'ignore': 1
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.bak$|\.swp$|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_use_caching = 1 
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_lazy_update = 0 
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Easymotion shortcuts
nmap <leader>fa <Plug>(easymotion-jumptoanywhere)

" the main function
function! SmartEnter()
  " beware of the cmdline window
  if &buftype == "nofile"
    return "\<CR>"
  endif

  " get the character on the left of the cursor
  let previous = getline(".")[col(".")-2]

  " get the character on the right of the cursor
  let next     = getline(".")[col(".")-1]

  " do the right thing
  if previous ==# "{"
    return PairExpander(previous, "}", next)
  elseif previous ==# "["
    return PairExpander(previous, "]", next)
  elseif previous ==# "("
    return PairExpander(previous, ")", next)
  elseif previous ==# ">"
    return TagExpander(next)
  else
    return "\<CR>"
  endif
endfunction

" expands {}, (), []
function! PairExpander(left, right, next)
  let next     = getline(".")[col(".")-1]

  " do the right thing
  if previous ==# "{"
    return PairExpander(previous, "}", next)
  elseif previous ==# "["
    return PairExpander(previous, "]", next)
  elseif previous ==# "("
    return PairExpander(previous, ")", next)
  elseif previous ==# ">"
    return TagExpander(next)
  else
    return "\<CR>"
  endif
endfunction

" expands {}, (), []
function! PairExpander(left, right, next)
  let pair_position = searchpairpos(a:left, "", a:right, "Wn")
  if a:next !=# a:right && pair_position[0] == 0
    return "\<CR>" . a:right . "\<C-o>==\<C-o>O"
  elseif a:next !=# a:right && pair_position[0] != 0 && indent(pair_position[0]) != indent(".")
    return "\<CR>" . a:right . "\<C-o>==\<C-o>O"
  elseif a:next ==# a:right
    return "\<CR>\<C-o>==\<C-o>O"
  else
    return "\<CR>"
  endif
endfunction

" expands <tag></tag>
function! TagExpander(next)
  if a:next ==# "<" && getline(".")[col(".")] ==# "/"
    if getline(".")[searchpos("<", "bnW")[1]] ==# "/" || getline(".")[searchpos("<", "bnW")[1]] !=# getline(".")[col(".") + 1]
      return "\<CR>"
    else
      return "\<CR>\<C-o>==\<C-o>O"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> SmartEnter()

" vim easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" a.vim
nnoremap \a :A<CR>
let g:alternateNoDefaultAlternate = 1

" Merginal
nmap <leader>m :Merginal<CR>

" Rails
" inoremap <leader><leader> <%  %><C-\><C-O>3h
" inoremap <leader>. <%=  %><C-\><C-O>3h
" inoremap <leader># <%#  %><C-\><C-O>3h

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set tabstop=2           " a tab is two spaces
set backspace=indent,eol,start
                        " allow backspacing over everything in insert mode
"set autoindent          " always set autoindenting on
"set copyindent          " copy the previous indentation on autoindenting
set number              " always show line numbers
set shiftwidth=2        " number of spaces to use for autoindenting
set expandtab						" Spaces instad of tabs
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
" set smarttab            " insert tabs on the start of a line according to
		        "    shiftwidth, not tabstop
set hlsearch            " highlight search terms
set foldmethod=indent " Create folds based on syntax
set foldlevelstart=99 " Folds are not closed to start
set pastetoggle=<F2> " Paste mode

" Redraw/refresh
map <F5> :redraw!<CR>:AirlineRefresh<CR>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Change cursor when changing modes
if has("autocmd")
	" Change cursor
  "au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  " Redraw screen on window focus
"  au FocusGained * :redraw!
endif

" Unlock 256 colors
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" Long line nav
nnoremap j gj
nnoremap k gk

" Colorscheme
colorscheme monokai
let g:rehash256 = 1
colorscheme	molokai
hi MatchParen cterm=none ctermbg=234 ctermfg=202

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Airline
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme = 'powerlineish'

" delimitMate
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_smart_matchpairs = 1
let g:ycm_key_invoke_completion = ''
imap <Nul> <Plug>delimitMateS-Tab

" Visualmode repaste
xnoremap <leader>p "_dP"

" c.vim
let g:C_Ctrl_j = 'off'
let g:C_CExtension = 'c'
let g:C_CCompiler = 'clang'
let g:C_CFlags = '-O1 -g -c -fno-omit-frame-pointer -fsanitize=address -std=c99'
let g:C_LFlags = '-O1 -g -Wall -fno-omit-frame-pointer -fsanitize=address -std=c99'
let g:C_CplusCompiler = 'g++'
let g:C_VimCompilerName = 'g++'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data = ['&filetype']
" Apply fixit
map <leader>fi :YcmCompleter FixIt<CR> 

" Clear search on return
nnoremap <CR> :noh<CR><CR>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Sessions
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

" Startify
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_session_persistence = 1
let g:startify_custom_header =
          \ map(s:filter_header(split(system("bash -c 'fortune | cowsay -f $(ls /usr/share/cows/ | shuf -n1)'"), '\n')), '"   ". v:val') + ['']
let g:startify_list_order = [
            \ ['   Bookmarks'],
            \ 'bookmarks',
            \ ['   Sessions'],
            \ 'sessions',
            \ ]
let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc']

" Marmoset
let g:Course="cs246"

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
	else
		echo "g:Course/t:Assignment not defined! (:h let)"
	end
endfunction

command! -nargs=? Submit call MarmosetSubmit(<f-args>)
command! Fetch call MarmosetFetch()
command! Long call MarmosetLong()
command! Release call MarmosetRelease()

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Compile Directory
function! CompileDir()
	set wig=*.h,*_exe*,tests,*.txt
	let l:filePaths = substitute(globpath('%:p:h','*'), "\n", " ", "g")
	set wig=
	let l:command1 = "!clang " . g:C_LFlags . " " .  l:filePaths . " -o " . expand('%:p:r') . "_exe"
	execute l:command1
endfunction

function! RunDir()
	execute "!" . expand('%:p:r') . "_exe"
endfunction

function! RunFile()
	execute "silent !chmod u=rwx " . expand('%:p')
	execute "!" . expand('%:p')
endfunction

command! CompileDir call CompileDir()
command! RunDir call RunDir()
command! RunFile call RunFile()
map <F7> :CompileDir<CR>
map <F8> :w<CR>:RunDir<CR>
map <leader>r :w<CR>:RunFile<CR>
