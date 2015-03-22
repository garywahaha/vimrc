" Minimal .vimrc
set nocompatible           " so you get more than vi
set ai                     " Auto indent
set cindent                " C-style indent
set bs=2                   " Backspace over linebreak
set ts=4                   " Tabstop (usually equal to sw)
set sw=4                   " Shiftwidth
let loaded_matchparen = 1  " Do not match parenthesis that slows you down (in 7.0)
set completeopt=           " No list for completion (^P and ^N) (in 7.0)
set ruler                  " ruler (optional)
set nu                     " line numbering (optional)
" Simply type ":mak" to make your code (optional)
au FileType cpp,c setl mp=make\ %:t:r
" (works better if you also set $CFLAGS and $CXXFLAGS in bash)
color evening

set expandtab
