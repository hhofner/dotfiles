" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  " Aligns things nicely -- mostly for writng and not coding
	Plug 'junegunn/vim-easy-align'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " Show changes in file "
  Plug 'mhinz/vim-signify'

	Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'

  " Quick changers
  Plug 'PyGamer0/font_changer.vim'
  Plug 'PyGamer0/colorscheme_changer.vim'

  Plug 'lukas-reineke/indent-blankline.nvim'
  " For relative numbers, but a bit smarter "
"  Plug 'ericbn/vim-relativize'

  " Typescript intellisense "
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " use <Tab> key to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

  " NERDCommenter, to easily comment out lines
  " Allows for comment, nesting, etc
  Plug 'preservim/nerdcommenter'

  " Goyo Vim, for `concentration mode` typing
  Plug 'junegunn/goyo.vim'

  " vim wiki 
  Plug 'vimwiki/vimwiki'

  " COLOR SCHEMES/THEMES  ~~~~~~~~~~~
  Plug 'ray-x/starry.nvim'
  Plug 'cocopon/iceberg.vim'
  Plug 'Mofiqul/adwaita.nvim'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'jnurmine/Zenburn'
  Plug 'chriskempson/base16-vim'
  " ~~~~~~~~~~~

  " Rust Language Syntax
  Plug 'rust-lang/rust.vim'

  Plug 'romgrk/barbar.nvim'

  " insert or delete parenthesis in pair
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/auto-pairs-gentle'

" Prettier, formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'svelte', 'yaml', 'html'] }

" Syntax highlithing
Plug 'sheerun/vim-polyglot'
let g:vim_svelte_plugin_use_typescript = 1

" Adding Git support
Plug 'tpope/vim-fugitive'

" That litle status bar below
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}

" Svelte 
Plug 'leafOfTree/vim-svelte-plugin'

Plug 'lewis6991/gitsigns.nvim'

Plug 'github/copilot.vim'

Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }

call plug#end()
"""""""""""""""""""" COLORS AND SCHEMES AND THINGS
""""""""""""""""""""""""""""
set termguicolors
" Some other ones I liked üëá
" melange, everforest, zenburn
colorscheme base16-atlas
let g:colorscheme_changer_colors=['melange', 'everforest', 'zenburn']

" Font
set guifont=JetBrainsMono\ Nerd\ Font:h15
let g:font_changer_fonts=['MesloLGL\ Nerd\ Font:h12', 'JetBrainsMono\ Nerd\ Font:h12']
nmap <leader>cf :ChangeFont<CR>

" Update time for vim-signify "
set updatetime=100

" Vim Wiki stuff
let g:vimwiki_list = [{'path': '~/Documents/Personal/my-wiki/', 'syntax':'markdown'}]
let g:vimwiki_folding = 'custom'

" For showing relative numbers (vim-relativize) "
set number relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

syntax enable
filetype plugin indent on


" Coc specific
" Coc Code Navigation
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> vgd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format on Save
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Folding
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Change the <leader> key to ',' and add a visual queue of when pressed
" Remember: need to press the next command within 1000ms (default)
let mapleader = ","

" Copying and pasting for NeoVide
" v -> visual
" n -> normal
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p

nnoremap <c-b> :FzfLua buffers<CR>
nnoremap <c-p> :FzfLua git_files<CR>
nnoremap <c-d> :Dash<CR>
nnoremap <c-f> :FzfLua 
nnoremap <c-g> <CMD>Gitsigns blame_line<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Mouse support for neovim
set mouse=a

set termencoding=utf-8
set encoding=utf-8

lua require('gitsigns').setup()
lua require('dash-setup')
