runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72

execute pathogen#infect()
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_mode_map = { 'mode': 'active',     
      \ 'active_filetypes': ['scss','javascript']} 

