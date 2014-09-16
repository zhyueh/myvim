" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

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

filetype plugin on
filetype indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
set nobackup
set nowb
set noswapfile

set sw=4
set ts=4
set expandtab

colorscheme elflord

set hlsearch

autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete

" for php check syntax
autocmd FileType php setlocal makeprg=php\ -l\ % "\ |\ grep\ 'PHP Parse error'
"autocmd FileType php setlocal shellpipe=>
"autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd BufWritePost *.php,*.phps :make

"set spell

" for pathogen
execute pathogen#infect()

map <F4> :NERDTreeMirror<CR>
map <F4> :NERDTreeToggle<CR>
let Tlist_Use_Right_Window=1
map <F3> :TlistToggle<CR>

"set gfn=Monospace\ 11
"if has("gui_running")
"    set guioptions-=T
"    let psc_style='cool'
"    colorscheme ps_color
"else
"    set background=dark
"    colorscheme zellner
"endif "Some nice mapping to switch syntax (useful if one mixes different languages in one file)
"
"map 1 :set syntax=cheetah
"map 2 :set syntax=xhtml
"map 3 :set syntax=python
"map 4 :set ft=javascript
"map $ :syntax sync fromstartautocmd BufEnter * :syntax sync fromstart"Highlight current
"if has("gui_running")
"	set cursorline
"	hi cursorline guibg=#333333
"	hi CursorColumn guibg=#333333
"endif "Omni menu colors
"hi Pmenu guibg=#333333
"hi PmenuSel guibg=#555555 guifg=#ffffff
