syntax on
""" required. this makes vim invoke latex-suite when you open a tex file.
filetype plugin indent on

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



"""" TESTING """""""""
"""" Playing with these settings:

set ignorecase

let g:tex_indent_items = 1
set softtabstop=4 
set shiftwidth=4 
set expandtab
let g:tex_items = '\\bibitem\|\\item\|\\part\|\\question'
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|parts\|questions'


" Double compile tex
map <F10> <leader>ll <leader>ll 

set wildignore+=*.o,*.obj,.git,*.pdf,*.dvi,*.aux,*.gz

"" Medium Mode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! :MediumModeDisable
"nnoremap <leader>h <Esc>:MediumModeToggle<CR>
"
"set undofile
"set undodir^='$HOME/.cache/undo'
let g:ctrlp_clear_cache_on_exit = 0
"
"set dir=~/.cache/swap//,/var/tmp//,/tmp//,.

"" Use <C-L> to clear the highlighting of :set hlsearch.
"if maparg('<C-L>', 'n') ==# ''
"  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
"endif
"
"
"""""" end testing options


" CtrlP is a fuzzyish finder

let g:ctrlp_map = '<c-p>'

" On windows I'm doing the TeXing.
if has("gui_win32")
	let g:ctrlp_working_path_mode = 'c'
	let g:ctrlp_cmd = 'CtrlP C:\Users\john\Dropbox\Documents'
else 
	let g:ctrlp_cmd = 'CtrlP ~/Dropbox/Documents'
	let g:ctrlp_working_path_mode = 'c'
endif

"""""""""""""

" Set the comment string for vim-commentary
autocmd FileType tex set commentstring=\%\ %s


""""""  GUI settings.
colorscheme murphy 

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
au FocusLost * :wa

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


""" todo: decide if I really want these gone.
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar

:set guioptions-=eLR "Stops the stupid Aero Snap unsnapping when you open new tab
		" the above doesn't work! TODO
		" http://stackoverflow.com/questions/13251522/why-does-gvim-resize-and-reposition-itself-after-some-actions

""""" This is now in my vimfiles/ftplugin/tex.vim (left here in case I need to 
"""""   replace my installation.

"" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
"" " can be called correctly.
"set shellslash
""
"" " IMPORTANT: grep will sometimes skip displaying the file name if you
"" " search in a singe file. This will confuse Latex-Suite. Set your grep
"" " program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
""
"" todo FIND OUT IF THIS does anything... like what might be missing...
"" " OPTIONAL: This enables automatic indentation as you type.
"filetype indent on
""
"" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
"" to
"" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"" " The following changes the default filetype back to 'tex':
""let g:tex_flavor='latex'
"
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_ViewRule_pdf = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe'
"let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -interaction=nonstopmode -file-line-error-style $*'
""" (not the -file-line-error-style. via http://linuxwisdom.blogspot.com/2007/08/fixing-latex-suites-jump-to-error.html )
"let g:Tex_IgnoredWarnings = 
"\"Underfull\n".
"\"Overfull\n".
"\"specifier changed to\n".
"\"You have requested\n".
"\"Missing number, treated as zero.\n".
"\"There were undefined references\n".
"\"Citation %.%# undefined\n".
"\"Rerun to get cross-references right.\n".
"\'LaTeX Font Warning:'"
"let g:Tex_IgnoreLevel = 8
"let g:Tex_Folding = 0
"let g:Tex_MultipleCompileFormats = "pdf"
"let g:Tex_GotoError = 1 " <-- Makes \ll go to first error

"
"" Custom LaTeX Environments
"let g:Tex_Env_problem = "\\begin{problem}{0}\<CR><++>\<CR>\\end{problem}<++>"
"let g:Tex_Env_questions = "\\begin{questions}\<CR>\\question[0] <++>\<CR>\\end{questions}<++>"
"let g:Tex_Env_parts = "\\begin{parts}\<CR>\\part <++>\<CR>\\end{parts}<++>"

"""""""""""""""""""" end latex """""""""""""""""

