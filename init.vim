call plug#begin()
Plug 'junegunn/fzf',{'do':{ -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

set hidden
set number
set mouse=a
set inccommand=split
set splitbelow
colorscheme dracula
let java_highlight_functions="style"
"Config basica nerdTree

set encoding=UTF-8
"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"Mapeamento de comandos
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <s-b> :NERDTreeRefreshRoot<cr>
nnoremap <c-p> :Files<CR>
nnoremap <c-s> :w <CR>
nnoremap <c-z> :u <CR>
nnoremap <c-w> :q <CR>
nnoremap <F7> :qa! <CR>
"Compilar e executar java
nnoremap <F3> :!javac % <CR>
nnoremap <F4> :!java % <CR>
"Config do terminal"
" Mude para o modo normal com o esc
tnoremap <Esc> <C-\><C-j>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal'| :startinsert | endif
function! OpenTerminal()
  split term://bash
  resize 15
endfunction


nnoremap <c-j> :call OpenTerminal()<CR>
"Config Airline  
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


"Config coc-nvim
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"Config de espaço para autocompletar
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
"Config do airline para coc-nvim
let g:airline#extensions#coc#enable=0
let g:airline#extensions#coc#show_coc_status=1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%C(L%L)'
let airline#extensions#coc#stl_format_warn = '%C(L%L)'

