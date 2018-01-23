syn on
set hlsearch
set nowrap
set ts=4 sw=4
set expandtab!
set sts=4
set bs=2
set smartindent
set incsearch
set laststatus=2
set ignorecase
set smartcase
set nu
set wrap linebreak textwidth=0
set hidden

set statusline=[%n]\ %<%.200F\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

" relative paths
set autochdir

colorscheme elflord

set list listchars=tab:→\ ,trail:·

:nmap <C-N><C-N> :set invnumber<CR>
nmap ,l :set invlist<CR>
nmap ,p :set invpaste<CR>

" select all in visual mode
nmap ,s ggVG

map ,r :write!<cr>:call GoToTheTest()<cr>:! rtk_test -h -c %<cr>
:map! caps-lock <Esc>
let loaded_matchparen = 0
:hi MatchParen cterm=inverse
:hi MatchParen ctermfg=black
:hi MatchParen ctermbg=yellow
:hi MatchParen cterm=reverse

au BufRead,BufNewFile *.html set filetype=mason
au BufRead,BufNewFile *.fo set filetype=mason

:map ,ca :!~/usealiases<CR>
map ,b :BufExplorer<cr>

setlocal foldmethod=indent
set foldlevel=99

function BlameLocal()
    let line_max = line('.') + 50
    if line_max > line('$')
        let line_max = line('$')
    endif
    return 'git blame -L' . line('.') . ',' . line_max . ' ' . expand('%')
endfunction

nmap ,w :ec system(BlameLocal())<cr>
