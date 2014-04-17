" 用户配置
" win需要在vimrc中加入 source $VIM/sinute/vimrc

" 设定$VIMFILES变量
let $VIMFILES='/etc/vim/sinute'

" vundle设置
" https://github.com/gmarik/vundle.git
" 载入vundle
source $VIMFILES/bundle/vundle/autoload/vundle.vim
" 把vundle加入到运行时目录
set rtp+=$VIMFILES/bundle/vundle
" 设定插件目录 需要自建插件目录
call vundle#rc('$VIMFILES/bundle')
" 插件列表
source $VIMFILES/bundle/vundle.vim

" 指定英文逗号作为<leader>键
let mapleader=","

" number & ruler
set nu

" Color
set t_Co=256
colorscheme molokai

" autoindent
set autoindent

" hlsearch
set hlsearch

" 大小写设定
set ignorecase
set smartcase

set encoding=utf-8
" set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
set lines=43 columns=200
" 隐藏工具栏
set guioptions-=T
" 隐藏菜单栏
set guioptions-=m
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
else
set fileencoding=utf-8
endif
" 解决consle输出乱码
" language messages zh_CN.utf-8
" 字体
set guifont=Monaco:h10

set showmatch
set showmode
set wildmenu
set autoread
" set tabstop=2 shiftwidth=2 expandtab
" set listchars=tab:>-,trail:-
" set list
" set nobackup
" set nowritebackup
" set noswapfile
set fileformats=unix,dos,mac

" 根据上下文推断缩进
set smarttab
" 使用空格代替tab, 长度为4个空格
set tabstop=4
" set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
" 光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
" 时候会变得非常方便.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 标签页操作
if has("win32")
nnoremap <A-l>  :tabnext<CR>
inoremap <A-l>  <ESC>:tabnext<CR>
nnoremap <A-h>  :tabprevious<CR>
inoremap <A-h>  <ESC>:tabprevious<CR>
nnoremap <A-t>  :tabnew<CR>
nnoremap <A-t>  <ESC>:tabnew<CR>i
nnoremap <A-q>  :tabclose<CR>
inoremap <A-q>  <Esc>:tabclose<CR>
else
nnoremap l  :tabnext<CR>
inoremap l  <ESC>:tabnext<CR>
nnoremap h  :tabprevious<CR>
inoremap h  <ESC>:tabprevious<CR>
nnoremap t  :tabnew<CR>
nnoremap t  <ESC>:tabnew<CR>i
nnoremap q  :tabclose<CR>
inoremap q  <Esc>:tabclose<CR>
endif
" 目录树
map <F2> :NERDTreeTabsToggle<CR><C-W>l
" 自动开启NERDTree
" autocmd vimenter * NERDTree
" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 设定默认工作目录为vim根目录
" chdir $VIM
" 自动切换当前工作目录
set autochdir

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" CtrlP open in new tab
let g:ctrlp_prompt_mappings = { 
	\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
	\ 'AcceptSelection("e")': ['<c-e>'],
	\ }
" CtrlP ignore
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
