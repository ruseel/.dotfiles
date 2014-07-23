set nocompatible

set fileencoding=utf8
set encoding=utf8
set sw=2 sts=2 et ai
set nowrap
set ts=2
set backspace=indent,eol,start
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
set makeef=errors.err
set pastetoggle=<f10>
set lazyredraw
set modeline
set modelines=5

let loaded_matchparen = 1

set t_Co=256
set background=dark

call vundle#begin()

Bundle "guns/vim-clojure-static"
Bundle "guns/vim-sexp"
Bundle "tpope/vim-sexp-mappings-for-regular-people"
Bundle "kien/ctrlp.vim"
Bundle "bling/vim-airline"
Bundle "tpope/vim-fireplace"
Bundle "gmarik/vundle"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "justincampbell/vim-railscasts"
Bundle "terryma/vim-multiple-cursors"
Bundle "mileszs/ack.vim"
Bundle "beloglazov/vim-online-thesaurus"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "gregsexton/MatchTag"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"

Bundle "vim-scripts/matchit.zip"

call vundle#end()
filetype plugin indent on
syntax on

" hightlight currentline
"set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi Search ctermbg=NONE cterm=underline

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" colorscheme
"autocmd ColorScheme * highlight Visual ctermbg=236
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
  "autocmd FileType ruby nnoremap <leader>r :!ruby %<cr>
augroup END

" Highlight trailing whitespace
"highlight! link ExtraWhitespace Todo
"autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd BufWinLeave * call clearmatches()

command! RemoveTrailingWhitespace :%s/\s\+$//g
command! RubyHashBang :normal ggO#!/bin/env ruby<esc>

nnoremap <leader>m :w<cr>:!rspec --color -Ilib spec/LongRunningJob.rb<cr>
noremap <leader>t :!tidy -config ~/.vim/tidyrc<cr>

function! ExtractPartial() range
  call inputsave()
  let b:filename = input("extract partial: ")
  echomsg b:filename
  call inputrestore()
  execute a:firstline . "," . a:lastline ."w! %:h/" . b:filename
  execute a:firstline . "," . a:lastline ."d"

  execute "normal O<#include \"./" . b:filename . "\" />"
endfunction

nnoremap <leader>l :!reload-chrome<cr>

vnoremap <f3> :call ExtractPartial()<cr>
nmap <f4> ^lV%c<#include "./_.ftl" /><esc>

function! OpenAlternateFile()
  let b:currentfname = expand('%')
  execute ':new ' . substitute(b:currentfname, 'solo', 'duet', '')
endfunction

function! AckCurruntLine()
  execute ':Ack --ignore-file=match:.arr --ignore-file=match:.yml --ignore-file=match:.yaml ' . '"'. getline('.') . '"'
endfunction

function! AckCurruntWord()
  execute ':Ack --ignore-file=match:.arr --ignore-file=match:.yaml --ignore-file=match:.css ' . '"'. expand('<cword>') . '"'
endfunction

function! AckCurruntI18Nkey()
  execute ':Ack --ignore-file=match:.arr --ignore-file=match:.yaml --ignore-file=match:.css ' . '"'. expand('<cword>') . '"'
endfunction

function! ReplaceKey()
  execute 'normal' strchars(@z) . 'xi<%= t("jk"kpa") %>'
endfunction

function! SaveToYAMLFile()
  call inputsave()
  let s:yamlkey = input("yaml key: ")
  call inputrestore()

  call setreg('k', s:yamlkey)
  execute ":vs globalization/hand_extracted.yml"
  normal Go
  normal "zp
  execute 'normal ^"kPa: '
  wq

  echomsg @z
endfunction

function! ExractToEnd()
  normal "zy$
  call SaveToYAMLFile()
endfunction

function! ExractInTag()
  normal "zyi<
  call SaveToYAMLFile()
endfunction

function! ExractUntilTag()
  normal "zyt<
  call SaveToYAMLFile()
endfunction

function! Camel()
  normal "byt:
  let b:x = system('~/bin/cam.rb '.@b)
  normal f:
  normal lD
  execute 'normal a '.b:x
endfunction

function! Translate()
  normal "zy$
  let b:x = system('~/bin/google_translate.rb "'.@z.'"')
  echomsg b:x
  execute 'normal C'.b:x
endfunction

nnoremap <f4> :w<cr>:cn<cr>
vnoremap <f3> "zy:call SaveToYAMLFile()<cr>
nnoremap <f2> :vs globalization/hand_extracted.yml
nnoremap ,r :call ReplaceKey()<cr>
nnoremap ,u :call ExractUntilTag()<cr>
"nnoremap ,t :call ExractInTag()<cr>
nnoremap ,t :call Translate()<cr>
nnoremap ,e :call ExractToEnd()<cr>
"nnoremap c* :call AckCurruntLine()<cr>
nnoremap c* :call AckCurruntWord()<cr>
nnoremap cn :w<cr>:cn<cr>

" function! SaveToAlternateFile()
"  let b:currentfname = expand('%')
"  execute ':w ' . substitute(b:currentfname, 'solo', 'group', '')
" endfunction

nnoremap <f2> :call Camel()<cr>j^
"
nnoremap \p :setlocal paste!<cr>:setlocal paste?<cr>

let g:airline_powerline_fonts = 1
set laststatus=2

"nnoremap <cr> :w!<cr>:!bundle exec rake test test/models/app_test.rb<cr>
"nnoremap <cr> :w!<cr>:!ruby % <cr>

command! Hive :!$HIVE_HOME/bin/hive --service cli --database valuepotion_real -f %

"nnoremap <cr> :w!<cr>:!bundle exec rake test test/models/user_test.rb<cr>
"nnoremap <cr> :w!<cr>:!bundle exec rake test test/hql/hql_syntax_check_test.rb<cr>
"nnoremap <cr> :w!<cr>:!bundle exec rake test test/controllers/cohorts_controller_test.rb<cr>
nnoremap <cr> :w!<cr>:!bundle exec rake test test/models/hql_test.rb<cr>
"nnoremap <cr> :w!<cr>:!bundle exec rake test test/models/app_test.rb<cr>
nnoremap Z ZZ
