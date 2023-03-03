    call plug#begin()
Plug 'junegunn/fzf',{'do':{ -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

