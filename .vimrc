" Set nocompatible
filetype off                  " For nerdTree
filetype plugin on " For NERDCommenter

autocmd FileType javascript nnoremap <c-o> viw :s/\v(\s*)(.*)/\1console.log\('==> \2', \2\);/  <enter> :nohl <enter><CR>
autocmd FileType javascript nnoremap <c-j> viw :s/\v(\s*)(.*)/\1console.log\('==> \2', JSON.stringify(\2\)\);/  <enter> :nohl <enter><CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set backspace=indent,eol,start

Plugin 'gmarik/Vundle.vim'
Plugin 'ap/vim-css-color'
Plugin 'xsbeats/vim-blade'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Bundle 'scrooloose/nerdtree'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/nerdcommenter'
Bundle 'groenewege/vim-less'
Bundle 'cocopon/lightline-hybrid.vim'
Bundle 'tpope/vim-fugitive'
Plugin 'vim-vdebug/vdebug'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-syntastic/syntastic'
Plugin 'zxqfl/tabnine-vim'

set backspace=indent,eol,start

call vundle#end()

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'airblade/vim-gitgutter'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'vim-airline/vim-airline'

Plug 'lumiliet/vim-twig'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plugin 'burnettk/vim-angular'


" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" whitespace cleanup
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" ctrl+p show dotfiles
let g:ctrlp_show_hidden = 1

" JS autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set rtp+=/usr/local/opt/fzf

" Turn line numbering on. Turn it off with "set nonu:"
set number

" Set syntax coloring
syntax enable

" Case  insensitive search
set ic

" Highlight Search
set hls

" Wrap text instead of being on one line
set lbr

" Use system clipboard for copy and paste
" uncomment on linux
set clipboard=unnamedplus

" uncomment if on macOS
"set clipboard=unnamed

set paste
set laststatus=2
set t_Co=256
noh

function! TabLabel()
	let cwd = fnamemodify('.', ':p')
	return cwd
	"return ('' != expand('%:T') ? expand('%:T') : '[No Name]')
endfunction
set title titlestring=%{TabLabel()}

" Map to ctrl + e to NERDTree
map <C-e> :NERDTreeToggle <CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
"map <leader>y "0y
"map <leader>p "0p
vnoremap <leader>p "_dP

" NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=[ '\~$', '\.git', '\.sw']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeWinSize=60

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'modified', 'filename' ] ],
      \   'right': [ ['lineinfo'],
      \             ['percent'],
      \             ['filetype'] ]
      \ },
	  \ 'component': {
	  \   'lineinfo': ' %3l:%-2v',
	  \ },
	  \ 'component_function': {
	  \   'filename': 'MyFilename',
	  \   'readonly': 'MyReadonly',
	  \   'fugitive': 'MyFugitive',
      \   'gitbranch': 'fugitive#head',
	  \ },
	  \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '', 'right': '' }
	  \ }

function! MyFilename()
    return ('' != expand('%:T') ? expand('%:T') : '[No Name]')
endfunction

function! MyModified()
    let lastModified=strftime('%T',getftime(expand('%')))
    return lastModified
endfunction

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
set mouse=a
set mousehide
set cursorline

" Change colorscheme from default to hybrid
colorscheme hybrid "monokai
hi Normal ctermbg=NONE
let g:lightline.colorscheme = 'hybrid'

autocmd VimEnter * echo "Welcome back Cameron! You are amazing!"
set shortmess+=I

" Map ctrl + s to :w
"inoremap <C-s> <esc>:w<cr>
"nnoremap <C-s> :w<cr>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Map ctrl + q to :Q
inoremap <C-Q> <esc>:q<cr>
nnoremap <C-Q> :q<cr>

" Map ctrl + w to vertical split
inoremap <C-w> <esc>:vsplit<cr>
nnoremap <C-w> :vsplit<cr>
vmap <Tab> >gv
vmap <S-Tab> <gv


" Map ctrl + p to :FZF
inoremap <C-p> <esc>:FZF<cr>
nnoremap <C-p> :FZF<cr>
let g:hybrid_reduced_contrast = 1

" Remap pane shifting
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" silver searcher with Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Uncomment if on Linux
set background=dark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
