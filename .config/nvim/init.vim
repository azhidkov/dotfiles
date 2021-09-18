" nocompatible has to be the first  of all
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""
" Disable syntax highlighting
syntax off

" Set utf8 as standart encoding and en_US as the standart language
set encoding=utf8
set fileencoding=utf-8

" Use Unix as the standart file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git, etc
set nobackup
set nowb
set noswapfile

