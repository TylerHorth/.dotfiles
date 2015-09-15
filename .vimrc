" mapleader
let mapleader=","

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
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
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
" set smarttab            " insert tabs on the start of a line according to
		        "    shiftwidth, not tabstop
set hlsearch            " highlight search terms

" Paste mode
set pastetoggle=<F2>
" Redraw/refresh
map <F5> :redraw!<CR>:AirlineRefresh<CR>

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ss :w<CR>

" New lines from normal mode
nmap <leader>k O<Esc>j
nmap <leader>j o<Esc>k

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

" Fuck Shift
"nnoremap ; 

" Colorscheme
let g:rehash256 = 1
colorscheme	molokai
hi MatchParen cterm=none ctermbg=234 ctermfg=202

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()
Helptags

" Airline
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme = 'powerlineish'

" auto pair
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutJump = '<C-_>'

" delimitMate
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 1
let delimitMate_smart_matchpairs = 1
imap <C-_> <Plug>delimitMateS-Tab

" Visualmode repaste
xnoremap <leader>p "_dP"

" c.vim
let g:C_Ctrl_j = 'off'
let g:C_CCompiler = 'clang'
let g:C_CFlags = '-O1 -g -c -fno-omit-frame-pointer -fsanitize=address -std=c99'
let g:C_LFlags = '-O1 -g -Wall -fno-omit-frame-pointer -fsanitize=address -std=c99'

" Splits
nnoremap <C-j> <C-W>j
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Marmoset
function! MarmosetSubmit(...)
	if a:0 > 0
		let ignore = a:1
	else 
		let ignore = ""
	end
	let &wig = "*test_*,*tests*,*.o,*_exe*" . ignore
	set wig?
	let l:filePaths = substitute(globpath('%:p:h','**'), "\n", " ", "g")
	set wig=
	let l:pathPieces = split(l:filePaths, "/")
	let l:assignment = l:pathPieces[3] . substitute(l:pathPieces[4], "q","P", "")
	execute "!marmoset submit cs136 " . l:assignment . " " . l:filePaths
endfunction

function! MarmosetResults()
	set wig=*test*,*.o,*_exe*
	let l:filePaths = substitute(globpath('%:p:h','*'), "\n", " ", "g")
	set wig=
	let l:pathPieces = split(l:filePaths, "/")
	let l:assignment = l:pathPieces[3] . substitute(l:pathPieces[4], "q","P", "")
	execute "!marmoset long cs136 " . l:assignment
endfunction

command! -nargs=? Submit call MarmosetSubmit(<f-args>)
command! Results call MarmosetResults()

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

command! CompileDir call CompileDir()
command! RunDir call RunDir()
map <F7> :CompileDir<CR>
map <F8> :w<CR>:RunDir<CR>
