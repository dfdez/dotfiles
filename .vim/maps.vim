let mapleader=" "

nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>c :close<CR>
nnoremap <Leader>C :close!<CR>
nnoremap <Leader>o :Explore<CR>

nnoremap <Leader><Tab> :tabn<CR>
nnoremap <Leader><S-Tab> :tabp<CR>
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 :tablast<CR>

nnoremap <Leader>e :tabedit \| Explore<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>
nnoremap <Leader>W :bufdo bd<CR>

nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l

nnoremap <Leader>H <C-W>H
nnoremap <Leader>J <C-W>J
nnoremap <Leader>K <C-W>K
nnoremap <Leader>L <C-W>L

nnoremap <Leader>t <C-W>T
nnoremap <Leader>T :tab ball<CR>

nnoremap <Leader>+ <C-W>5+
nnoremap <Leader>- <C-W>5-
nnoremap <Leader>> <C-W>5>
nnoremap <Leader>< <C-W>5<

nnoremap <Leader>v :vert new<CR>
nnoremap <Leader>s :new<CR>
"nnoremap <Leader>V :vert term<CR>
"nnoremap <Leader>S :term<CR>
nnoremap <Leader>V :vsplit \| term<CR>
nnoremap <Leader>S :10split \| term<CR>

nnoremap <Leader>d "_dd

nnoremap <Leader>m :marks<CR>
nnoremap <Leader>M :delm! \| delm a-z0-9<CR>

nnoremap ,, ,
nnoremap ,<Tab> :bn<CR>
nnoremap ,<S-Tab> :bp<CR>
nnoremap ,e :e 
nnoremap ,b :buffer 
nnoremap ,B :buffers<CR>
nnoremap ,w :bd<CR>
nnoremap ,W :bd!<CR>

" Replace
nnoremap <Leader>r :s/\<<C-R>=expand("<cword>")<CR>\>/
nnoremap <Leader>R :s/<C-R>=expand("<cword>")<CR>/

vnoremap <Leader>r y:s/\<<C-R>"\>/
vnoremap <Leader>R y:s/<C-R>"/

" Yank and paste to + register
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

vnoremap <Leader>y "+y
vnoremap <Leader>p "_d"+P
vnoremap <Leader>d "_d

" Move or copy current line
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==

nnoremap <A-J> Yp
nnoremap <A-K> YP

vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gva

vnoremap <A-J> y'>op
vnoremap <A-K> y'<Op

nnoremap <silent> <A-=> :+tabmove<CR>
nnoremap <silent> <A--> :-tabmove<CR>

nnoremap <silent> <A-c> :set cursorcolumn!<CR>
nnoremap <silent> <A-C> :set cursorline!<CR>

" Execute macro over visual selection
vnoremap @ :<C-U>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Find selected text
vnoremap f y/<C-R>"<CR>

" Return visual after shifting text
vnoremap > >gv
vnoremap < <gv

"tnoremap <ESC> <C-W>N
tnoremap <ESC> <C-\><C-N>

"Insert completion
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-N>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ "\<C-P>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  echo !col || getline('.')[col - 1]  =~ '\s'
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
