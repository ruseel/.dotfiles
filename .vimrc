set nocompatible
set fileencoding=utf8
set encoding=utf8
set sw=2 sts=2 et ai
set nowrap
set ts=4
set backspace=indent,eol,start
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/vundle/
set bg=dark
set makeef=errors.err
set pastetoggle=<f10>

filetype plugin indent on
syntax on

call vundle#rc()

Bundle "gmarik/vundle"
Bundle "scrooloose/nerdtree"
Bundle "justincampbell/vim-railscasts"
Bundle "terryma/vim-multiple-cursors"
Bundle "ack.vim"
Bundle "beloglazov/vim-online-thesaurus"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "gregsexton/MatchTag"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"

Bundle "vim-scripts/matchit.zip"

" Optional:
"   Bundle "honza/vim-snippets"

" hightlight currentline
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" colorscheme
autocmd ColorScheme * highlight Visual ctermbg=236
"colorscheme railscasts

let mapleader=","
let g:ctrlp_user_command = [".git", "cd %s && git ls-files"]

nnoremap zz :w<cr>

" $MYVIMRC edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sn :vsplit ~/.vim/snippets/html.snippets<cr>

" no shift for colon
" map jk to <esc>
nnoremap ; :
nnoremap : ;
inoremap jk <esc>
inoremap <esc> <nop>

" inoremap <c-u> <esc>vbUlea

" quote visual selection
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap <leader>" bi"<esc>lei"<esc>

nnoremap H ^
nnoremap L $


nnoremap <leader>y ^v$"zy
nnoremap <leader>p f>"zp
nnoremap <leader>c ?<#if<cr>V/<\/#if<cr>:!ruby ~/bin/extract-ftl-partial.rb ~/tmp/new-translate.csv<cr>
nnoremap <leader>x ?<#macro<cr>V/<\/#mac<cr>:!ruby ~/bin/extract-ftl-macro-to-csv.rb ~/p/dancing9-front/src/tools/d9-s1.csv<cr>
nnoremap <leader>gs :Gstatus<cr>


vnoremap <leader>c :!ruby ~/bin/extract-ftl-partial.rb ~/tmp/new-translate.csv


onoremap in( :<c-u>normal!
onoremap i< :<c-u>normal! T>vt<<cr>
onoremap ia :<c-u>normal! T vt <cr>

augroup filetype_md
  autocmd!
  autocmd FileType md onoremap <buffer> ih :<c-u>execute "normal! ?^\\(=\\\\|-\\)\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType md onoremap <buffer> ah :<c-u>execute "normal! ?^==\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <leader>r :w<cr>:!python %<cr>
  autocmd FileType python execute "normal :set makeprg=!python\\ %<cr>"
  autocmd FileType python setlocal errorformat=
          \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
          \%Z%m,
          \%-G%.%#
augroup END

augroup filetype_ruby
  autocmd!
  autocmd FileType ruby nnoremap <leader>r :!ruby %<cr>
augroup END


set path+=$HOME/p/kproject-front/src/main/webapp

nnoremap rrr ^/require /eliFile.join(File.dirname(__FILE__), <esc>A)<esc>

abbrev email ruseel@gmail.com

" Highlight trailing whitespace
highlight! link ExtraWhitespace Todo
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

command! RemoveTrailingWhitespace :%s/\s\+$//g
command! RubyHashBang :normal ggO#!/bin/env ruby<esc>

nnoremap <leader>m :w<cr>:!rspec --color -Ilib spec/LongRunningJob.rb<cr>
noremap <leader>t :!tidy -config ~/.vim/tidyrc<cr>

" Custom
autocmd BufNewFile,BufRead *.ftl set ft=html sw=4 sts=4 et

abbr iabr <#if type=='abrDuet'>
abbr else <#else>
abbr end </#if>

nnoremap <leader>x ^d/href="/e<cr>f"d$

nnoremap <leader>ex V/<\/tr><cr>:w %:h/
nnoremap <leader>ei gvc<#include "./_solo__tr.ftl" /><esc>?_tr<cr>

function! ExtractPartial() range
  call inputsave()
  let b:filename = input("extract partial: ")
  echomsg b:filename
  call inputrestore()
  execute a:firstline . "," . a:lastline ."w! %:h/" . b:filename
  execute a:firstline . "," . a:lastline ."d"

  execute "normal O<#include \"./" . b:filename . "\" />"
endfunction

vnoremap <f3> :call ExtractPartial()<cr>


function! S1()
  echom "s1"
endfunction

nmap <f4> ^lV%c<#include "./_.ftl" /><esc>


function! OpenAlternateFile()
  let b:currentfname = expand('%')
  execute ':new ' . substitute(b:currentfname, 'solo', 'duet', '')
endfunction

" function! SaveToAlternateFile()
"  let b:currentfname = expand('%')
"  execute ':w ' . substitute(b:currentfname, 'solo', 'group', '')
" endfunction

" nnoremap <f2> :call SaveToAlternateFile()<cr>
"
nnoremap \p :setlocal paste!<cr>:setlocal paste?<cr>
nnoremap <leader>css /css_version = '/e<cr>lcw

iabbr ss <span>
iabbr es </span>
