" TODO
" latex suite is overriding my f1 settings
" Some settings need to be moved to the tex ftplugin 
" My changes need to be pushed to git

syntax enable
""" required. this makes vim invoke latex-suite when you open a tex file.
filetype plugin on
filetype indent on

set nocompatible


"""""" Vim Packages 
call pathogen#infect()
call pathogen#helptags()


" Spelling with custom dictionary. Add using 2zg
set spelllang=en_us
if has("gui_win32")
    set spellfile=~/vimfiles/spell/en.latin1.add
    set spellfile+=~/vimfiles/spell/latexjargon.latin1.add
else 
    set spellfile=~/.vim/spell/en.latin1.add
    set spellfile+=~/.vim/spell/latexjargon.latin1.add
endif


" Testing settings
set showmatch " Show matching bracket when selected
set lazyredraw " Don't redraw when macros execute
set history=500 
set autoindent

" Prevent latex-suite from messing up indenting when using
" the mixed-interval notation (blah, blah]
"  -- a bettter solution is to fix the indent/tex.vim
let g:tex_indent_brace = 0

" Return to last edit position when opening files
" This is nice... but I could always just `" if I remember
" ... also read more of Drew Neil's book...
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=% " TODO < this seems neat. Any reason not to?
" Reason: I open like a dozen tex files. I don't care about them.

" Get rid of the solarized menu
let g:solarized_menu=0
" And maybe get rid of all the menus entirely (if happy, move to bottom of
" .vimrc
set guioptions-=m

" My LaTeX documents all have tons of trailing whitespace, and I don't care.
" ... ask airline to not tell me about it.
let g:airline#extensions#whitespace#enabled = 0
" let g:airline_enable_branch = 1
" let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
" let g:airline_section_b = '%{airline#extensions#branch#get_head()}'

" function Override(...)
"     call a:1.add_section('StatusLine', '%{airline#extensions#branch#get_head()}')
"     return 1
" endfunction
" call airline#add_statusline_func('Override')

" Taken from sensible: "
set smarttab
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu

let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif
if exists('+undofile')
  set undofile
endif

set backspace=indent,eol,start



"""" TESTING """""""""
"""" Playing with these settings:

set ignorecase

let g:tex_indent_items = 1
set softtabstop=4 
set shiftwidth=4 
set expandtab
set linebreak
set showbreak=..
let g:tex_items = '\\bibitem\|\\item\|\\part\|\\question'
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|parts\|questions'


" Double compile tex
map <F10> <leader>ll <leader>ll 

set wildignore+=*.o,*.obj,.git,*.pdf,*.dvi,*.aux,*.gz,*.log
let g:ctrlp_clear_cache_on_exit = 0

"""""" end testing options


" CtrlP is a fuzzyish finder

let g:ctrlp_map = '<c-p>'

if has("gui_win32")
    let g:ctrlp_working_path_mode = 'c'
    " The windows path now has a symbolic link to dropbox docs
    let g:ctrlp_cmd = 'CtrlP C:\Users\john\Documents\Fall2013'
else 
    let g:ctrlp_cmd = 'CtrlP ~/Documents/Fall2013'
    let g:ctrlp_working_path_mode = 'c'
endif

"""""""""""""

" Move to the tex ftplugin

" Set the comment string for vim-commentary
autocmd FileType tex set commentstring=\%\ %s


""""""  GUI settings.
set background=dark
colorscheme solarized 
let g:airline_theme='solarized'

if has("gui_running")
    if has("gui_gtk2") 
        set guifont=Inconsolata\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h12:cANSI
        "set guifont=Terminus
    endif
endif

"Prevent the mouse from changing cursor position when regaining focus
augroup NO_CURSOR_MOVE_ON_FOCUS
    au!
    au FocusLost * let g:oldmouse=&mouse | set mouse=
    au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

" Definitely keep this so it doesn't beep like a ninja
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Like TextMate, if we lose focus, save everything
"au FocusLost * :wa

"""""""""""


" This changes directory automatically when a file is opened...
autocmd BufEnter * silent! lcd %:p:h


" Disable page up/down (annoying on AspireOne), and F1
" F1 is way to close to Esc, and page up/down are close to shift...
map <F1> <Esc> 
imap <F1> <Esc>
nmap <F1> <Esc>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nmap <PageUp> <nop>
nmap <PageDown> <nop>
" Note that latex-suite seems to override my F1 changes...

" Guioptions need to be removed one at a time
set guioptions-=T 
set guioptions-=r 
set guioptions-=L 
