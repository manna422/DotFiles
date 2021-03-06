" generic setting
set rnu
set nu
set hls
set nocompatible
set wildmenu

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

let mapleader = "\<Space>"

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'elixir-lang/vim-elixir'
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wikitopian/hardmode'

" au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
" au BufRead,BufNewFile *.eex set filetype=eelixir

call vundle#end()
filetype plugin indent on
syntax on

" map fuzzyfinder (CtrlP) plugin
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


" Remap window movement
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

function! WinMove(key)
let t:curwin = winnr()
exec "wincmd ".a:key
if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
        wincmd v
    else
        wincmd s
    endif
    exec "wincmd ".a:key
endif
endfunction

set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'

" Always show statusline
set laststatus=2

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" LEADER COMBOS
"
" toggle paste mode
nnoremap <leader>p :set paste!<CR>:set nu!<CR>:set rnu!<CR>

" run current buffer in python/node
autocmd BufNewFile,BufRead *.py nnoremap <leader>e :! clear; python %<CR>
autocmd BufNewFile,BufRead *.js nnoremap <leader>e :! clear; node %<CR>

" run current buffer interactively in ipython
autocmd BufNewFile,BufRead *.py nnoremap <leader>i :! clear; ipython -i %<CR>

" leader w - strip trailing whitespace
nnoremap <leader>w <Esc>:%s/\s\+$//<CR>

" togger nerd tree
nnoremap <leader>t <Esc>:NERDTreeToggle<CR>

" run screen
nnoremap <leader>q <Esc>:! screen<CR>


set ttyfast
" set nolazyredraw

