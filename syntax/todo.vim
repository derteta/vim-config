sy match todoPrioX "^(\u).\+"
sy match todoPrioA "^(A).\+"
sy match todoPrioB "^(B).\+"
sy match todoPrioC "^(C).\+"
sy match todoProject "+\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC,todoPrioX
sy match todoTag "@\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC
hi todoPrioX   gui=NONE guifg=#ff7777
hi todoPrioA   gui=NONE guifg=yellow
hi todoPrioB   gui=NONE guifg=green
hi todoPrioC   gui=NONE guifg=#3333ff
hi todoProject gui=NONE guifg=orange
hi todoTag     gui=NONE guifg=red

