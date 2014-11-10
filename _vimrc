" ********************* Vimrc Config files for Vim And MacVIM **************
" Author: Handaoliang <handaoliang@gmail.com>
" Create Date:  2010-04-20 10:20:22
" Last Change:  2014-10-31 19:49:30
" Encoding: UTF-8.
" CopyRights (c) www.handaoliang.com All Rights Reserved.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       全局设定                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置颜色主题，先注释掉使用默认的。
" colorscheme darkburn
" 主题颜色，远程终端不适宜使用颜色主题。
" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme molokai


" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 设置TAB为4个空格。
set shiftwidth=4
set expandtab
set softtabstop=4
set tabstop=4

"""""""""""""""""""针对MacVIM的设置"""""""""""""""""""
if has ("mac")
    " 设置显示字体
    set guifont=YaHei\ Mono:h13

    " 窗口相关。
    winpos 50 50
    set lines=48 columns=180
    colo desert
endif
"""""""""""""""""""针对MacVIM的设置"""""""""""""""""""

" 编码设置
set termencoding=UTF-8
set encoding=UTF-8
set fileencoding=UTF-8
language zh_CN.UTF-8

"设置快速编辑.vimrc文件 ,e 编辑.vimrc
map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>

" 设置*.do的文件使用php语法文件。*.tpl使用html语法文件。
au BufRead,BufNewFile *.do set filetype=php
au BufRead,BufNewFile *.tpl set filetype=html

" 映身F8键给Jsbeautify插件。这个得安装JsBeautify插件。
" nnoremap <F8> :call JsBeautify()<CR>

"保存.vimrc文件后会自动调用新的.vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

" 设定解码，编译的时候需要加multi_byte支持。
if has("multi_byte")
    " When 'fileencodings' starts with 'ucs-bom', don't do this manually
    "set bomb
    set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
    " CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
        set encoding=utf-8
        set termencoding=utf-8
        if &fileencoding == ''
            set fileencoding=utf-8
        endif
    elseif v:lang =~ "^zh_TW"
        " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
        set encoding=euc-tw
        set termencoding=euc-tw
        if &fileencoding == ''
            set fileencoding=euc-tw
        endif
    elseif v:lang =~ "^ja_JP"
        " Japanese, on Unix euc-jp, on MS-Windows cp932
        set encoding=euc-jp
        set termencoding=euc-jp
        if &fileencoding == ''
            set fileencoding=euc-jp
        endif
    elseif v:lang =~ "^ko"
        " Korean on Unix euc-kr, on MS-Windows cp949
        set encoding=euc-kr
        set termencoding=euc-kr
        if &fileencoding == ''
            set fileencoding=ecu-kr
        endif
    endif
    " Detect UTF-8 locale, and override CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
    endif
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

" 自动格式化设置
filetype indent on
set autoindent
set smartindent

" 设置备份及备份目录。
set backspace=indent,eol,start

" 禁止生成临时文件
set nobackup
set noswapfile

" 如果没有设定禁止生成临时文件，那么要指定一下目录。
" 备份文件夹。
" set backupdir=~/.vim/backup_files

" 指定SWAP文件目录，以免当前目录下有SWAP文件
" if has("win32") || has("win64")
"     set directory=$TMP
" else
"     set directory=~/TempDir/vim_swap_files
" end


" 设置自动切换目录。
" set autochdir

" history文件中需要记录的行数，恢复必须用到。
set history=1024

" 共享外部剪贴板
set clipboard+=unnamed

" 显示未完成命令
set showcmd

" 侦测文件类型
filetype on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 语法高亮
syntax on

" 设置不兼容模式
set nocp

" 不要生成swap文件
setlocal noswapfile

" 当buffer被丢弃时隐藏
set bufhidden=hide

" 光标上下两侧最少保留的屏幕行数
set scrolloff=7

" C++头文件识别
au BufEnter /usr/include/c++/* setf cpp
au BufEnter /usr/include/g++-3/* setf cpp

" GNU标准
au BufEnter /usr/* call GnuIndent()

" 设置非粘贴模式
set nopaste

" 设置自动粘贴功能。
set pastetoggle=<F3>

" tab宽度
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4

" C/C++注释
set comments=://

" 修正自动C式样注释功能
set comments=s1:/*,mb:*,ex0:/

" 保存文件格式
set fileformats=unix,dos

" 文件被其他程序修改时自动载入
set autoread

" 高亮字符，让其不受100列限制
" highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
" match OverLength '\%101v.*'

" highlight CursorLine guibg=lightblue guifg=black ctermbg=lightgray ctermfg=black
" highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black

" 总是显示状态行
set laststatus=2

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=[%n]%<%f%y%h%m%r%=[%l,%v]\ [%{&ff},%Y]\ [%b\ 0x%B]\ %l\ of\ %L,%c%V\ Page\ %N\ %P
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %l\ of\ %L,%c%V\ Page\ %N\ %P
" set statusline=[%n]%F%<%f%y%h%m%r%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [%{strftime(\"%Y-%m-%d\ %H:%M\")}]\ [POS=%l,%v]\ [%p%%]\ %l\ of\ %L,%c%V\ Page\ %N\ %P
" set statusline=[%n]%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" indent对齐线插件
let g:indent_guides_guide_size=1

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界，
" 这个看自己喜欢，允许的话移动光标时会从上一行跳到下一行。
" set whichwrap+=<,>,h,l

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 启动的时候不显示那个援助索马里儿童的提示
" set shortmess=atI

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

:au! Cursorhold
:match none

" 设置命令行高度为2行
set cmdheight=1

" 命令行补全
set wildmenu
" 自动补全( { [ < 这几个符号。
" :inoremap ( ()<ESC>i
" :inoremap ) <c-r>=ClosePair(')')<CR>
" :inoremap { {}<ESC>i
" :inoremap } <c-r>=ClosePair('}')<CR>
" :inoremap [ []<ESC>i
" :inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i
" :inoremap > <c-r>=ClosePair('>')<CR>


"inoremap ( ()<ESC>i
inoremap ( <c-r>=OpenPair('(')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {}<ESC>i
inoremap { <c-r>=OpenPair('{')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
inoremap [ <c-r>=OpenPair('[')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
inoremap < <c-r>=OpenPair('<')<CR>
inoremap > <c-r>=ClosePair('>')<CR>

" 引号的自动输入。
inoremap ' <c-r>=CompleteQuote("'")<CR>
inoremap " <c-r>=CompleteQuote('"')<CR>


" 打开文件时，总是跳到退出之前的光标处
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"允许使用ftplugin目录下的文件类型特定脚本
filetype plugin on

"允许使用indent目录下的文件类型缩进
filetype indent on

" 设置以缩进的方式自动折叠和设置快捷方式，用空格键来开关折叠
" set foldenable
" set foldmethod=manual
" set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 打开折叠
" map <F3> zO
" 关闭折叠
map <F4> zc
" 打开所有折叠
map <F5> zR
" 关闭所有折叠
map <F6> zM

" 保存代码文件前自动修改最后修改时间
" au BufWritePre *.sh           call TimeStamp('#')
" au BufWritePre .vimrc,*.vim   call TimeStamp('"')
" au BufWritePre *.c,*.h        call TimeStamp('//')
" au BufWritePre *.cpp,*.hpp    call TimeStamp('//')
" au BufWritePre *.cxx,*.hxx    call TimeStamp('//')
" au BufWritePre *.java         call TimeStamp('//')
" au BufWritePre *.rb           call TimeStamp('#')
" au BufWritePre *.py           call TimeStamp('#')
" au BufWritePre Makefile       call TimeStamp('#')
" au BufWritePre *.php        call TimeStamp('<?php //', '?>')
" au BufWritePre *.html,*htm      call TimeStamp('<!--', '-->')

" C/C++的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!make"
exec "! ./%<"
endfunc

" shell script运行
map <F6> :call CompileRunSH()<CR>
func! CompileRunSH()
exec "w"
exec "!chmod a+x %"
exec "!./%"
endfunc

" python运行
map <F7> :call CompileRunPyhton()<CR>
func! CompileRunPyhton()
exec "w"
exec "!chmod a+x %"
exec "!./%"
endfunc

" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()


" 在被分割的窗口间显示空白，便于阅读
" set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        搜索和匹配                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=3

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set nohlsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
" Tab补全时忽略这些忽略这些
set wildignore=*.o,*.obj,*.bak,*.exe
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

"搜索出之后高亮关键词
set hlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch


nmap <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        CTags的设定                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 增强检索功能
set tags=./tags,./../tags,./**/tags,/usr/include/tags


" 按照名称排序
let Tlist_Sort_Type = "name"

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 压缩方式
let Tlist_Compart_Format = 1

" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1

" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0

" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        快捷键映射                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置其他快捷键
map <F7> :vsplit<ENTER>:edit `pwd`<ENTER>i
"F7 打开左侧垂直窗口选择待编辑的文件

" 自动完成的缩进。
if has("autocmd")
    " if has("gui")
    "   autocmd WinLeave * set nocursorline nocursorcolumn
    "   autocmd WinEnter * set cursorline cursorcolumn
    " else
    "   autocmd WinLeave * set nocursorline nocursorcolumn
    "   autocmd WinEnter * set cursorline nocursorcolumn
    " endif

    " Enable file type detection.

    " load view saved by the mkview command
    autocmd FileType * loadview
    autocmd FileType * set noexpandtab
    " autocmd BufWinEnter * loadview

    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " In text files, always limit the width of text to 78 characters
    autocmd BufEnter *.txt set filetype=text textwidth=78 expandtab shiftwidth=4 softtabstop=4
    autocmd FileType text set textwidth=78 expandtab softtabstop=4
    autocmd FileType sh set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType php set shiftwidth=4 expandtab softtabstop=4 dictionary=~/.vim/dict/php.dict
    autocmd FileType html set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType xml set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType javascript set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType python set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType ruby set shiftwidth=2 expandtab softtabstop=2
    autocmd FileType eruby set shiftwidth=2 expandtab softtabstop=2
    autocmd FileType sql set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType go set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType lua set shiftwidth=4 expandtab softtabstop=4
    autocmd FileType _vimrc,.vimrc,*.vim set shiftwidth=4 expandtab softtabstop=4

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \   execute "normal g`\"" |
              \ endif

    augroup prog
        " Remove all cprog autocommands
        autocmd!

        " When starting to edit a file:
        "   For C and C++ files set formatting of comments and set C-indenting on.
        "   For other files switch it off.
        "   Don't change the order, it's important that the line with * comes first.
        autocmd FileType *      set formatoptions=tcoql nocindent comments&

        " autocmd BufWinLeave *.sh,*.c,*.cpp,*.perl,*.py mkview
        autocmd BufWinEnter *.sh,*.c,*.cpp,*.perl,*.py silent loadview

        function! CleverTab()
            if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
            else
                return "\<C-N>"
        endfunction
        autocmd FileType c,cpp  noremap! <S-Tab> <C-R>=CleverTab()<CR>
        autocmd FileType c,cpp  noremap! <C-]> <C-X><C-]>
        autocmd FileType c,cpp  noremap! <C-F> <C-X><C-F>
        autocmd FileType c,cpp  noremap! <C-D> <C-X><C-D>
        autocmd FileType c,cpp  noremap! <C-L> <C-X><C-L>

        autocmd FileType c,cpp,sh,perl,python set fileformat=unix

        autocmd FileType sh     set formatoptions=croql cindent comments=b:#
        autocmd FileType c,cpp  set expandtab shiftwidth=4 softtabstop=4
        autocmd FileType c,cpp  set formatoptions=croql autoindent cindent smartindent comments=sr:/*,mb:*,el:*/,://
        autocmd FileType c,cpp  set foldmethod=marker foldmarker=--fb--{{{,--fe--}}} commentstring=\ //\ %s
        autocmd FileType c,cpp  set foldmethod=marker foldmarker={,} commentstring=\ //\ %s
        autocmd FileType perl   set formatoptions=croql cindent comments=b:#
        autocmd FileType python set foldmethod=indent formatoptions=croql cindent comments=b:#
        autocmd FileType javascript  set formatoptions=croql autoindent cindent smartindent comments=sr:/*,mb:*,el:*/,:// foldmethod=marker foldmarker={,}
        autocmd FileType javascript  set formatoptions=croql autoindent cindent smartindent comments=sr:/*,mb:*,el:*/,://
    augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      PYTHON 相关的设置                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python 文件的一般设置，比如不要 tab 等
"设置自动缩进为4,插入模式里: 插入 <Tab> 时使用合适数量的空格。
"要插入实际的制表，可用 CTRL-V<Tab>  
autocmd FileType python setlocal expandtab | setlocal shiftwidth=4 | setlocal softtabstop=4 | setlocal textwidth=76

"pydiction插件设置(需要安装pydiction插件)
"设置python的字典路径
let g:pydiction_location = '~/.vim/skeleton/pydict/complete-dict'
"设置pydict的菜单高度
let g:pydiction_menu_height = 10   

"Python Unittest 的一些设置
"在编写 Python 代码及 unittest 测试时不需要离开 vim
"键入 :make 或者点击 gvim 工具条上的 make 按钮就自动执行测试用例
autocmd FileType python compiler pyunit
autocmd FileType python setlocal makeprg=python\ ~/.vim/skeleton/alltests.py
autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %

" 自动使用新文件模板(需要提前准备skeleton相关文件)
" autocmd BufNewFile test*.py 0r ~/.vim/skeleton/test.py
" autocmd BufNewFile alltests.py 0r ~/.vim/skeleton/alltests.py
" autocmd BufNewFile wx*.py 0r ~/.vim/skeleton/wxskeleton.py
" autocmd BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py

" 设置= + - * 前后自动空格
" 设置,后面自动添加空格

" au FileType python inoremap <buffer>= <c-r>=EqualSign('=')<CR>
" au FileType python inoremap <buffer>+ <c-r>=EqualSign('+')<CR>
" au FileType python inoremap <buffer>- <c-r>=EqualSign('-')<CR>
" au FileType python inoremap <buffer>* <c-r>=EqualSign('*')<CR>
" au FileType python inoremap <buffer>/ <c-r>=EqualSign('/')<CR>
" au FileType python inoremap <buffer>> <c-r>=EqualSign('>')<CR>
" au FileType python inoremap <buffer>< <c-r>=EqualSign('<')<CR>
" au FileType python inoremap <buffer>: <c-r>=Swap()<CR>
" au FileType python inoremap <buffer>, ,<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       内置函数定义                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"实现括号，引号等的自动配对后防止重复输入）
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! OpenPair(char)
    let PAIRs = {
                \ '{' : '}',
                \ '[' : ']',
                \ '(' : ')',
                \ '<' : '>'
                \}
    let ol = len(split(getline('.'), a:char, 1))-1
    let cl = len(split(getline('.'), PAIRs[a:char], 1))-1
    if ol==cl
        return a:char . PAIRs[a:char] . "\<Left>"
    else
        return a:char
    endif
endfunction

function! CompleteQuote(quote)
    let ql = len(split(getline('.'), a:quote, 1))-1
    " a:quote length is odd.
    if (ql%2)==1
        return a:quote
    elseif getline('.')[col('.') - 1] == a:quote
        return "\<Right>"
    else
        return a:quote . a:quote . "\<Left>"
    endif
endfunction

"
"函数后面加上！是防止vimrc文件重新载入时报错
"实现光标位置自动交换:) -->  ):
function! Swap()
    if getline('.')[col('.') - 1] =~ ")"
        return "\<ESC>la:"
    else
        return ":"
    endif
endf
"
"实现+-*/前后自动添加空格，逗号后面自动添加空格，适用python
"支持+= -+ *= /+格式
function! EqualSign(char)
    if a:char  =~ '='  && getline('.') =~ ".*("
        return a:char
    endif 
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]

    if ex1 =~ "[-=+><>\/\*]"
        if ex2 !~ "\s"
            return "\<ESC>i".a:char."\<SPACE>"
        else
            return "\<ESC>xa".a:char."\<SPACE>"
        endif 
    else
        if ex2 !~ "\s"
            return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
        else
            return a:char."\<SPACE>\<ESC>a"
        endif 
    endif
endf
"
"SwitchToBuf()实现它在所有标签页的窗口中查找指定的文件名，如果找到这样一个窗口，
"就跳到此窗口中；否则，它新建一个标签页来打开vimrc文件
"上面自动编辑.vimrc文件用到的函数
function! SwitchToBuf(filename)
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
    exec bufwinnr . "wincmd w"
        return
    else
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Last change用到的函数，返回时间，能够自动调整位置
function! TimeStamp(...)
    let sbegin = ''
    let send = ''
    if a:0 >= 1
        let sbegin = a:1.'\s*'
    endif
    if a:0 >= 2
        let send = ' '.a:2
    endif
    let pattern =  'Last Change: .\+'
                \. send
    let pattern = '^\s*' . sbegin . pattern . '\s*$'
    let now = strftime('%Y-%m-%d %H:%M:%S',
                \localtime())
    let row = search(pattern, 'n')
    if row  == 0
        let now = a:1 .  ' Last Change:  '
                    \. now . send
        call append(2, now)
    else
        let curstr = getline(row)
        let col = match( curstr , 'Last')
        let spacestr = repeat(' ',col - 1)
        let now = a:1 . spacestr . 'Last Change:  '
                    \. now . send
        call setline(row, now)
    endif
endfunction


"=========================== Vundle ===============================
"marik/Vundle.vim是目前被推荐次数更多的Vim插件管理器，超过了pathogen。
"这里我们 就用vundle来作为Vim的插件管理工具。
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" 安装Vim-Go插件，如果没有这个插件，则在VIM内执行：PluginInstall
Plugin 'fatih/vim-go'

" 安装YCM(Your Complete Me)
Plugin 'Valloric/YouCompleteMe'

" 安装 UltiSnips，Vim-go默认是用ultisnips引擎插件，但这个插件需要单独安装。
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"========================== Vundle ================================

" ============================= GO Setting ========================

" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

au BufWritePre *.go call AutoImportPackage()

function! AutoImportPackage()
endfunction
" ============================= GO Setting ========================
