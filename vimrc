" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
execute pathogen#infect()

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set hlsearch
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number
"set spell
set ruler

"Solarized settings
set background=light
set t_Co=256
colorscheme solarized
"setlocal fo+=aw


"Autosave and Autoread
set autoread
set autowriteall
set noswapfile
set nobackup
au CursorHold,CursorHoldI * checktime
au CursorHold,CursorHoldI * silent! wa
set updatetime=2000
filetype plugin on
filetype indent off
let g:tex_flavor='latex'


"Persisten-undo magic
set undofile

"Disable Autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Latex PDF magic
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"Math with qalc
nnoremap <leader>m :.!~/bin/calc<Enter>
inoremap <leader>m <Esc>:.!~/bin/calc<Enter>
nnoremap <leader>i :read !latestimage<Enter>
nnoremap <leader>v :!feh '<cfile>'<CR>

"Tab for escape
nnoremap <Tab> <Esc>
nnoremap <S-Tab> ZZ 
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

"read spaces in path's
set isfname+=32

"save as root
nnoremap <leader>r :w !sudo tee % >/dev/null <CR>
