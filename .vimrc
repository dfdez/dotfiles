syntax on

" set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set nowrap
set smartcase
set ignorecase
" set noswapfile
" set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set mouse=a
set numberwidth=1
set showcmd
set ruler
set encoding=utf-8
set laststatus=2
set noshowmode
"set clipboard=unnamedplus
set updatetime=50
set splitbelow
set splitright
set shortmess+=c
set completeopt=menuone,noinsert,noselect
set background=dark
"Vim fzf
set path+=**
set lcs=tab:>\ ,space:·

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide().'.swp$'

so ~/.vim/maps.vim
so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Plugin maps
"function CheckFormat()
"  let formatopts = &formatoptions
"  let formatstatus = stridx(formatopts,"cro")
"  if formatstatus > -1
"    set formatoptions-=cro
"  else
"    set formatoptions+=cro
"  endif
"endfunction

"nnoremap <Leader>ç :call CheckFormat()<CR>
