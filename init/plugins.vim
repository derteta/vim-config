" Plugin settings

nmap <leader>t :Files<CR>
nmap <leader><S-t> :Tags<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>f :Rg 
nmap <leader><S-f> :Rg <C-r><C-w><CR>
nmap <leader>l :FSHere<CR>
nmap <leader><S-l> :split<CR> :FSBelow<CR>
nmap <leader>p :Welcome<CR>

" vim-gh-line: use branch names instead of hashes in URL
let g:gh_use_canonical = 0
