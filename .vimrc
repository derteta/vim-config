" Appearance
colorscheme desert256
highlight cursorline guibg=#111111
set nocompatible
set rnu
set nu
set cursorline
set ruler
set visualbell
let &statusline = '[%{toupper(mode())}] %(%F%m%r%) %= %(%c,%l %p%%%)'


" Tabs and indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set cino=(0


" Files and paths
set encoding=utf-8
set autoread
set noswapfile
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype on
filetype plugin on
filetype indent on
let filetype_m='objc'
set tags=tags;/
set wildignore=*.swp,*.bak,*.pyc
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
set shellcmdflag=-ci


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

runtime! init/**.vim

function! Getrange(type)
  let low  = getpos("'[")[1]
  let high = getpos("']")[1]
  let com = string(low) . "," . string(high) . "s/"
  :<c-r>=com<cr>
endfunction

nmap <silent> <F4> :set opfunc=Getrange<CR>g@
