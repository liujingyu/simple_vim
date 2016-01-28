""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    基本配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"line no
set nu
"光标
set mouse=a
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atl
" 帮助文件使用中文
set helplang=cn
" 设置折叠模式
set foldcolumn=4
" 光标遇到折叠就打开
set foldopen=all
"突出显示当前行
set cursorline
"no bomb
set nobomb
set history=10000
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving or quit
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :qa!<cr>
nmap <Leader>WQ :wqa<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

set incsearch "Make search act like search in modern browsers

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" 将制表符扩展为空格
set expandtab
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 设置编辑时制表符占用空格数
set tabstop=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"光标处理
if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"php手册 打开PHP文件后，把光标移动到某个函数下，按大写的K键即可查看函数的文档内容
"利用composer 安装pman,命令 composer global require gonzaloserrano/pman-php-manual:dev-master
au FileType php setlocal keywordprg=pman

" Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/apple/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
   if &paste
       return 'PASTE MODE  '
   else
       return ''
   endif
endfunction

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ " Line:\ %l/%L:%c

"php complete system function
au FileType php set omnifunc=phpcomplete#CompletePHP
function AddPHPFuncList()
    set dictionary-=~/vim/php_funclist.txt dictionary+=~/vim/php_funclist.txt
    set complete-=k complete+=k
endfunction
au FileType php call AddPHPFuncList()
" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1

" ctags设置
set tags+=/Users/apple
set autochdir
set tags=tags;

" 删除行尾的空格
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

au BufWrite *.php :call DeleteTrailingWS()
au BufWrite *.py :call DeleteTrailingWS()
au BufWrite *.js :call DeleteTrailingWS()
au BufWrite *.vimrc :call DeleteTrailingWS()

" 为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Vundle Plugin                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'anyakichi/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'edsono/vim-matchit'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'leshill/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
Plugin 'vim-php/vim-php-refactoring'
Plugin 'mileszs/ack.vim'
Plugin 'ShowTrailingWhitespace'

call vundle#end()            " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    插件配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_key_list_select_completion = ['<c-p>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-n>', '<Up>']
let g:ycm_use_ultisnips_completer = 1
let g:ycm_cache_omnifunc = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

" If php-cs-fixer is in $PATH, you don't need to define line below
let g:php_cs_fixer_level = "all"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "/usr/local/bin/php"               " Path to PHP
" If you want to define specific fixers
let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0"

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
au FileType html,css,php,xml EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

let g:solarized_termcolors=256

if exists('$TMUX')
    set term=screen-256color
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"启动vim后输入:NERDTree<Enter>, 我们还可以绑定一个快捷键
nmap <F3> :NERDTreeToggle  <CR>
let NERDTreeWinSize = 24
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:vim_json_syntax_conceal = 1

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 20000
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn)$',
 \ 'file': '\v\.(exe|so|dll)$',
 \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
 \ }

 let g:ctrlp_extensions = ['line', 'tag', 'bookmarkdir', 'utils']
nmap <F4> :TagbarToggle<CR>
let g:Tb_MaxSize = 2

let g:php_refactor_command='refactor'

" snipmate插件add author name in snips_author
let g:snips_author = "liujingyu"

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

call togglebg#map("<F5>")

" ShowTrailingWhitespace
highlight ShowTrailingWhitespace ctermbg=Red guibg=Red

" vim-easymotion
" ,,w<Target Key>                     光标向下定位所有单词首字母
" ,,e<Target Key>                     光标向下定位所有单词尾字母
" ,,b<Search Character>               光标向上定位所有单词首字母
" ,,gE<Target Key>                    光标向上定位所有单词字母末尾
" ,,f<Search Character><Target Key>   光标向下定位所有要查找的字符
