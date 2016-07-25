set nocompatible                " be iMproved
filetype off                    " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'vim-jp/ctags'
Plugin 'isRuslan/vim-es6'
Plugin 'taglist.vim'
Plugin 'a.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Plugin 'Valloric/YouCompleteMe'
" 自动补全
" Plugin 'vim-multiple-cursors'
" [sd]
" ctrl + m 开始选择
" ctrl + p 向上取消
" ctrl + x 跳过
" esc   退出
Plugin 'kien/rainbow_parentheses.vim'
" 括号颜色
Plugin 'scrooloose/nerdtree'
" [sd]
"	,n  打开 关闭树形目录结构
"   在nerdtree窗口常用操作：(小写当前，大写root)
"   x.......收起当前目录树
"   X.......递归收起当前目录树
"   r.......刷新当前目录
"   R.......刷新根目录树
"
"   p.......跳到当前节点的父节点
"   P.......跳到root节点
"   k/j.....上下移动
"   K.......到同目录第一个节点
"   J.......最后一个节点
"
"   o.......Open files,
"   directories and bookmarks
"
"   s.......split上下分屏[原来是i 改键]
"   v.......vsplit左右分屏[原来是s,改键]
"
"   c.......将当前目录设为根节点
"   q.......关闭
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


set number
" 语法高亮
if &t_Co > 1
	syntax enable
endif

" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
" 打开状态栏标尺
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 统一缩进为4
set tabstop=4
" 禁止折行
set nowrap

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 代码折叠
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" za，打开或关闭当前折叠
" zM，关闭所有折叠
" zR，打开所有折叠

" 键入<Leader>ll 后进入TlistToggle
nmap <Leader>ll :TlistToggle<CR>
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 回车，打开选中文件
" r，刷新工程目录文件列表
" I（大写），显示/隐藏隐藏文件
" m，出现创建/删除/剪切/拷贝操作列表
" 键入 <leader>fl 后，右边子窗口为工程项目文件列表

if has('statusline')
    set laststatus=2
    set statusline=%<%f\   " 文件名
    set statusline+=%w%h%m%r " 选项
    set statusline+=%{fugitive#statusline()} "Git
    set statusline+=\ %{&ff}/%Y            " filetype
    set statusline+=\ %{getcwd()}          " current dir
    set statusline+=\ A=\%03.3b/H=\%02.2B " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l\/%L,%c%V%)\ %p%%  " Right aligned file nav info
endif
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" colorscheme solarized
