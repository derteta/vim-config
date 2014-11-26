sy match todoPrioX "^(\u).\+"
sy match todoPrioA "^(A).\+"
sy match todoPrioB "^(B).\+"
sy match todoPrioC "^(C).\+"
sy match todoProject "+\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC
sy match todoTag "@\w\+" containedin=todoPrioX,todoPrioA,todoPrioB,todoPrioC
hi todoPrioX   gui=NONE guifg=white
hi todoPrioA   gui=NONE guifg=yellow
hi todoPrioB   gui=NONE guifg=green
hi todoPrioC   gui=NONE guifg=blue
hi todoProject gui=NONE guifg=purple
hi todoTag     gui=NONE guifg=red

