"==============================================================================
" vim 内置配置
"==============================================================================

set nu                          " 设置行号
set nocompatible                " 关闭兼容模式
set cursorline                  " 突出显示当前行
" set cursorcolumn              " 突出显示当前列

filetype off

set tabstop=4                   " 设置Tab长度为4空格
set shiftwidth=4                " 设置自动缩进长度为4空格
set expandtab                   " 显示括号匹配

syntax enable
syntax on                       " 开启文件类型侦测
filetype plugin indent on       " 启用自动补全
set ignorecase                  " 搜索时大小写不敏感
" set incsearch                   " 开启实时搜索
au InsertLeave *.go,*.sh,*.php write
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"==============================================================================
" 插件配置
"==============================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'fatih/vim-go'
    Plugin 'dgryski/vim-godef' 				" go 中的代码追踪，输入 gd 就可以自动跳转

    Plugin 'scrooloose/nerdtree'        	" 用来提供一个导航目录的侧边栏
    Plugin 'ycm-core/YouCompleteMe'     	" 代码自动完成
    Plugin 'Xuyuanp/nerdtree-git-plugin'  	" 可以在导航目录中看到 git 版本信息
    Plugin 'vim-airline/vim-airline'      	" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态


    Plugin 'junegunn/vim-easy-align' 		" 快速对齐
    Plugin 'jistr/vim-nerdtree-tabs' 		" 可以使 nerdtree Tab 标签的名称更友好些
    " Plugin 'Xuyuanp/nerdtree-git-plugin' " 可以在导航目录中看到 git 版本信息


    " 查看当前代码文件中的变量和函数列表的插件，
    " 可以切换和跳转到代码中对应的变量和函数的位置
    " 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
    Plugin 'majutsushi/tagbar'

    " 自动补全括号的插件，包括小括号，中括号，以及花括号
    "Plugin 'jiangmiao/auto-pairs'


    " 可以在文档中显示 git 信息
    Plugin 'airblade/vim-gitgutter'

    " 下面两个插件要配合使用，可以自动生成代码块
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'


    " 配色方案
    Plugin 'KeitaNakamura/neodark.vim'    " colorscheme neodark
    Plugin 'crusoexia/vim-monokai'        " colorscheme monokai
    Plugin 'acarapetis/vim-colors-github' " colorscheme github
    Plugin 'rakr/vim-one'                 " colorscheme one
call vundle#end()

"==============================================================================
" 主题配色
"==============================================================================

" 开启24bit的颜色，开启这个颜色会更漂亮一些
set termguicolors
" 配色方案, 可以从上面插件安装中的选择一个使用
colorscheme neodark " 主题
set background=dark " 主题背景 dark-深色; light-浅色


"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2


"==============================================================================
" NERDTree 插件
"==============================================================================

" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=0



"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusShowIgnored = 1


"==============================================================================
"  Valloric/YouCompleteMe 插件
"==============================================================================

" make YCM compatible with UltiSnips (using supertab)
 let g:ycm_key_list_select_completion = ['<C-n>']
 let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
 let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
 let g:UltiSnipsExpandTrigger = "<tab>"
 let g:UltiSnipsJumpForwardTrigger = "<tab>"
 let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
