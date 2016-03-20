set nocompatible

" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
    execute 'silent !mkdir -p ~/.vim/plugged'
    execute 'silent !mkdir -p ~/.vim/autoload'
    execute 'silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')


" ---------------------------------------- 
"                PLUGINS 
" ---------------------------------------- 

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
Plug 'vim-ruby/vim-ruby', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-rails', { 'for': [ 'eruby', 'ruby' ] }
Plug 'tpope/vim-bundler', { 'for': [ 'eruby', 'ruby' ] }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'eruby' ] }
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'eruby' ] }
Plug 'tomtom/tcomment_vim'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'lervag/vimtex'
Plug 'moll/vim-node'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'sjl/badwolf'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'

call plug#end()     


" ---------------------------------------- 
"                SETTINGS 
" ---------------------------------------- 

" -------------- COLORSCHEME -------------

colorscheme	badwolf


" -------------- LETS --------------------

let mapleader=","                 " Mapleader            


" -------------- SETS --------------------

set showcmd                       " Show (partial) command in status line.
set showmatch                     " Show matching brackets.
set ignorecase                    " Do case insensitive matching
set smartcase                     " Do smart case matching
set incsearch                     " Incremental search
set autowrite                     " Automatically save before commands like :next and :make
set hidden                        " Hide buffers when they are abandoned
set mouse=a                       " Enable mouse usage (all modes)
set tabstop=2                     " a tab is two spaces
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set number                        " always show line numbers
set shiftwidth=2                  " number of spaces to use for autoindenting
set expandtab                     " Spaces instad of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch                      " highlight search terms
set foldmethod=indent             " Create folds based on syntax
set foldlevelstart=99             " Folds are not closed to start
set pastetoggle=<F2>              " Paste mode
set t_Co=256                      " Use 256 colors
set noshowmode                    " Don't show current mode
set clipboard=unnamed,unnamedplus " Merge system and vim clipboards
set background=dark               " Set background to dark
set grepprg=ag\ --vimgrep\ $*     " Use ag instead of grep
set grepformat=%f:%l:%c:%m        " Set grepformat for ag 
set splitbelow                    " Default to split below current window
set splitright                    " Default to split on the right of window
set updatetime=250                " Reduce update time from 4 seconds


" -------------- MAPS --------------------

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
nnoremap <leader>k O<Esc>j
nnoremap <leader>j o<Esc>k

" New lines from normal mode
inoremap <leader>j <C-O>o
inoremap <leader>k <C-O>O

" Navigation from insert
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" paste from insert
imap <C-p> <C-O>p
imap <C-S-p> <C-O>P

" Long line nav
nnoremap j gj
nnoremap k gk

" Clear search on return
nnoremap <CR> :noh<CR><CR>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Jump to next open/close bracket
nmap <Nul> /[\[\(\<\{\]\)\>\}\"\'\`]<CR>:noh<CR>
imap <Nul> <Esc>/[\[\(\<\{\]\)\>\}\"\'\`]<CR>:noh<CR>a


" -------------- AUTOCMD -----------------

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ---------------------------------------- 
"                PLUGIN OPTIONS 
" ---------------------------------------- 

" -------------- ctrlp.vim --------------- 

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s --nocolor --nogroup -g ""'
let g:ctrlp_use_caching = 1 
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_lazy_update = 0 
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}


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


" -------------- delimitMate -------------

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_smart_matchpairs = 1


" -------------- YouCompleteMe -----------

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = ''
let g:ycm_filepath_completion_use_working_dir = 1
map <leader>fi :YcmCompleter FixIt<CR> 


" -------------- vim-startify ------------

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


" -------------- vim-easymotion ----------

nmap <leader>fa <Plug>(easymotion-jumptoanywhere)


" -------------- vim-easy-align ----------

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" -------------- emmet-vim ---------------

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

let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1 
let g:EasyClipUsePasteToggleDefaults = 0
nmap ]p <plug>EasyClipSwapPasteForward
nmap [p <plug>EasyClipSwapPasteBackwards


" -------------- tern_for_vim ------------

let g:tern_show_argument_hints = 'on_move' 
let g:tern_show_signature_in_pum = 1


" -------------- tern_for_vim ------------

let g:syntastic_javascript_checkers = [ "eslint" ]

let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": [ "ruby", "eruby", "javascript", "coffeescript" ],
      \ "passive_filetypes": [ ] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---------------------------------------- 
"                FUNCTIONS
" ---------------------------------------- 


" -------------- SmartEnter --------------

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


" -------------- Marmoset ----------------

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
