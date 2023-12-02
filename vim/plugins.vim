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
Plug 'mcchrish/zenbones.nvim' " White / dark colorscheme
Plug 'liuchengxu/vim-which-key' " Show leader mapping cheatsheet

" Git integration
Plug 'airblade/vim-gitgutter' " Git diff

" Autocompletion, linter, syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tools
Plug 'wakatime/vim-wakatime' " Wakatime
Plug 'ap/vim-css-color' " rgb, hex color preview

call plug#end()

filetype plugin indent on " Allow filetype detection, plugins, indentation

"""""""""""""""""""""""""
"	Configuration
"""""""""""""""""""""""""
" Netrw (filetree built-in vim)
let g:netrw_keepdir = 0 " Reload buffer usefull when moving or removing file
let g:netrw_winsize = 10 " Size of filetree buffer
let g:netrw_banner = 0 " Removing netrw banner
let g:netrw_localcopydircmd = 'cp -r' " Changing copy command to add recursive copy

" Statusline
let g:currentmode={
	\ 'n'  : 'NORMAL ',
	\ 'v'  : 'VISUAL ',
	\ 'V'  : 'V·Line ',
	\ "\<C-V>" : 'V·Block ',
	\ 'i'  : 'INSERT ',
	\ 'R'  : 'R ',
	\ 'Rv' : 'V·Replace ',
	\ 'c'  : 'Command ',
	\}
set laststatus=2
set statusline=
" VIM Mode
set statusline+=\ %{toupper(g:currentmode[mode()])}%{&spell?'[SPELL]':''}\|
" File (path, modified, readonly ? )
set statusline+=%h\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ ':''}
" Filetype
set statusline+=%=%y
set statusline+=\ \|\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ [%{&fileformat}\]
" Line count and percentage
set statusline+=\ \|\ %l:%c
set statusline+=\ [%p%%]\ 


" Which Key
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map =  {}

" Buffer key help
let g:which_key_map.b = { 
    \ 'name' : '+buffer',
    \ 'd' : 'current buffer close',
    \ 'a' : 'close all buffers',
    \ 'n' : 'go to next buffer',
    \ 'p' : 'go to previous buffer', 
    \ }

" Tab key help
let g:which_key_map.t = { 
    \ 'name' : '+tab',
    \ 't<leader>' : 'go to next tab',
    \ 'n' : 'open new tab',
    \ 'o' : 'close other tabs',
    \ 'c' : 'close current tab',
    \ 'm' : 'move tab after another',
    \ 'l' : 'switch between this & last tab',
    \ 'e' : 'open new tab with current buffer',
    \ }

" Spell key help
let g:which_key_map.s = { 
    \ 'name' : '+spell',
    \ 's' : 'toggle spell check',
    \ 'n' : 'next spell word',
    \ 'p' : 'previous spell word',
    \ 'a' : 'add word in dict',
    \ '?' : 'list word alternatives',
    \ }

" Hunk key help
let g:which_key_map.h = { 
    \ 'name' : '+git hunk',
    \ 'l' : 'remove highlight',
    \ 'p' : 'go previous hunk',
    \ 'n' : 'go next hunk',
    \ 't' : 'enable/disable gitgutter',
    \ 's' : 'stage hunk',
    \ 'u' : 'undo hunk',
    \ 'P' : 'preview hunk',
    \ }

" LSP key help
let g:which_key_map.g = { 
    \ 'name' : '+LSP',
    \ 'd' : 'go to definition',
    \ 'n' : 'next diagnostic',
    \ 'p' : 'previous diagnostic',
    \ 'r' : 'go to reference',
    \ 'R' : 'rename object',
	\ 'y' : 'type definition',
	\ 'i' : 'go to implementation',
	\ 'h' : 'documentation',
	\ 'f' : 'format document',
    \ }
