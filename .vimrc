set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'a.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" mapleader
let mapleader=","

" a.vim
nnoremap \a :A<CR>
let g:alternateNoDefaultAlternate = 1

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
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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
imap <C-_> <Plug>delimitMateS-Tab

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

" Splits
nnoremap <C-j> <C-W>j
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
          \ map(s:filter_header(split(system('fortune | cowsay -f $(ls /usr/share/cows/ | shuf -n1)'), '\n')), '"   ". v:val') + ['']
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
		execute "!marmoset release " . g:Course . " " . t:Assignment
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
