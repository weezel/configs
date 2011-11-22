set textwidth=78
" Use with textwidth=n , thus this incidates textwidth length
set colorcolumn=+1
" Make mappings
inoremap <F5> <Esc> :w <CR> :!make 2>&1 >/dev/null<CR>
nnoremap <F5> :w <CR> :!make 2>&1 >/dev/null<CR>

