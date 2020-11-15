"gruvbox config
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"color setup
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi link jsGlobalObjects GruvboxAqua

" Lighline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'modified' ] ],
      \   'right': [ [ 'linter_errors', 'linter_warnings', 'linter_infos'],
      \              [ 'percent','lineinfo'  ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
      " \   'luastatus': 'LspStatus',
" let g:lightline.component_expand = {
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \ }
" let g:lightline.component_type = {
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \ }
" function! LspStatus() abort
"   if luaeval('#vim.lsp.buf_get_clients() > 0')
"     return luaeval("require('lsp-status').status()")
"   endif
"   return ''
" endfunction

" ALE config
let g:ale_fixers = {
 \ 'javascript': ['prettier','eslint'],
 \ 'typescript': ['prettier','eslint']
 \ }
let g:ale_disable_lsp = 1
let g:ale_virtualtext_cursor = 1
let g:ale_fix_on_save = 1

" Lsp
" let g:completion_enable_snippet = 'UltiSnips'
let g:diagnostic_enable_virtual_text = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

" Lsp setup
luafile ~/.vim/lsp.lua

autocmd BufEnter * lua require'completion'.on_attach()

nnoremap <silent> gd :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <F2> lua vim.lsp.buf.rename()<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

" lua vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
" lua vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
" lua vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

" Prettier
let g:prettier#autoformat = 1
let prettier = {
      \ 'html': 1,'javascript': 1,'typescript': 1,
      \ 'css': 1,'less': 1,'scss': 1,
      \ 'json': 1,'graphql': 1,'markdown': 1,'vue': 1,'yaml': 1
      \}
nnoremap <silent><expr> <A-f> has_key(prettier,&filetype) ? ":Prettier<CR>" :
      \":lua vim.lsp.buf.formatting()<CR>"
nnoremap <silent><expr> <A-F> has_key(prettier,&filetype) ? ":Prettier<CR> :w<CR>" :
      \":lua vim.lsp.buf.formatting()<CR> :w<CR>"

" Whitespaces color
let g:better_whitespace_guicolor='#3c3836'

" Indent config
let g:indentLine_enabled = 0
let g:indentLine_char = '|'
nnoremap <silent> <F3> :call CheckIndent()<CR>

function CheckIndent()
  set list!
  if exists("b:indentLine_enabled") && b:indentLine_enabled
    set nolist
    exec "IndentLinesDisable"
  else
    set list
    exec "IndentLinesEnable"
  endif
endfunction

" Rainbow config
let g:rainbow_active = 1

" Comment Tool
nmap <silent> <C-\> <Plug>TComment_gcc
vmap <silent> <C-\> <Plug>TComment_gc

" visual-multi
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-R>'
let g:VM_maps["Add Cursor At Pos"] = '<C-Space>'
let g:VM_maps["Reselect Last"] = 'g<C-Space>'
let g:VM_maps["Add Cursor Down"] = '<C-A-J>'
let g:VM_maps["Add Cursor Up"] = '<C-A-K>'
let g:VM_maps['Select All']  = '<A-n>'
let g:VM_maps['Visual All']  = '<A-n>'
let g:VM_silent_exit = 1
let g:VM_skip_empty_lines = 1
let g:VM_exit_on_1_cursor_left = 1

nnoremap <silent><expr> <C-L> CheckVM() ? "<Right>" : "<C-L>"
nnoremap <silent><expr> <C-K> CheckVM() ? "<Up>" : ":lua vim.lsp.buf.signature_help()<CR>"
function CheckVM()
  return VMInfos() != {}
endfunction

nnoremap <silent> <M-C-F> :set opfunc=CtrlSFSearch<CR>g@
function! CtrlSFSearch(type)
  exec 'normal! `[v`]y'
  let @/ = @"
  let s = substitute(@/,' ','\\ ','g')
  exec "CtrlSF -hidden -L ".s
endfunction

"fzf config
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }

let g:gitgutter_map_keys = 0

nmap <A-\> :G<CR>
nmap \v :Gvdiffsplit!<CR>
nmap \V :Gvdiffsplit 
nmap \<Tab> <Plug>(GitGutterPreviewHunk)
nmap \s <Plug>(GitGutterStageHunk)
nmap \u <Plug>(GitGutterUndoHunk)

nmap \l :diffget //3<CR>
nmap \j <Plug>(GitGutterNextHunk)
nmap \k <Plug>(GitGutterPrevHunk)

nnoremap \c :Commits<CR>
nnoremap \C :BCommits<CR>
nnoremap \t :GTags<CR>
nnoremap \b :GBranches<CR>

nmap <silent><expr> \h &diff ? ":diffget //2<CR>" : ":History<CR>"
nmap <silent><expr> \l &diff ? ":diffget //3<CR>" : ":Lines<CR>"

noremap <C-P> :GFiles<CR>
nnoremap <A-p> :Files<CR>

nnoremap \b :Buffers<CR>
nnoremap \r :Rg<CR>
nnoremap \m :Marks<CR>
nnoremap \w :Windows<CR>
nnoremap \; :History:<CR>
nnoremap \/ :History/<CR>

imap <C-P> <Plug>(fzf-complete-path)
imap <C-F> <Plug>(fzf-complete-file)
inoremap <expr> <C-L> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" UndoTree  mapping
nnoremap <silent> <A-u> :call UndoTreeVisible()<CR>
function UndoTreeVisible()
  if undotree#UndotreeIsVisible()
    call undotree#UndotreeHide()
  else
    call undotree#UndotreeShow()
    call undotree#UndotreeFocus()
  endif
endfunction

"Sideways
nnoremap <silent> <A-h> :SidewaysLeft<CR>
nnoremap <silent> <A-l> :SidewaysRight<CR>

" Emmet
let g:user_emmet_leader_key='\'

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
