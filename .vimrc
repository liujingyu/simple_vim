"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'edsono/vim-matchit'
Plugin 'majutsushi/tagbar'
Plugin 'jiazhoulvke/MarkdownView'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'ldx/vim-manage-classpath'
Plugin 'tomasr/molokai'
Plugin 'leshill/vim-json'
Plugin 'sjl/gundo.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'anyakichi/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ShowTrailingWhitespace'
Plugin 'terryma/vim-expand-region'
Plugin 'drmingdrmer/xptemplate'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/Gist-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'ekalinin/Dockerfile.vim'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized


