set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'

set fileencodings=utf-8,euc-kr
set ai sts=4 sw=4 et 
set modelines=3
set bg=dark
set incsearch
set ignorecase
set smartcase
syn on

nnoremap ; :
nnoremap : ;
inoremap jk <esc>
inoremap <esc> <nop>

let mapleader=","
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>z :!rspec %<cr>


