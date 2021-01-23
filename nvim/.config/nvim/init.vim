set nu
inoremap jk <Esc>
nnoremap <CR> G
syntax on
set tabstop=4 shiftwidth=4 expandtab
set autoindent smartindent
colorscheme mountain

call plug#begin("~/.config/nvim/plugged")

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

call plug#end()
