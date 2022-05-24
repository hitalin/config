" FileType {{{
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.tsx set filetype=typescript
au BufNewFile,BufRead *.toml set filetype=toml
"}}}

" Indentation settings {{{
au Filetype html setlocal ts=2 sts=2 sw=2
au Filetype css setlocal ts=4 sw=4 sts=0
au Filetype javascript setlocal ts=2 sw=2 et
au Filetype rust setlocal ts=4 sts=4 sw=4
au Filetype python setlocal ts=4 sts=4 sw=4
au Filetype solidity setlocal ts=4 sts=4 sw=4
au Filetype rst  setlocal ts=3 sts=3 sw=3
au Filetype diff setlocal ts=4 sts=4 sw=4 noexpandtab
" }}}
