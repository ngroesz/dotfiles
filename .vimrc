source /usr/local/etc/vimrc_files/reasonably_stable_mappings.vim

syn on
set hlsearch
" no line wrap
set nowrap
set ts=4 sw=4
" do not expand tabs
set expandtab!
set sts=4
set bs=2
set smartindent
set incsearch
set laststatus=2
set ignorecase
set smartcase
set nu
set statusline=[%n]\ %.200F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P
set wrap linebreak textwidth=0

" relative paths
set autochdir

colorscheme elflord

nmap ,w :ec system('git blame -L'.line('.').',+50 '.expand('%'))<CR>

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
