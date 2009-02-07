" no highlight search
map <F2> <ESC>:nohlsearch<CR><ESC><ESC>

" map ctrl+s to save file
map <C-S> <ESC>:w<CR><ESC><ESC>

" map <F3> to toggle paste mode
set pastetoggle=<F3>

" when `paste' is set, filetype indent and autoindent don't work
nnoremap <F4> :set paste<CR>"*p:set nopaste<CR>
nnoremap <F5> :set paste<CR>"+p:set nopaste<CR>
inoremap <F4> <ESC>:set paste<CR>"*p:set nopaste<CR>i
inoremap <F5> <ESC>:set paste<CR>"+p:set nopaste<CR>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex-suite plugin
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open document and put cursor to the last editing position
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

" gui settings
" gui font
set guifont=Consolas\ 11
" gui wide font
" set guifontwide=NSimsun\ 12
" colorscheme evening

function RemoteLaTeX()
    let g:Tex_ViewRule_dvi="xdvi -editor 'gvim --servername \"".expand("%:p")
        \."\" --remote-silent'"
    augr remotelatex
    au!
    augr END
endfunction

colorscheme desert
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set number
" set the line number color to dark cyan
hi LineNr ctermfg=darkcyan ctermbg=black

" miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" combine project window and taglist window
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" quick fix plugin
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

" auto fold 
set completeopt=longest,menu
set fdm=syntax

imap <M-1> <C-O>:hide buffer 1<cr>
imap <M-2> <C-O>:hide buffer 2<cr>
imap <M-3> <C-O>:hide buffer 3<cr>
imap <M-4> <C-O>:hide buffer 4<cr>
imap <M-5> <C-O>:hide buffer 5<cr>
imap <M-6> <C-O>:hide buffer 6<cr>
imap <M-7> <C-O>:hide buffer 7<cr>
imap <M-8> <C-O>:hide buffer 8<cr>
imap <M-9> <C-O>:hide buffer 9<cr>
nmap <M-1> :hide buffer 1<cr>
nmap <M-2> :hide buffer 2<cr>
nmap <M-3> :hide buffer 3<cr>
nmap <M-4> :hide buffer 4<cr>
nmap <M-5> :hide buffer 5<cr>
nmap <M-6> :hide buffer 6<cr>
nmap <M-7> :hide buffer 7<cr>
nmap <M-8> :hide buffer 8<cr>
nmap <M-9> :hide buffer 9<cr>
imap <M-`> <C-O>:hide bnext<cr>
nmap <M-`> :hide bnext<cr>
imap <M-~> <C-O>:hide bprev<cr>
nmap <M-~> :hide bprev<cr>
