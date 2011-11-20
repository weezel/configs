set textwidth=78
" Make mappings
inoremap <F5> <Esc> :w <CR> :!make 2>&1 >/dev/null<CR>
nnoremap <F5> :w <CR> :!make 2>&1 >/dev/null<CR>

