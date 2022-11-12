call plug#begin()
Plug 'junegunn/fzf',{'do':{ -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

set hidden
set number
set mouse=a
set inccommand=split
set splitbelow
colorscheme industry

"Config basica nerdTree

set encoding=UTF-8
"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''


"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
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

"Config do terminal
" Mude para o modo normal com o esc
tnoremap <Esc> <C-\><C-j>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://bash
  resize 15
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>
"Fecha a janela que estiver selecionada mas nao salva
nnoremap <s-j> :bd! <CR>
