set nocp
set ai sts=4 sw=4 et 
set modelines=3
set bg=dark
set modelines=3
set fileencodings=utf-8,euc-kr
syn on

nnoremap ; :
nnoremap : ;
inoremap jk <esc>
inoremap <esc> <nop>

let mapleader=","
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>z :!rspec %<cr>


