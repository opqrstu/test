map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F4> g<c-]>
map <F5> <c-t>
map <F6> * 
map <F7> #
map <F8> :set invnumber<CR>
map <F9> :set wrap!<CR>
map <F10> zc
map <F11> zo
map <Esc>0q <c-e>
if &term=="xterm" || &term=="xterm-color"
    set t_Co=8
    set t_Sb=^[4%dm
    set t_Sf=^[3%dm
    :imap  <Esc>OCxi
"    :imap   
    :imap <Esc>Oq 1
    :imap <Esc>Or 2
    :imap <Esc>Os 3
    :imap <Esc>Ot 4
    :imap <Esc>Ou 5
    :imap <Esc>Ov 6
    :imap <Esc>Ow 7
    :imap <Esc>Ox 8
    :imap <Esc>Oy 9
    :imap <Esc>Op 0
    :imap <Esc>On .
    :imap <Esc>OQ /
    :imap <Esc>OR *
    :imap <Esc>Ol +
    :imap <Esc>OS -
endif
let g:NERDTreeWinPos = "right"

set tags=./tags,tags;
let Tlist_Use_Right_Window=1
syntax on
set number
set autoindent
set cindent
set tabstop=4
set showmatch
set expandtab
set hlsearch
set background=dark
set nocompatible
set bs=indent,eol,start
set ruler
set title
set wmnu
set nowrap
set shiftwidth=4
set foldmethod=marker
set mouse=a

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'airblade/vim-gitgutter'   
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'AutoComplPop'
    Plugin 'taglist-plus'

    call vundle#end()            " required
filetype plugin indent on    " required

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }
