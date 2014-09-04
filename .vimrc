set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/nerdcommenter'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-fugitive'
Bundle 'itchyny/lightline.vim'
Bundle 'cocopon/lightline-hybrid.vim'
Bundle 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" JS autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Turn line numbering on. Turn it off with "set nonu:"
set number

" Set syntax on
syntax enable

" Case  insensitive search
set ic

" Highlight Search
set hls

" Wrap text instead of being on one line
set lbr

" Use system clipboard for copy and paste
set clipboard=unnamedplus
set laststatus=2
set t_Co=256
noh

" NerdTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'],
      \             ['percent'],
      \             ['filetype'] ]
      \ },
	  \ 'component': {
	  \   'lineinfo': ' %3l:%-2v',
	  \ },
	  \ 'component_function': {
	  \   'readonly': 'MyReadonly',
	  \   'fugitive': 'MyFugitive'
	  \ },
	  \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '', 'right': '' }
	  \ }

    function! MyReadonly()
		return &readonly ? '' : ''
	endfunction
	function! MyFugitive()
		if exists("*fugitive#head")
			let _ = fugitive#head()
			return strlen(_) ? ''._ : ''
		endif
		return ''
	endfunction

let g:indentLine_color_term = 243
let g:indentLine_char = '︙'   

" Change colorscheme from default to hybrid
colorscheme hybrid
hi Normal ctermbg=NONE

let g:lightline.colorscheme = 'hybrid'
