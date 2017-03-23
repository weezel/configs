" Clang_complete related
let g:clang_complete_auto = 0

" Make mappings
inoremap <F5> <Esc> :w <CR> :make! 
nnoremap <F5> :w <CR> :make! 

" QuickFix mappings
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Switch to header file
nmap <F4> :A<cr>

" C related tags
set tags+=$HOME/.vim/tags/c
