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

"Configs de espaço do tab"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Config basica nerdTree
set encoding=UTF-8
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap sys System.out.println();<Left> 
"Compilar codigo java
nnoremap <F2> :!javac % <CR>
"Formatar codigo
nnoremap <F3> :Format <CR>

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

"Config coc-nvim
" Comando <c-space> para aparecer as opções de completar.
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

" Comando para aceitar o valor que esta sendo completado
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Comando :Format para formatar o buffer.
command! -nargs=0 Format :call CocActionAsync('format')

set updatetime=300
set nobackup
set nowritebackup


"Config para criar arquivos .java com o nome da class
let nome = expand("%:r")
nnoremap <c-k> :echo nome<CR>
au BufNewFile * if &filetype == 'java' | :call setline(1,"class ".nome." {}") | endif


"Config airline
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_z=airline#section#create_right(['line %l/%L'])

