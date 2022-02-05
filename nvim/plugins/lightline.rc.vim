if dein#tap('lightline.vim')
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \             [ 'cocstatus', 'currentfunction'],
        \             [ 'vista' ],
        \           ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gitbranch#name',
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction',
        \   'vista': 'NearestMethodOrFunction',
        \ },
        \ }

endif
