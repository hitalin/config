" Set statusline {{{
set laststatus=2
"}}}

" Display line number {{{
set nu
"}}}

" Display ruler {{{
set ruler
"}}}

" Highlight a matching opening or closing parenthesis, square bracket or a curly brace {{{
set showmatch
"}}}

" Enable incsearch {{{
set incsearch
"}}}

" Switch on highlighting the last used search pattern {{{
set hlsearch
"}}}

" Clipboard {{{
" Accessing the system clipboard
set clipboard&
set clipboard=unnamedplus
" Avoid automatic indentation
autocmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif
" Enable mouse in terminal
if has('mouse')
  set mouse=a

  if !has('nvim')
    if has('mouse_sgr')
      set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
      set ttymouse=sgr
    else
      set ttymouse=xterm2
    endif
  endif

endif
"}}}

" GUI configuration {{{
hi Visual cterm=reverse
hi Search cterm=reverse ctermfg=yellow
hi VertSplit ctermbg=NONE guibg=NONE

if !has('gui_running')
  augroup term_vim_c_space
    autocmd!
    autocmd VimEnter * map <Nul> <C-Space>
    autocmd VimEnter * map! <Nul> <C-Space>
  augroup END
endif
"}}}

" Fastest way to move buffer {{{
nnoremap <silent><Left> :bp<CR>
nnoremap <silent><Right> :bn<CR>
nnoremap <silent><C-Space> :call BufferDeleteExceptFiler()<CR>
"}}}

" Display another buffer when current buffer isn't saved. {{{
set hidden
"}}}

" Do not create swap files {{{
set noswapfile
"}}}

" Spell configuration {{{
"autocmd BufRead,BufNewFile *.md  set spelllang=en_us,cjk spell
"autocmd BufRead,BufNewFile *.tex set spelllang=en_us,cjk spell
"hi clear SpellBad
"hi clear SpellCap
"hi clear SpellLocal
"hi SpellBad cterm=underline ctermfg=LightBlue
"hi SpellCap cterm=underline ctermfg=LightBlue
"hi SpellLocal cterm=underline ctermfg=LightBlue
"}}}

" Comfortable Japanese input {{{
"" https://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-h> <Left>
"imap <C-l> <Right>

"nnoremap あ a
"nnoremap い i
"nnoremap う u
"nnoremap え e
"nnoremap お o
"nnoremap っd dd
"nnoremap っy yy
"nnoremap し” ci"
"nnoremap し’ ci'
"nnoremap せ ce
"nnoremap で de
"inoremap <silent> っj <ESC>
"nnoremap っz zz
"nnoremap ・ /
"}}}

" Leave insert mode and turn off Japanese input {{{
"autocmd InsertLeave * :call system('${zenhan} 0')
"autocmd CmdlineLeave * :call system('${zenhan} 0')
"}}}

" Encoding {{{
set encoding=UTF-8
scriptencoding=UTF-8
"}}}

" Tab {{{
set wildmenu
set wildmode=full

set expandtab
set smarttab
"}}}

" Leader {{{
let mapleader = "\<Space>"
let localleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <leader>q :q<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
"}}}

" Undo {{{
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
endif
"}}}
