let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

augroup MakefileTab
au!
au FileType make setlocal noexpandtab nosmarttab
augroup END
