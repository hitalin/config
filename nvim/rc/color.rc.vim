syntax enable

" color scheme {{{
colorscheme gotham256
let g:lightline = { 'colorscheme': 'gotham' }
let g:lightline = { 'colorscheme': 'gotham256' }
"}}}

" True color {{{
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"}}}

" Background transparent {{{
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
"}}}
