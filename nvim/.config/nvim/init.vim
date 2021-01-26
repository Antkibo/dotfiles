set nu
inoremap jk <Esc>
nnoremap <CR> G
syntax on
set tabstop=4 shiftwidth=4 expandtab
set autoindent smartindent
colorscheme mountain

" Strip file name from frame numbers on a json from aseprite
function! Aseprite()
    %s/\v\".*\s(\d+)\.aseprite/\"\1/g
endfunction

call plug#begin("~/.config/nvim/plugged")

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

call plug#end()
