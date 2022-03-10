syntax enable                   " Enable syntax
let g:solarized_termcolors = 256    " Use 256 Colors (solarized)
let g:rehash256 = 1             " Use 256 Colors (molokai)
colorscheme molokai           " Color scheme
set background=dark

" Tab Policy
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number                      " Line Numbers
set showcmd                     " Show last command
set cursorline                  " Highlight line
set showmatch                   " Highlight matching braces

" Search
set incsearch                   " Search as chars are typed
set hlsearch                    " Highlight matches
nnoremap <leader><space> : nohlsearch<CR> " Turn off highlight
nnoremap <leader>s : syntax sync fromstart<CR> " Sync syntax

" Visual line movement
nnoremap j gj
nnoremap k gk

" Auto Indent
nnoremap <leader><tab> 0i<backspace><enter><esc>
nnoremap <leader><s-tab> 0xxxx
set smartindent                 " smart indent
set visualbell

au BufRead,BufNewFile *.aproj set filetype=aproj

