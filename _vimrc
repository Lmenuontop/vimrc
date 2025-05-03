
set number
color desert
syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4

set wildmenu
set wildoptions=pum
set hidden
set wildignore=*.exe,*.dll,*.pdb

set guifont=Cascadia_Mono:h18
set guioptions-=m
set guioptions-=T
set guioptions-=r

set cursorline
set spell
set is
set ignorecase
set smartcase
set ruler
set gp=git\ grep\ -n
set backupcopy=yes

packadd! matchit

map <F2> :bp<CR>
imap <F2> <Esc>:bp<CR>
tmap <F2> <C-W>:bp<CR>

map <F3> :bn<CR>
imap <F3> <Esc>:bn<CR>
tmap <F3> <C-W>:bn<CR>

map <F4> :bd<CR>
imap <F4> <Esc>:bd<CR>

map <F5> :ls<CR>
imap <F5> <Esc>:ls<CR>
tmap <F5> <C-W>:ls<CR>

" Copy current file path
map <F6> :let @+ = fnamemodify(@%, ":p")<CR>
imap <F6> <Esc>:let @+ = fnamemodify(@%, ":p")<CR>

" Go to previous/next quickfix result (for example, useful for going through :grep or
" :vimgrep results)
map <F7> :cp<CR>
imap <F7> <Esc>:cp<CR>
map <F8> :cn<CR>
imap <F8> <Esc>:cn<CR>

map <F12> :term++curwin<CR>
imap <F12> <Esc>:term++curwin<CR>
tmap <F12> <C-W>:term++curwin<CR>

set nobackup
set nowb
set noswapfile
"lsp and vim commentary:
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'tpope/vim-commentary'
call plug#end()

"lsp

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"disable diagnostics cus yes
set clipboard=unnamedplus
let g:lsp_diagnostics_enabled = 0
