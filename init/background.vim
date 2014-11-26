" Functions and commands for background processing
" WARNING: This only works to a certain extend.
" Sending back some results can fail. 

command! -nargs=+ RGrep call RemoteGrep("<args>")

nmap <leader>b :call RemoteBuild()<CR>
nmap <leader>v :RGrep 
nmap <leader><s-v> :RGrep <c-r><c-w> **/*<CR>

function! BackgroundGrep(arguments, client)
  exec 'lvimgrep ' . a:arguments
  call BackgroundShareResults(a:client)
  exec 'bd!'
endfunction

function! BackgroundBuild(make_prg, client)
  exec 'setlocal makeprg='.a:make_prg
  exec 'lmake'
  call BackgroundShareResults(a:client)
endfunction


"----- Background side -----

function! BackgroundShareOneResult(client, item)
  if !empty(a:item['lnum']) && !empty(a:item['type'])
    let buf_nr = remove(a:item, 'bufnr')
    let a:item['filename'] = getcwd().'/'.bufname(l:buf_nr)
    "TODO make call to setqflist silent
    call remote_send(a:client,
          \          ':call setqflist(['.string(a:item).'], "a")<CR>')
  endif
endfunction

function! BackgroundShareResults(client)
  call remote_send(a:client, ':call setqflist([], "r")<CR>')
  if !empty(getloclist(0))
    for item in getloclist(0)
      call BackgroundShareOneResult(a:client, item)
    endfor
    call remote_send(a:client, '<CR>:echo "New results available!"<CR>')
  endif
endfunction


"----- Foreground side -----

let bg_id='BGVim'

function! RemoteSend(command)
  call remote_send(g:bg_id, a:command)
endfunction

function! InitiateBackgroundInstance()
  if (match(serverlist(), g:bg_id) == -1)
    exec 'silent !/Applications/MacVim/mvim --servername '.g:bg_id
    exec 'sleep'
    call RemoteSend(':set nobackup<CR>:set nowritebackup<CR>:set noswapfile<CR>')
    call RemoteSend(':set autoread<CR>')
  endif
  call RemoteSend(':lcd '.getcwd().'<CR>')
endfunction

function! RemoteBuild()
  call InitiateBackgroundInstance()
  call RemoteSend(':call BackgroundBuild("'.&makeprg.'", '
        \         .string(v:servername).')<CR>')
endfunction

function! RemoteGrep(arguments)
  call InitiateBackgroundInstance()
  call RemoteSend(':echo "Grepping..."<CR>')
  call RemoteSend(':call BackgroundGrep("'.a:arguments.'", '
        \         .string(v:servername).')<CR>')
endfunction
