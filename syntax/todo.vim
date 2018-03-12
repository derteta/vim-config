sy match todoPrioX "(\u).\+"
sy match todoPrioA "(A).\+"
sy match todoPrioB "(B).\+"
sy match todoPrioC "(C).\+"
sy match todoProject "+\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC,todoPrioX
sy match todoTag "@\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC
hi todoPrioX   gui=NONE ctermfg=grey      guifg=#ff7777
hi todoPrioA   gui=NONE ctermfg=yellow    guifg=yellow
hi todoPrioB   gui=NONE ctermfg=green     guifg=green
hi todoPrioC   gui=NONE ctermfg=LightBlue guifg=#3333ff
hi todoProject gui=NONE ctermfg=172       guifg=orange
hi todoTag     gui=NONE ctermfg=red       guifg=red

