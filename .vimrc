"eidtor: paul
"time: 04/28/2020

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif


" base
set nocompatible                " don't bother with vi compatibility
set autoread                    " reload files when changed on disk, i.e.via `git checkout`
set shortmess=atI

set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
set nobackup                    " do not keep a backup file(设置覆盖文件时不保留备份文件)

set novisualbell                " turn off visual bell(表示 Vim 有错误信息时不响铃)
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash
set t_vb=
set timeoutlen=500              " (表示以毫秒计的等待键码或映射的键序列完成的时间)
set history=100		        " keep 50 lines of command line history


" filetype
filetype on			" (文件类型自动检测)
filetype plugin on		" Enable filetype plugins
filetype indent on		" (启用针对不同文件类型的自动缩进功能)

"movment
set scrolloff=5         " keep 5  lines when scrolling(它指定在距离边界多远的地方开始滚动文字)

"show(显示设置)
set ruler		" show the cursor position all the time
set nowrap		" (禁止回绕行)
set number		" show line numbers (显示行号)
set showmode		" display current mode (显示键盘映射表使用情况) 
set showcmd		" display incomplete commands

set showmatch		" jump to matches when entering parentheses(显示括号匹配) 
set matchtime=1		" tenths of a second to show the matching parenthesis(当配置showmatch属性,设置停留在括号的时间长度,单位为1/10秒)
set nocursorline	" (在光标所在行不显示下划线)
set cursorcolumn	" (阴影显示光标所在列)


" indent
set autoindent			" (换新行采用上一行的缩进)
set smartindent			" (智能缩进,会在每个 ’{’ 处新增一级缩进,并在每个 ’}’ 处消减。) 
set shiftround			" (表示缩进列数会自动取整到 ‘shiftwidth’ 选项值的倍数)
set shiftwidth=4		" (使用>>为当前行插入4个空格的缩进)
set tabstop=4			" insert mode tab and backspace use 8 spaces
set softtabstop=4               " insert mode tab and backspace use 4 spaces

"TAB
set expandtab                   " expand tabs to spaces(tab用空格代替,文本中没有真正的制表符)
set smarttab			" (Vim 对每个在缩进行中的制表符使用’shiftwidth’,而对在第一个非空字符后输入的 <Tab> 使用真的制表符)
    
"search(搜索查找)
set hlsearch                    " highlight searches(高亮匹配项)
set incsearch                   " do incremental searching, search as you type(输入字符串的过程中就显示匹配点)
set ignorecase                  " ignore case when searching(查找时忽略大小写)
set smartcase                   " no ignorecase if Uppercase char present
"set wrapscan			" (查找到文件尾自动折返到文件头)


" encoding
set encoding=utf-8		" (设置vim内部字符编码方式为utf-8)
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set fileformats=unix,dos,mac	" (定义文件格式行尾行为的解释顺序)
set formatoptions+=m
set formatoptions+=B

" complete
set completeopt=longest,menu		" (使用相当原始的弹出菜单显示插入模式的补全匹配)
set wildmenu            		" show a navigable menu for tab completion"(状态栏上显示补全匹配)
set wildmode=longest,list,full		" (找到最长的匹配,接着列出所有匹配的文件)
set wildignore=*.o,*~,*.pyc,*.class	" (匹配时要完全忽略有某些扩展名的文件)

" others
set backspace=indent,eol,start  " make that backspace key work the way it should
"set whichwrap+=<,>		" (使<-和->光标键在行首或行尾时可以移到前一行或者后一行)

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"theme
set background=dark		" (设置背景色)
colorscheme solarized		" (设置色彩方案)


"set mark column colors
set statusline=%<%f\%h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\%-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar





" ============================ key map ============================
" leader
let mapleader = ','
let g:mapleader = ','



" 在插入模式下非递归映(为 )<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i




nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
au InsertLeave * set nopaste
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>



" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>
" save
cmap w!! w !sudo tee >/dev/null %

" select all
map <Leader>sa ggVG




"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz



" y$ -> Y Make Y behave like other capitals
map Y y$


"  For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=v
  set selection=exclusive	" ()
  set selectmode=mouse,key	" (鼠标启动可视模式和选择模式)
  "set mousemodel=popup_setpos
  "set clipboard=autoselect
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
