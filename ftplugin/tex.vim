" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" todo FIND OUT IF THIS does anything... like what might be missing...
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on

setlocal shiftwidth=4
setlocal tabstop=4


"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'

if has("gui_win32")
	let g:Tex_ViewRule_pdf = 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe'
else 
	let g:Tex_ViewRule_pdf = 'evince'
endif
"let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'lualatex --synctex=1 -interaction=nonstopmode  $*'
let g:Tex_IgnoredWarnings = 
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"There were undefined references\n".
\"Citation %.%# undefined\n".
\"Rerun to get cross-references right.\n".
\'LaTeX Font Warning:'"
let g:Tex_IgnoreLevel = 8
let g:Tex_Folding = 0
let g:Tex_MultipleCompileFormats = "pdf"
let g:Tex_GotoError = 0 " <-- Makes \ll go to first error

" Testing settings: 
let g:Tex_UsePython = 1  " Use Python rather than VimScript for speed
let g:Tex_PromptedEnvironments = 'eqnarray*,tabular,parts,center,\[,$$,align*,solution,solutionorlines,oneparchoices'

"
"" Custom LaTeX Environments
let g:Tex_Env_problem = "\\begin{problem}{0}\<CR><++>\<CR>\\end{problem}<++>"
let g:Tex_Env_questions = "\\begin{questions}\<CR>\\question[0] <++>\<CR>\\end{questions}<++>"
let g:Tex_Env_parts = "\\begin{parts}\<CR>\\part <++>\<CR>\\end{parts}<++>"
let g:Tex_Env_solutionorlines = "\\begin{solutionorlines}[.75in]\<CR><++>\<CR>\\end{solutionorlines}<++>"
let g:Tex_Env_solution = "\\begin{solution}[1pt]\<CR><++>\<CR>\\end{solution}<++>"
let g:Tex_Env_bmatrix = "\\begin{bmatrix}[<++>]\<CR><++>\<CR>\\end{bmatrix}<++>"
let g:Tex_Env_pmatrix = "\\begin{pmatrix}[<++>]\<CR><++>\<CR>\\end{pmatrix}<++>"
"""" end latex

