"Set mapleader
let mapleader=","

" 设置编码
set enc=utf-8
" 设置文件编码
set fenc=utf-8
" 设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"自动检测文件类型打开缩进
filetype on
filetype plugin on
filetype indent on
syntax on
set hlsearch

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

" Check Platform
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

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

function! RemoteLaTeX()
    let g:Tex_ViewRule_dvi="xdvi -editor 'gvim --servername \"".expand("%:p")
        \."\" --remote-silent'"
    augr remotelatex
    au!
    augr END
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open document and put cursor to the last editing position
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gui settings
" gui font
set guifont=Consolas\ 11
" gui wide font
" set guifontwide=NSimsun\ 12
" colorscheme evening

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
nmap <leader>wm :WMToggle<cr>

" quick fix plugin
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

" auto fold 
set completeopt=longest,menu
set fdm=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map buffer operation shortcuts
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

"s:查找C语言符号，即查找函数名、宏、枚举值等出现的地方 
nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"g:查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 
nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: 查找调用本函数的函数 
nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: 查找指定的字符串 
nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"e: 查找egrep模式，相当于egrep功能
nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: 查找并打开文件，类似vim的find功能 
nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: 查找包含本文件的文件 
nmap <C-j>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"d: 查找本函数调用的函数 
nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

"MEMO: the convinient command to gen cscope file
"find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files
"cscope -bkq -i cscope.files
"ctags -R

" quick fix option for make,cn,cp
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr> 

filetype on
syntax on
syntax enable                      " enable syntax highlighting

" switch between header and source file
map <leader>sw :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
