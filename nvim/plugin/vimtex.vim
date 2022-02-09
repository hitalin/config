if dein#tap('vimtex')
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_quickfix_mode = 0
  let g:vimtex_quickfix_autoclose_after_keystrokes = 1
  let g:vimtex_compiler_latexmk_engines =  { '_' : '-pdfdvi' }
  let g:vimtex_compiler_latexmk = {
        \ 'backend': 'nvim',
        \ 'background' : 0,
        \ 'build_dir' : '',
        \ 'continuous' : 1,
        \ 'options' : [
        \   '-pdfdvi',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_view_general_viewer = '/usr/bin/zathura'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif
