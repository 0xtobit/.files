"for pathogen
syntax on
execute pathogen#infect()
filetype plugin indent on

set nu "number lines
source $VIMRUNTIME/colors/fu.vim "colour theme not scheme
"source $VIMRUNTIME/colors/blazer.vim "colour theme not scheme
set mouse=a "mouse functionality (like gvim!)
set tw=0 "no wrapping text onto the next line
set listchars+=precedes:<,extends:> "when nowrap is set-has carroots when a line extends beyond the edge
set backspace=indent,eol,start "makes backspace work in Vim 7.3
set hls "highlighting!
set ruler "for cursor position in the bottom right corner
set incsearch "search begins as soon as you start typing instead of waiting for <ENTER>
set ai! "auto indent

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

set expandtab "no tab characters, spaces instead except with makefiles
autocmd BufReadPost,FileReadPost,BufNewFile [Mm]ake{file,} setlocal noexpandtab

"more tabs for my python style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

"==================================================
"rebinds
"==================================================
"traverse ?buffer? instead of line
nnoremap gk k
nnoremap gj j
nnoremap k gk
nnoremap j gj

"scroll buffer with better names
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>
vnoremap <C-J> <C-E>
vnoremap <C-K> <C-Y>

"change tabs directionaly with ^h and ^l
nnoremap <C-h> gT
nnoremap <C-l> gt

"stretch buffers
nnoremap + <C-W>+
nnoremap - <C-W>-

"alternate keys for indenting/unindenting
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>

"rebind for space: prime real estate wasted by default
nnoremap <Space> .

"highlighting extra whitespace from max
hi def link whiteSpaceError Error
autocmd Syntax * syn match whiteSpaceError "\(\S\| \)\@<=\t\+"
autocmd Syntax * syn match whiteSpaceError "\s\+\%#\@<!$"
