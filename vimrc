" plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'

call plug#end()

" plugin configuration
set updatetime=100  " gitgutter

" colorscheme
colorscheme base16-default-dark
let base16colorspace=256

" general
syntax on
set number
set nobackup
set backspace=2

" indentation
filetype indent on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
