" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" START of Vundle plugin manager
" vundle_manual

" required configuration
set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/jeetsukumaran/vim-buffersaurus
" plugin pro vyhledavani ve vsech bufferech Bsgrep
" pro find and replace viz
" https://stackoverflow.com/questions/2450887/vim-searching-through-all-existing-buffers
Plugin 'jeetsukumaran/vim-buffersaurus'

" obsession for session management
" automaticke ukladani sessionu vcetne foldu :-)
" https://github.com/tpope/vim-obsession
Plugin 'tpope/vim-obsession'

" pro lepsi spolupraci vimu a tmuxu
Plugin 'christoomey/vim-tmux-navigator'

" enhanced c++ highlighting
" o dost lepsi zvyraznovani syntaxe c++
Plugin 'octol/vim-cpp-enhanced-highlight'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" plugin pro doplnovani skrzm omnifunc s pouzitim komunikace s databazi
Plugin 'vim-scripts/dbext.vim'

"let g:dbext_default_profile_shaperd='type=pgsql:host=localhost:user=shaperd:dsnname=shaperd:dbname=shaperd:passwd=shaperd'
let g:dbext_default_profile_shaperd='type=pgsql:host=127.0.0.1:user=shaperd:dsnname=public:dbname=shaperd'
" zruseno, defaultne shaperd, at se da hledat v databazi treba i z vimu
" otevreneho v /var/log/shaperd
"let g:dbext_default_profile_vaclavz='type=pgsql:host=localhost:user=vaclavz:dsnname=public:dbname=vaclavz'
let g:dbext_default_profile='shaperd'

" nacte soubor s dalsimi pluginy, pokud existuje
call SourceIfExists("~/.vim/plugins.vim")

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on

" vundle_manual
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" END of Vundle plugin manager

" basics
"set nocompatible				" use Vim defaults - already set
set encoding=utf-8				" use UTF-8 encoding
set fileencoding=utf-8  		" use UTF-8 encoding to write files
set mouse=a						" make sure mouse is used in all cases.
set equalalways					" alway split windows equally
set completeopt=menuone			" enable completion menu for one item
								" don't use longest, it behaves like
								" autocorrection shit, can't delete
								" autocompleted items
set wildmode=longest:list,full	" first tab - complete as much as posible
								" and show all completion obpions
								" second tab - show menu and select first
set wildmenu					" looks like much better option of wildmode
set cursorline					" allows line nuber to be highlighted
								" and sets dark backgroud for line
								" with cursor
set cursorcolumn				" sets dark backgroud for cursor column
set clipboard+=unnamed			" yank and copy to X clipboard
set backspace=2					" full backspacing capabilities
set history=256					" 256 lines of command line history
set viminfo='20,\"50			" read/write a .viminfo file, don't store more
								" than 50 lines of registers
set ruler						" cursor position display in status line
set showmode					" show mode at bottom of screen
set showcmd						" show commands at bottom of screen
set showmatch					" show matching brackets (),{},[]
set number						" display row numbers
set laststatus=2				" permanently display status line
set timeoutlen=250				" Time to wait after ESC (default causes an annoying delay)
set magic						" enable extended regular expressions
set tags+=.tags;~		"	search for ctags up to $HOME

" wrap like other editors
"set wrap				" word wrap
"set textwidth=0
"set lbr				" line break
"set display=lastline	" don't display @ with long paragraphs

" backup settings
"set backup			" keep a backup file
"set backupdir=/var/backup/vim

" searching and search highlighting
set hlsearch			" highlight all search results
set incsearch			" increment search
set ignorecase			" case-insensitive search
set smartcase			" upper-case sensitive search

" syntax highlighting and color scheme
syntax on				" enable syntax highlighting
set background=dark		" improve default color scheme
color vaclavz			" my custom color scheme
set t_Co=256			" 256 colors - tmux compatibility

" plug-in settings
filetype plugin on
filetype indent on

" disable replace mode on insert double press
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" enter on popup completion window doesn't insert newline
" je to kapanek k prdu, pac pak nejde odradkovavat za if, else atd
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ctrl+n with popup completion window behaves like down arrow
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" tab customizations
set shiftround			" round indent to multiple of 'shiftwidth'
set autoindent			" align the new line indent with the previous line
set shiftwidth=2		" operation >> indents 2 columns; << unindents 4 columns
set tabstop=2			" a hard TAB displays as 2 columns
set softtabstop=2		" insert/delete 2 spaces when hitting a TAB/BACKSPACE
set smarttab			" deletes whole inserted tab
" set expandtab			" insert spaces when hitting TABs

" fold cutomizations
" folding is controlled with za, zo, zc etc.
set foldmethod=indent
set foldlevel=99

" upravena definice vim sessionu, aby se nevkladalo cd do cilove slozky,
" neloadovaly se nezobrazene buffery a neukladaly se foldy, ktere akorat
" zdrzuji pri nacitani vimu
set sessionoptions=sesdir,options,tabpages,winsize

" automatization of folds
"augroup AutoSaveFolds
"  autocmd!
"  autocmd BufWinLeave *.* mkview
"  autocmd BufWinEnter *.* silent loadview
"augroup END

" disable default ctrl+j behavior
let g:BASH_Ctrl_j = 'off'

" custom windows switching
" predelano z puvodniho map, coz obcas sezral terminal
" premapovani ctrl + hjkl
nnoremap <c-j> <c-w>j	" press ctrl + j to switch to down windows
nnoremap <c-k> <c-w>k	" press ctrl + k to switch to top windows
nnoremap <c-l> <c-w>l	" press ctrl + l to switch to right windows
nnoremap <c-h> <c-w>h	" press ctrl + h to switch to left windows

" custop tab switching
nnoremap <c-p> :tabp<CR>		" press ctrl + p to switch to previous tab
nnoremap <c-n> :tabn<CR>		" press ctrl + n to switch to next tab

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" don't write swapfile on most commonly used directories for NFS mounts or USB sticks
autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp

augroup logs
	" soubory s priponou .log se automaticky nacitaji s filetype=messages
	autocmd BufEnter,BufReadPre /var/log/shaperd/* set filetype=messages
	autocmd BufEnter,BufReadPre /var/log/shaperd/* set filetype=shaperd

	autocmd BufEnter,BufReadPre /var/log/nadhled/* set filetype=messages
	autocmd BufEnter,BufReadPre /var/log/nadhled/* set filetype=shaperd

	autocmd BufEnter,BufReadPre /var/log/TBot/* set filetype=messages
	autocmd BufEnter,BufReadPre /var/log/TBot/* set filetype=shaperd

	autocmd BufEnter,BufReadPre /var/log/scripty/* set filetype=messages

	autocmd BufEnter /var/log/shaperd/* set autoread
	autocmd BufEnter /var/log/TBot/* set autoread
	autocmd BufEnter /var/log/nadhled/* set autoread
	autocmd BufEnter /var/log/scripty/* set autoread
	autocmd BufEnter /var/log/*.log set autoread

	autocmd BufEnter /var/log/shaperd/* :checktime
	autocmd BufEnter /var/log/TBot/* :checktime
	autocmd BufEnter /var/log/nadhled/* :checktime
	autocmd BufEnter /var/log/scripty/* :checktime
	autocmd BufEnter /var/log/*.log :checktime
augroup END

" F2 - vypne automaticke odsazovani a tabulatorovani pri vkladani textu
set pastetoggle=<F2>

" zavola :Dox pro vytvoreni doxygen sablony
nnoremap <c-c> :Dox<CR>

" omezeni sirky a barevne zvyrazneni pri jejim prekroceni - vertical split
" screen na fullhd
augroup split_screen_limit
	" For all text files set 'textwidth' to 150 characters.
	" 110 was not enough for hires screen
	" but 100 is enough to fit two files is vertical
	" split mode on FullHD - pri fontu 12 se vejde 113
	"autocmd FileType text setlocal textwidth=110
	"autocmd FileType text setlocal textwidth=150
	"autocmd FileType text setlocal textwidth=100
	autocmd FileType cpp,hpp,c,h,md setlocal textwidth=114

	" highlight lines longer than 100 chars
	" highlights all characters exceeding limit of 100 on each line
	" fits two files in split mode on full HD screen up to 10000 lines
	"if &ft ==# 'cpp' |
	"	autocmd BufEnter * highlight OverLength ctermbg=17
	"	autocmd BufEnter * match OverLength /\%100v.*/ |
	"endif
	"autocmd BufEnter cpp,hpp,c,h,md highlight OverLength ctermbg=17
	"autocmd BufEnter cpp,hpp,c,h,md match OverLength /\%112v.*/ |
	autocmd BufEnter * highlight OverLength ctermbg=172
	autocmd BufEnter * match OverLength /\%112v.*/ |
augroup END

" F3 - ulozi vsechny otevrene soubory a zavola git commit -a
"nnoremap <F3> :w <bar> exec '!git commit '.shellescape('%')<CR>
"predelano na git commit -a, at nemusim vocasit zpravy ke commitum dokola
"nnoremap <F3> :wa <bar> exec '!git commit -a'<CR>
nnoremap <F3> :wa <bar> exec '!git commit -a && git push'<CR>

" c & c++ build and run shortcuts
augroup c_development
	" slouzi k zavolani cppman na konkretnim slove, luxusni c++ manual :-)
	" shift + k
	autocmd FileType cpp set keywordprg=cppman

	" definice autoindenteru pro cpp - v nekterych pripadech se nechova tak, jak
	" je zadouci - zarovnani vyberu nefunguje
	"autocmd FileType cpp,hpp,c,h set equalprg=astyle
	autocmd filetype cpp,hpp,c,h nnoremap <F5> :%!astyle<CR>

	" F4 - compile and run current file
	"autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -g -o 
	"			\ ../'.shellescape('%:r').' && ../'.shellescape('%:r')<CR>
	"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ --std=c++11 '.shellescape('%').' -g -o
	"			\ ../'.shellescape('%:r').' && ../'.shellescape('%:r')<CR>

	" F5 - compile and run current file using gdb debugger
	"autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -g -o
	"			\ ../'.shellescape('%:r').' && gdb ../'.shellescape('%:r')<CR>
	"autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ --std=c++11 '.shellescape('%').' -g -o
	"			\ ../'.shellescape('%:r').' && gdb ../'.shellescape('%:r')<CR>

	"autocmd filetype cpp nnoremap <F4> :wa <CR> :make remake<CR>

	" neni spatne, ale bohuzel uspesna kompilace neznamena uspesne nalinkovani
	"autocmd filetype cpp nnoremap <F4> :wa <bar> exec '!cd .. && make recompile'<CR>
	"autocmd filetype cpp nnoremap <F5> :wa <bar> :make rebuild <bar> :ConqueGdbVSplit bin/%:r<CR>

	" build
	"autocmd filetype cpp nnoremap <F4> :wa <bar> exec '!make rebuild'<CR>
	autocmd filetype cpp nnoremap <F4> :wa <bar> exec '!make clean && make -j$(nproc)'<CR>
	" build and debug
	" podminkou je, ze se vystup kompilace musi jmenovat program, aby to bylo
	" univerzalni
	"autocmd filetype cpp nnoremap <F5> :wa <bar> exec '!make rebuild' <bar>
	"autocmd filetype cpp nnoremap <F5> :wa <bar> exec '!make clean && make -j' <bar>
	"			\ :ConqueGdbVSplit build/program<CR>
augroup END
