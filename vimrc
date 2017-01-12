set encoding=utf-8
scriptencoding utf-8
"==============================================================================
"                              NeoBundle Setup
"==============================================================================
if has('vim_starting')
    set nocompatible               " Be iMproved

    "Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"==============================================================================


"==============================================================================
"                              List of Plugins
"==============================================================================
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bruno-/vim-ruby-fold'
call neobundle#end()
"==============================================================================


"==============================================================================
"                          Lightline configuration
"==============================================================================

let g:lightline = {
    \ 'colorscheme' : 'solarized',
    \ }
set laststatus=2
set guifont=Inconsolata-dz\ for\ Powerline
if !has('gui_running')
    set t_Co=256
endif
"==============================================================================

"==============================================================================
"                           NERDTree configuration
"==============================================================================

let g:NERDTreeWinPos = "right" " make NERDTree open on the right
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
"==============================================================================

"==============================================================================
"              Set up solarized colors and syntax highlighting
"==============================================================================
syntax enable "turn on syntax highlighting
set background=dark
colorscheme solarized
"==============================================================================

"==============================================================================
"                            Ctrlp configuration
"==============================================================================
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*
"==============================================================================
"
set relativenumber "use relative line numbers
set number " use actual line number instead of 0 (with relative)

set mouse=a "mouse functionality (like gvim!)
set tw=0 "no inserting \n to wrap text onto the next line
set listchars+=precedes:<,extends:> "when nowrap is set-has carroots when a line extends beyond the edge
set backspace=indent,eol,start "makes backspace work in Vim 7.3
set hls "highlighting!
set ruler "for cursor position in the bottom right corner
set incsearch "search begins as soon as you start typing instead of waiting for <ENTER>
set ai! "auto indent
set hidden "allow switching of buffers with unsaved changes

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

set expandtab "no tab characters, spaces instead except with makefiles
autocmd BufReadPost,FileReadPost,BufNewFile [Mm]ake{file,} setlocal noexpandtab

"more tabs for my python style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

autocmd Filetype ruby call SetRubyOptions()
autocmd Filetype eruby call SetRubyOptions()

function SetRubyOptions()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set tw=120
endfunction

autocmd Filetype javascript call SetJavaScriptOptions()

function SetJavaScriptOptions()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set tw=120
endfunction


autocmd Filetype gitcommit call SetGitCommitOptions()
function SetGitCommitOptions()
    set spell
endfunction

" Zsh style tab completion when opening files
set wildmode=longest,list,full
set wildmenu

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

"change buffers directionaly with ^h and ^l
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

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

nnoremap <F1> :NERDTree<CR>

"highlighting extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/

"for copy and paste to work on mac osx
set clipboard=unnamed
