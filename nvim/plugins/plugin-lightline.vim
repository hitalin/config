if dein#tap('lightline.vim')
  let g:lightline = {
        \ 'colorscheme' : 'gotham',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \             [ 'vista' ],
        \           ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gitbranch#name',
        \   'vista': 'NearestMethodOrFunction',
        \ },
        \ }

endif
