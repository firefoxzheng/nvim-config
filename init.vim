" 定义快捷键的前d，即 <Leader>
let mapleader=";"

set ttyfast

" 文件编码
set encoding=utf-8

" 设置文件编码
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16

" 不生成交换文件
set noswapfile

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap <leader>bb 0
nmap <leader>ee $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" Fast saving
nmap <silent> <leader>ww :w<cr>
" Fast quiting
nmap <silent> <leader>wq :wq<cr>

" 顺序跳转窗口
nnoremap <leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <leader>jw <C-W>j

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
set backspace=indent,eol,start
" vim 自身命令行模式智能补全
set wildmenu
" normal下开启鼠标模式
set mouse=n
" auto chdir
set autochdir
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" c/c++ 将缩进调为2个空格
augroup indentgroup
    autocmd!
    au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set tabstop=2 
    au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set shiftwidth=2 
    au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set softtabstop=2 
augroup END
" 启动 vim 时关闭折叠代码
set nofoldenable

" 插件安装
call plug#begin('~/.local/share/nvim/plugged')

" basic plugin
Plug 'Yggdroot/indentLine'
Plug 'derekwyatt/vim-fswitch'
Plug 'scrooloose/nerdcommenter'
Plug 'gcmt/wildfire.vim'
Plug 'brookhong/cscope.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'inside/vim-search-pulse'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'yuttie/comfortable-motion.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'machakann/vim-highlightedyank'
Plug 'voldikss/vim-floaterm'
Plug 'bfredl/nvim-miniyank'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'mhinz/vim-startify'
Plug 'chengzeyi/go-highlight.vim'
Plug 'voldikss/vim-translator'
Plug 'glepnir/spaceline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'

" colorscheme
Plug 'joshdick/onedark.vim'

call plug#end()

call glaive#Install()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256
" 总是显示状态栏
set laststatus=2

let g:onedark_hide_endofbuffer = 1
colorscheme onedark
highlight Comment cterm=italic gui=italic

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
au! BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
au! BufEnter *.cc let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
au! BufEnter *.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
au! BufEnter *.h let b:fswitchdst = 'jce,cpp,cc,c' | let b:fswitchlocs = './'
au! BufEnter *.jce let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "it"]
nmap <leader>vv <Plug>(wildfire-quick-select)

" cscope
let g:cscope_silent = 1
nnoremap <leader>sa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <F10> :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>ss :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>sd :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>su :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>sr :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>sc :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>se :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>sf :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>si :call CscopeFind('i', expand('<cword>'))<CR>"

" incsearch
let g:incsearch#consistent_n_direction = 1
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

map n <Plug>(incsearch-nohl-n)<Plug>Pulse
map N <Plug>(incsearch-nohl-N)<Plug>Pulse
map * <Plug>(incsearch-nohl-*)<Plug>Pulse
map # <Plug>(incsearch-nohl-#)<Plug>Pulse

function! s:config_fuzzyall(...) abort
    return extend(copy({
                \   'converters': [
                \     incsearch#config#fuzzy#converter(),
                \     incsearch#config#fuzzyspell#converter()],}), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

" Pulses the first match after hitting the enter keyan
autocmd! User IncSearchExecute
autocmd User IncSearchExecute :call search_pulse#Pulse()
let g:vim_search_pulse_duration = 300

nnoremap <leader>nh :<C-u>nohlsearch<CR>

" LeaderF
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog  = '/usr/bin/python3'
let g:Lf_Ctags = '/home/linuxbrew/.linuxbrew/bin/ctags'
let g:Lf_RootMarkers = ['.git', '.svn', '.root']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_StlSeparator = {'left': '', 'right': '', 'font': ''}
let g:Lf_CacheDirectory = expand('~/.LfCache')
let g:Lf_ShortcutF = '<leader>ff'
let g:Lf_ShortcutB = '<leader>fb'
let g:Lf_UseCache = 0
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
" 搜索最近使用的文件
noremap <leader>fr :LeaderfMru<CR>
" 搜索当前文件中的函数
noremap <leader>fc :LeaderfFunction<CR>
" search current directory
noremap <leader>fd :LeaderfFile .<CR>

" vim-fugitive
set diffopt+=vertical

" coc.nvim
set hidden
set nobackup
set nowritebackup
set updatetime=100
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <F2> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" navigate diagnostics
nmap [ <Plug>(coc-diagnostic-prev)
nmap ] <Plug>(coc-diagnostic-next)

" Formatting selected code.
xmap <leader>ft <Plug>(coc-format-selected)
nmap <leader>ft <Plug>(coc-format-selected)

" Remap keys for gotos
nmap gd : call CocActionAsync("jumpDefinition")<cr>
nmap gt : call CocActionAsync("jumpTypeDefinition")<cr>
nmap gi : call CocActionAsync("jumpImplementation")<cr>
nmap gr : call CocActionAsync("jumpReferences")<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Fix autofix problem of current line
nmap <F9> <Plug>(coc-fix-current)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <nowait> ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <nowait> ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <nowait> cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <nowait> co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <nowait> cs  :<C-u>CocList -I symbols<cr>
" Marketplace
nnoremap <nowait> cm  :<C-u>CocList marketplace<cr>

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['DeepSkyBlue1', 'IndianRed1', 'LightGoldenrod1', 'Aquamarine1']}

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(30)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-30)<CR>

" indentLine
let g:indentLine_char_list = ['|', '¦']
let g:indentLine_enabled = 0

" remember last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" highlight
highlight CursorLine cterm=underline ctermbg=none gui=underline guibg=#1C1C1C
highlight CursorColumn cterm=none ctermfg=none ctermbg=239 gui=none guifg=none guibg=#4e4e4e
highlight CocHighlightText ctermfg=none ctermbg=239 guifg=none guibg=#4e4e4e
highlight Function cterm=bold gui=bold

" quick left and right move
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg=#ffff00 gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg=#afff5f gui=underline ctermfg=155 cterm=underline

" floaterm
let g:floaterm_rootmarkers = ['.git', '.gitignore']
let g:floaterm_width = 0.8
nnoremap <silent><leader>te :FloatermToggle<CR>
tnoremap <silent><leader>te <C-\><C-n>:FloatermToggle<CR>

" miniyank
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)
nmap <leader>p <Plug>(miniyank-startput)
nmap <leader>P <Plug>(miniyank-startPut)
nmap <leader>n <Plug>(miniyank-cycle)
nmap <leader>N <Plug>(miniyank-cycleback)
nmap <Leader>c <Plug>(miniyank-tochar)
nmap <Leader>l <Plug>(miniyank-toline)
nmap <Leader>b <Plug>(miniyank-toblock)

" codefmt
Glaive codefmt clang_format_executable='clang-format'
Glaive codefmt clang_format_style='file'
Glaive codefmt gofmt_executable='goimports'

au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c,*.go nnoremap = <C-u>:FormatCode<CR>
au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c,*.go vnoremap = :FormatLines<CR>

" starify
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
            \ { 'type': 'files', 'header': ['   MRU']            },
            \ { 'type': 'sessions', 'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': function('s:gitModified'), 'header': ['   git modified']},
            \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
            \ { 'type': 'commands', 'header': ['   Commands']       },
            \ ]

" translator
let g:translator_default_engines = ['google', 'youdao']
" Display translation in a window
nmap <silent> <Leader>tr <Plug>TranslateW
vmap <silent> <Leader>tr <Plug>TranslateWV
" scroll in result window
nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<M-f>"
nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(0) : "\<M-f>"

" spaceline
let g:spaceline_seperate_style = 'none'
let g:spaceline_diff_tool = 'vim-signify'

" wintabs
noremap <F3> :WintabsPrevious<CR>
noremap <F4> :WintabsNext<CR>
noremap <leader>bd :WintabsClose<CR>
noremap <leader>ba :WintabsOnly<CR>
noremap <leader>bu :WintabsUndo<CR>
noremap <leader>rr :WintabsRefresh<CR>
let g:wintabs_powerline_arrow_left = ""
let g:wintabs_powerline_arrow_right = ""
let g:wintabs_powerline_sep_buffer_transition = ""
let g:wintabs_powerline_sep_buffer = ""
let g:wintabs_powerline_sep_tab_transition = ""
let g:wintabs_powerline_sep_tab = ""
let g:wintabs_ui_buffer_name_format = ' [%o] %t '
highlight link WintabsEmpty TabLineFill
highlight WintabsActive cterm=bold ctermfg=188 ctermbg=261 gui=bold guifg=#c0c0c0 guibg=#5d4d7a
highlight WintabsInactive ctermfg=188 ctermbg=237 guifg=#c0c0c0 guibg=#242B38
