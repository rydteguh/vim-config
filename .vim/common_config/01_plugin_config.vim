" Plugins are managed by Bundle. Once VIM is open run :BundleInstall to
" install plugins.
  call vundle#rc()

" Plugins requiring no additional configuration or keymaps
  Bundle "tomtom/tcomment_vim.git"
  Bundle "tpope/vim-endwise.git"
  Bundle "tpope/vim-fugitive.git"
  Bundle "tpope/vim-rake.git"
  Bundle "tpope/vim-repeat.git"
  Bundle "vim-ruby/vim-ruby.git"
  Bundle "vim-scripts/ruby-matchit.git"
  Bundle "tpope/vim-abolish.git"
  Bundle "mattn/emmet-vim"

 " Vim airline configs
  Bundle 'bling/vim-airline.git'
  let g:airline_powerline_fonts = 1

" Easy motion config
  Bundle "easymotion/vim-easymotion"

"Supertab code completion"
  Bundle "ervandew/supertab.git"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"

" CtrlP
  Bundle "kien/ctrlp.vim.git"
    nmap <Leader>b :<C-U>CtrlPBuffer<CR>
    nmap <Leader>t :<C-U>CtrlP<CR>
    nmap <C-b> :<C-U>CtrlPBuffer<CR>
    nmap <C-p> :<C-U>CtrlP<CR>
    nmap <Leader>T :<C-U>CtrlPTag<CR>

    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    if executable('ag')
      let g:ctrlp_use_caching = 0
      let g:ctrlp_user_command = 'ag %s -l -i --nocolor --nogroup -g ""'
    else
      " respect the .gitignore
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    endif

" Slim
  Bundle "slim-template/vim-slim.git"
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  Bundle "groenewege/vim-less.git"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  Bundle "mustache/vim-mustache-handlebars.git"
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Coffee script
  Bundle "kchmck/vim-coffee-script.git"
    au BufNewFile,BufRead *.coffee set filetype=coffee

" AG aka The Silver Searcher
  Bundle 'rking/ag.vim.git'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Bundle "majutsushi/tagbar.git"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  Bundle "tpope/vim-markdown.git"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  Bundle "scrooloose/nerdtree.git"
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>


" Tabular for aligning text
  Bundle "godlygeek/tabular.git"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    nmap <Leader>= :Tabularize /=<CR>
    vmap <Leader>= :Tabularize /=<CR>
    nmap <Leader>> :Tabularize /=><CR>
    vmap <Leader>> :Tabularize /=><CR>
    nmap <Leader>; :Tabularize /:<CR>
    vmap <Leader>; :Tabularize /:<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  Bundle "tpope/vim-unimpaired.git"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Bundle "scrooloose/syntastic.git"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }


" gundo for awesome undo tree visualization
  Bundle "sjl/gundo.vim.git"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  Bundle "tpope/vim-rails.git"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  Bundle "tpope/vim-surround.git"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Easy async RSpec running
  Bundle 'thoughtbot/vim-rspec'
  Bundle "tpope/vim-dispatch.git"
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

" MultipleCursor
  Bundle "terryma/vim-multiple-cursors.git"

" Blade syntax highlighting
  Bundle 'xsbeats/vim-blade'

" facebook
  Bundle 'mxw/vim-xhp'
  Bundle 'hhvm/vim-hack'
  autocmd FileType php set tabstop=4|set softtabstop=4|set shiftwidth=4
  autocmd FileType hack set tabstop=4|set softtabstop=4|set shiftwidth=4
  au BufEnter *.php set ai sw=4 ts=4 sta et fo=croql
  au BufEnter *.hh set ai sw=4 ts=4 sta et fo=croql


" php-cs-fixer (for indentation)
  Bundle 'stephpy/vim-php-cs-fixer'

" Fix indentation
  autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.js set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType less set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.less set ai sw=2 ts=2 sta et fo=croql
  au BufEnter *.css set ai sw=2 ts=2 sta et fo=croql

filetype plugin indent on
