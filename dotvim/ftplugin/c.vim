" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
set formatoptions+=ro

set cindent

" Make mappings
inoremap <F5> <Esc> :w <CR> :make! 
nnoremap <F5> :w <CR> :make! 

" C related tags
set tags+=$HOME/.vim/tags/c
