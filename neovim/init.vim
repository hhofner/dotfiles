" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

" Make sure you use single quotes

	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'junegunn/vim-easy-align'

  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " Show changes in file "
  Plug 'mhinz/vim-signify'

	" Any valid git URL is allowed
	Plug 'https://github.com/junegunn/vim-github-dashboard.git'

	" Multiple Plug commands can be written in a single line using | separators
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

	" Using a non-default branch
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

	" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
	Plug 'fatih/vim-go', { 'tag': '*' }

	" Plugin options
	Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

	" Plugin outside ~/.vim/plugged with post-update hook
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	Plug 'tpope/vim-sensible'

  " Xcode colors, hopefully "
  Plug 'arzg/vim-colors-xcode'

	" Visually display indent levels
	Plug 'nathanaelkane/vim-indent-guides'

	" REACT JS STUFF ~~~~~~~~~~~~~~~~~~~
	" Typescript Syntax
	Plug 'leafgarland/typescript-vim'
	" For JSX
	Plug 'maxmellon/vim-jsx-pretty'
	" For Typescript JSX
	Plug 'peitalin/vim-jsx-typescript'

  " For relative numbers, but a bit smarter "
  Plug 'ericbn/vim-relativize'

  " Typescript intellisense "
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " NERDCommenter, to easily comment out lines
  Plug 'preservim/nerdcommenter'

  " Goyo Vim, for `concentration mode` typing
  Plug 'junegunn/goyo.vim'

  " vim wiki 
  Plug 'vimwiki/vimwiki'

call plug#end()
"""""""""""""""""""" COLORS AND SCHEMES AND THINGS
""""""""""""""""""""""""""""
colors zenburn


" Update time for vim-signify "
set updatetime=100

" For showing relative numbers (vim-relativize) "
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Nicer NERDTree config "
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Format on Save
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Change the <leader> key to ',' and add a visual queue of when pressed
" Remember: need to press the next command within 1000ms (default)
let mapleader = ","
set showcmd
