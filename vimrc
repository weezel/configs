"set term=screen-256color
if has("gui_running")
	set t_Co=256
        let moria_style='dark' "light
        let moria_fontface = 'mixed'
        "let moria_monochrome = 1
        colors moria

	set guioptions-=T
	set gfn=Monospace\ 9
	set cursorline
" feel free to choose :set background=light for a different style
else
	colors koehler
	set t_Co=256
endif


" System
"let $CVSROOT=':ext:weezel@localhost:/home/weezel/cvs'
set nocompatible
set listchars=tab:>-,eol:$,trail:.,extends:#
set backspace=indent,eol,start
set tm=500 " time out to 500msec
set history=50
"set textwidth=78
"set softtabstop=4
"set shiftwidth=4
"set cindent
"set tabstop=4
"set expandtab " use spaces instead of tabs
"set noto "set no timeout
map <F3> :NERDTreeToggle<CR>
" Build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ectags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ectags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" Paste Mode On/Off
map <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>
let paste_mode = 0 " 0 = normal, 1 = paste
func! Paste_on_off()
        if g:paste_mode == 0
                set paste
                set nonumber
				let g:paste_mode = 1
        else
                set number
				set nopaste
                let g:paste_mode = 0
        endif  
        return
endfunc 
" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" Visual
syntax on
set nowrap
set nobackup
"set list
set ruler
set laststatus=2
set hlsearch 
set number
set wildmenu
set showcmd     " display incomplete commands
set incsearch   " do incremental searching


" Indent
set autoindent
set smarttab
set smartindent
set copyindent


"if &term == "screen"
"    map ^[OH <Home>
"    map ^[OF <End>
"    map ^[[5~ <Home>
"    map ^[[6~ <End>
"    set t_kN=^[[6;*~
"    set t_kP=^[[5;*~
"endif

" auto parenthesis
" insert } automatically after {
"inoremap {  { }<Left><Left>

"if has("autocmd")
"	filetype plugin indent on
"else
"	set autoindent
" snipMate needs this
filetype on
filetype plugin indent on
"set autoindent

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Tagglist settings
let Tlist_Ctags_Cmd="ectags"
"let Tlist_Auto_Open = 1
let Tlist_Winwidth = 60
let Tlist_Compact_Format = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type="name"
map <F4> :TlistToggle<cr>
map <F5> :TlistUpdate<cr>
" fold from { to }
"nmap <F1> /}<CR>zf%<ESC>:nohlsearch<CR>

" For Python
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Word complete
"source /home/weezel/.vim/word_complete.vim
"call DoWordComplete()

" Ctags path(s)
set tags+=/home/weezel/.vim/tags/c
set tags+=/home/weezel/.vim/tags/cpp
set tags+=/home/weezel/.vim/tags/qt
" Thanks for Ryan Phillips, you can also add "tags;" (notice the semicolon) to
" your tags so that vim will automatically look up "tags" file in the file
" tree (":help file-searching" for document):
set tags+=tags;

" OmniCppComplete
" <C-X><C-O> opens the omnicompletion manually.
" CTRL + Space opens omni complete now
imap <c-space> <c-x><c-o>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["qt", "_GLIBCXX_STD"]


" c/c++ thingie, remember to use cope to get error window!
"autocmd BufRead *.cpp cope | set makeprg=g++\ -o\ $*\ $*.cpp\ -ansi\ -pedantic\ -Wall
"autocmd BufRead *.c cope | set makeprg=gcc++\ -o\ $*\ $*.cpp\ -ansi\ -pedantic\ -Wall

