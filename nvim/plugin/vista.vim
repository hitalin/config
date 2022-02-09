if dein#tap('vista.vim')
  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction

  set statusline+=%{NearestMethodOrFunction()}

  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

  nmap <silent> <C-f><C-v> :<C-u>Vista coc<CR>
  nmap <silent> <C-f><C-s> :<C-u>Vista finder coc<CR>
endif
