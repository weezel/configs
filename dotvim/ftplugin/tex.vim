set textwidth=78
" Use with textwidth=n , thus this incidates textwidth length
set colorcolumn=+1
" Make mappings
inoremap <F5> <Esc> :w <CR> :!make 2>&1 >/dev/null<CR>
nnoremap <F5> :w <CR> :!make 2>&1 >/dev/null<CR>

" No syntax checker
SyntasticToggleMode

set spell

" QuickFix mappings
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" The Saurus
set thesaurus+=$HOME/.vim/dict/mthesaur.txt

inoremap <C-Space> <C-X>s
