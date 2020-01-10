set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
" let Vundle manage Vundle, required
" All of your Plugins must be added before the following line
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termtrans  = 1        " 使用 termnal 背景
let g:solarized_visibility = "high"   " 使用 :set list 显示特殊字符时的高亮级别 
" GUI 模式浅色背景，终端模式深色背景
if has('gui_running')    
	set background=light
else    
	set background=dark
endif  
" 主题设置为 solarized
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
" 忽略列表中的文件
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 启动 vim 时打开 NERDTree
autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 关闭 NERDTree，当没有文件打开的时候
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end 
" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
map <leader>nt :NERDTreeToggle<CR>" <leader>tc 关闭当前的 tab
map <leader>tc :tabc<CR>" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>" <leader>ts 查看所有打开的 tab
map <leader>ts :tabs<CR>" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>" <leader>tn 后一个 tab
map <leader>tn :tabn<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
let g:tagbar_left      = 0       " 让 tagbar 在页面左侧显示，默认右边"
let g:tagbar_sort      = 0       " 标签不排序，默认排序 " <leader>tb 打开 tagbar 窗口，在左侧栏显示
map <leader>tb :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'    
let g:ycm_min_num_of_chars_for_completion               = 2 " 输入第 2 个字符开始补全                  
let g:ycm_seed_identifiers_with_syntax                  = 1 " 语法关键字补全    
let g:ycm_complete_in_comments                          = 1 " 在注释中也可以补全    
let g:ycm_complete_in_strings                           = 1 " 在字符串输入中也能补全    
let g:ycm_collect_identifiers_from_tag_files            = 1 " 使用 ctags 生成的 tags 文件    
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全    
let g:ycm_cache_omnifunc                                = 0 " 每次重新生成匹配项，禁止缓存匹配项    
let g:ycm_use_ultisnips_completer                       = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
let g:ycm_key_list_select_completion   = ['<Down>']   " 选择下一条补全，Default: ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']     " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion     = ['<Enter>']  " 中止此次补全，Default: ['<C-y>']   
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts                   = 1 " 使用 powerline 打过补丁的字体
let g:airline#extensions#tabline#enabled        = 1 " 开启 tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示 buffer 编号
let g:airline#extensions#ale#enabled            = 1 " enable ale integration 
" 状态栏显示图标设置
if !exists('g:airline_symbols')    
    let g:airline_symbols = {}
endif
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.crypt     = '?'
let g:airline_symbols.linenr    = '⭡'
let g:airline_symbols.branch    = '⭠'
" 切换 buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR> 
" 关闭当前 buffer
noremap <C-x> :w<CR>:bd<CR>" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
map <leader>10 :b 10<CR>
map <leader>11 :b 11<CR>
map <leader>12 :b 12<CR>
map <leader>13 :b 13<CR>
map <leader>14 :b 14<CR>
map <leader>15 :b 15<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set fileformats=unix,dos

