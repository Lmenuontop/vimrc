
set nu
set rnu
syntax on
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab

packadd! matchit

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
