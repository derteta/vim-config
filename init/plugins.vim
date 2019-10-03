" Plugin settings

nmap <leader>t :Files<CR>
nmap <leader><S-t> :Buffers<CR>
nmap <leader>f :Rg 
nmap <leader><S-f> :Rg <C-r><C-w><CR>
nmap <leader>l :FSHere<CR>
nmap <leader><S-l> :split<CR> :FSBelow<CR>
nmap <leader>p :Welcome<CR>
nmap <leader>n :SimplenoteList

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'modified'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \ },
      \ }
function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '<'._.'>' : ''
    endif
  catch
  endtry
  return ''
endfunction
