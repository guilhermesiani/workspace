set exrc
set secure

set nocompatible " be iMproved, required
filetype off " required

set completeopt=longest,menuone
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
let g:netrw_localrmdir='rm -rf'

set path+=**
set wildmenu

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Line numbers
"set number
set number relativenumber
set nu rnu

" Search result highlighting
set hlsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-test/vim-test'
Plug 'yggdroot/indentline'
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

colorscheme gruvbox
set background=dark    " Setting dark mode

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//

set colorcolumn=80
set backspace=indent,eol,start

let g:ale_lint_on_save = 1

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Mouse support
set mouse=a

" Prevent crashs when use multi-cursor
set nolazyredraw

" Force syntax
syntax on

" Gutentags config
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" vim-test config
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Indent line config
let g:indentLine_color_term = 239

" Java Autocomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
if index(['java'], &filetype) != -1
    nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    nmap <F5> <Plug>(JavaComplete-Imports-Add)
    imap <F5> <Plug>(JavaComplete-Imports-Add)
    nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
    imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
endif
