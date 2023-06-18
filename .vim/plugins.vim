""""""""""""""""""""""""""
"         Plugins
""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" UI & Themes
Plug 'joshdick/onedark.vim' " Onedark themes for vim
Plug 'vim-airline/vim-airline' " Vim statusline
Plug 'preservim/nerdtree' " Filetree in vim
Plug 'ryanoasis/vim-devicons' " Icons for vim

" Git integration
Plug 'tpope/vim-fugitive' " Git commands & informations
Plug 'airblade/vim-gitgutter' " Git diff

" Autocompletion, linter, syntax
Plug 'dense-analysis/ale' " Swiss-knife for all this

call plug#end()

filetype plugin indent on " Allow filetype detection, plugins, indentation

"""""""""""""""""""""""""
"	Configuration
"""""""""""""""""""""""""
" VIM airline
let g:airline_theme='onedark' " Status line color & configuration

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#ale#enabled = 1 " Allow ALE to use status line

" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\ }

let g:ale_completion_enabled = 1
let g:ale_completion_symbols = {
\ 'text': '',
\ 'method': '',
\ 'function': '',
\ 'constructor': '',
\ 'field': '',
\ 'variable': '',
\ 'class': '',
\ 'interface': '',
\ 'module': '',
\ 'property': '',
\ 'unit': 'unit',
\ 'value': 'val',
\ 'enum': '',
\ 'keyword': 'keyword',
\ 'snippet': '',
\ 'color': 'color',
\ 'file': '',
\ 'reference': 'ref',
\ 'folder': '',
\ 'enum member': '',
\ 'constant': '',
\ 'struct': '',
\ 'event': 'event',
\ 'operator': '',
\ 'type_parameter': 'type param',
\ '<default>': 'v'
\ }

" NerdTree
let NERDTreeShowHidden=1 " Show hidden files
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let g:plug_window = 'noautocmd vertical topleft new' " Stop crash if vimplug command called on the nerdtree window

