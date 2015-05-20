" Removes trailing spaces
function StripTrailingWhitespaces()
  %s/\s*$//
  ''
:endfunction
command! StripTrailingWhitespaces call StripTrailingWhitespaces()
autocmd FileWritePre * :call StripTrailingWhitespaces()
autocmd FileAppendPre * :call StripTrailingWhitespaces()
autocmd FilterWritePre * :call StripTrailingWhitespaces()
autocmd BufWritePre * :call StripTrailingWhitespaces()
