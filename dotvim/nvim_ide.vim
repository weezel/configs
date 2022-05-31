call plug#begin()
" Tmux zoom pane a like
nnoremap <C-w>z :ZoomWinTabToggle<CR>
"let g:zoomwintab_hidetabline = 1
Plug 'weezel/zoomwintab.vim'

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
Plug 'itchyny/lightline.vim'

let g:deoplete#enable_at_startup = 0
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc'
" Language server settings ends

Plug 'vim-scripts/L9'

let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_extensions = ['tabline', 'ale']
let g:airline_detect_spell = 0
let g:airline_detect_paste = 0
let g:airline_detect_spelllang = 0
let g:airline_detect_iminsert = 0
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_theme='dark'
let g:airline_highlighting_cache=1
" Disable all plugins
"Plug 'vim-airline/vim-airline'

let g:ale_enabled=1
let g:ale_sign_error = '#'
let g:ale_sign_warning = '?'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500
let g:ale_set_quickfix = 1
Plug 'w0rp/ale'

nnoremap <F2> :TagbarToggle<cr>
let g:tagbar_autofocus=0
let g:tagbar_sort = 1
Plug 'majutsushi/tagbar'

map <F3> :NERDTreeToggle<CR>
Plug 'scrooloose/nerdtree'

nnoremap <F4> :UndotreeToggle<cr>
Plug 'mbbill/undotree'

nnoremap <C-j> :CtrlPBuffer<CR>
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlPLine'
let g:ctrlp_extensions = ['line']
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_types = ['fil', 'buf', 'mru']
let g:ctrlp_open_new_file = 'ri'
let g:ctrlp_open_multiple_files = 'ri'
set wildignore+=*/tmp/*,*.so,*.swp
set wildignore+=*.gz,*.zip,*.7z,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
Plug 'ctrlpvim/ctrlp.vim'

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
	"let g:ackprg = 'ag --nogroup --nocolor --column'
endif
let g:ack_apply_qmappings = 0
nnoremap <leader>f :LAck!<Space>
Plug 'mileszs/ack.vim'

let g:UltiSnipsSnippetsDir = "~/configs/dotvim/snippets"
Plug 'SirVer/ultisnips'

"g:toggle_list_no_mappings
"nnoremap <script> <silent> <leader>c call: ToggleQuickfixList()<CR>
"nnoremap <script> <silent> <leader>x call: ToggleLocationList()<CR>
Plug 'milkypostman/vim-togglelist'

Plug 'jwhitley/vim-matchit'

Plug 'airblade/vim-gitgutter'

nmap <silent> <C-A-h> :BufSurfBack<CR>
nmap <silent> <C-A-l> :BufSurfForward<CR>
Plug 'ton/vim-bufsurf'

call plug#end()

