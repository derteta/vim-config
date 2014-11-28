" Appearance
colorscheme desert256
set nocompatible
set nu
set ruler
set visualbell


" Tabs and indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set cino=(0


" Files and paths
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype on
filetype plugin on
filetype indent on
let filetype_m='objc'
set tags=tags;/
au! BufEnter *.py setlocal tabstop=4 shiftwidth=4 makeprg=nosetests\ %
au! BufEnter *.rb setlocal tabstop=4 shiftwidth=4 makeprg=ruby\ %
au! FileType python setlocal omnifunc=pythoncomplete#Complete


" Search
set hlsearch
set incsearch
set ic
set wildmode=longest:full
set wildmenu
set complete-=i
set backspace=start,indent,eol
set listchars=tab:>-,trail:#,eol:$


" Shell
set shell=bash


" Custom mappings
let mapleader=","
map <leader>c :make<CR> :cw<CR>
map <leader>d :ts /
map <leader><S-d> :ts /<C-r><C-w><CR>
nmap <leader>w :%s/\ \+$//g<CR>
nmap <leader><LEFT> :diffget //2<CR> :diffup<CR>
nmap <leader><RIGHT> :diffget //3<CR> :diffup<CR>
nmap <leader><DOWN> ]c
nmap <leader><UP> [c
nmap <leader>. @:
nmap <leader>/ :nohlsearch<CR>
nmap <leader>r :\.,\.+$v:count1
nmap <leader><S-r> :'<,'>s/

nmap <leader>0 :e ~/.vim/init/<CR> :vsplit ~/.vimrc<CR>
 
runtime! init/**.vim

function! Getrange(type)
  let low  = getpos("'[")[1]
  let high = getpos("']")[1]
  let com = string(low) . "," . string(high) . "s/"
  :<c-r>=com<cr>
endfunction

nmap <silent> <F4> :set opfunc=Getrange<CR>g@
