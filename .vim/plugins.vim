call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'gruvbox-community/gruvbox'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Completion && LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'

"Completion
# Plug 'aca/completion-tabnine', { 'do': './install.sh' }

" Debug
" Plug 'puremourning/vimspector'

"Eslint
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

"Buffer Search
Plug 'dyng/ctrlsf.vim'

"Formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ }

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comments
Plug 'tomtom/tcomment_vim'


" Syntax highlighting
Plug 'pangloss/vim-javascript', {
      \ 'for': ['javascript','typescript'],
      \ }
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'

" Indent and highlighting
" Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'

" Vim interface
Plug 'itchyny/lightline.vim'

" Vim tools
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'

" Text tools
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'

" Other plugins
Plug 'tpope/vim-obsession'
Plug 'lilydjwg/colorizer'
Plug 'AndrewRadev/sideways.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'

" Js Plugins
" Plug 'heavenshell/vim-jsdoc', {
"       \ 'for': ['javascript', 'javascript.jsx','typescript'],
"       \ 'do': 'make install'
"       \}

call plug#end()
