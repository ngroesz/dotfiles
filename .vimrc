scriptencoding utf-8
set encoding=utf-8

syn on
set hlsearch
set nowrap
set expandtab
set bs=2
set smartindent
set incsearch
set laststatus=2
set ignorecase
set smartcase
set nu
set wrap linebreak textwidth=0
set hidden
set visualbell
set re=0

let mapleader = ","

set statusline=[%n]\ %<%.200F\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

" relative paths
set autochdir

colorscheme elflord

function UseTabs()
  execute "set noexpandtab"
  execute "set nolist"
endfunction

function UseSpaces()
  execute "set expandtab"
  execute "set list listchars=trail:·,precedes:←,extends:→"
endfunction

nmap <leader>t :call UseTabs()<CR>
nmap <leader>s :call UseSpaces()<CR>

nmap <C-N><C-N> :set invnumber<CR>
nmap <leader>l :set invlist<CR>
nmap <leader>p :set invpaste<CR>

" select all in visual mode
nmap <leader>a <esc>ggVG<CR>

:map! caps-lock <Esc>
let loaded_matchparen = 0
:hi MatchParen cterm=inverse
:hi MatchParen ctermfg=black
:hi MatchParen ctermbg=yellow
:hi MatchParen cterm=reverse

setlocal foldmethod=indent
set foldlevel=99

function BlameLocal()
    let line_max = line('.') + 50
    if line_max > line('$')
        let line_max = line('$')
    endif
    return 'git blame -L' . line('.') . ',' . line_max . ' ' . expand('%')
endfunction

function! SetTabSize(size)
    execute "set tabstop=".a:size
    execute "set shiftwidth=".a:size
    execute "set softtabstop=".a:size
endfunction
command! -nargs=1 Sts call SetTabSize(<f-args>)

nmap <leader>w :ec system(BlameLocal())<cr>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nnoremap <F6> :bp<CR>
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>

" CtrlP FTW
set runtimepath^=~/.vim/bundle/ctrlp.vim

nmap <leader>f :CtrlP<CR>
nmap <leader>e :BufExplorer<CR>

let g:ctrlp_working_path_mode = 'ra'

call UseSpaces()
call SetTabSize(2)
